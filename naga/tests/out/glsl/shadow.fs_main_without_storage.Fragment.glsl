#version 310 es

precision highp float;
precision highp int;

struct Globals {
    mat4x4 view_proj;
    uvec4 num_lights;
};
struct Entity {
    mat4x4 world;
    vec4 color;
};
struct VertexOutput {
    vec4 proj_position;
    vec3 world_normal;
    vec4 world_position;
};
struct Light {
    mat4x4 proj;
    vec4 pos;
    vec4 color;
};
const vec3 c_ambient = vec3(0.05, 0.05, 0.05);
const uint c_max_lights = 10u;

uniform Globals_block_0Fragment { Globals _group_0_binding_0_fs; };

uniform Entity_block_1Fragment { Entity _group_1_binding_0_fs; };

uniform type_9_block_2Fragment { Light _group_0_binding_1_fs[10]; };

uniform highp sampler2DArrayShadow _group_0_binding_2_fs;

layout(location = 0) smooth in vec3 _vs2fs_location0;
layout(location = 1) smooth in vec4 _vs2fs_location1;
layout(location = 0) out vec4 _fs2p_location0;

float fetch_shadow(uint light_id, vec4 homogeneous_coords) {
    if ((homogeneous_coords.w <= 0.0)) {
        return 1.0;
    }
    vec2 flip_correction = vec2(0.5, -0.5);
    float proj_correction = (1.0 / homogeneous_coords.w);
    vec2 light_local = (((homogeneous_coords.xy * flip_correction) * proj_correction) + vec2(0.5, 0.5));
    float _e24 = textureGrad(_group_0_binding_2_fs, vec4(light_local, int(light_id), (homogeneous_coords.z * proj_correction)), vec2(0.0), vec2(0.0));
    return _e24;
}

void main() {
    VertexOutput in_1 = VertexOutput(gl_FragCoord, _vs2fs_location0, _vs2fs_location1);
    vec3 color_1 = c_ambient;
    uint i_1 = 0u;
    vec3 normal_1 = normalize(in_1.world_normal);
    bool loop_init = true;
    while(true) {
        if (!loop_init) {
            i_1 = (i_1 + 1u);
        }
        loop_init = false;
        if ((i_1 < min(_group_0_binding_0_fs.num_lights.x, c_max_lights))) {
        } else {
            break;
        }
        {
            Light light = _group_0_binding_1_fs[i_1];
            float _e23 = fetch_shadow(i_1, (light.proj * in_1.world_position));
            vec3 light_dir = normalize((light.pos.xyz - in_1.world_position.xyz));
            float diffuse = max(0.0, dot(normal_1, light_dir));
            color_1 = (color_1 + ((_e23 * diffuse) * light.color.xyz));
        }
    }
    _fs2p_location0 = (vec4(color_1, 1.0) * _group_1_binding_0_fs.color);
    return;
}

