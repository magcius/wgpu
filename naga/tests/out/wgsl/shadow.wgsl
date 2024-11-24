struct Globals {
    view_proj: mat4x4<f32>,
    num_lights: vec4<u32>,
}

struct Entity {
    world: mat4x4<f32>,
    color: vec4<f32>,
}

struct VertexOutput {
    @builtin(position) proj_position: vec4<f32>,
    @location(0) world_normal: vec3<f32>,
    @location(1) world_position: vec4<f32>,
}

struct Light {
    proj: mat4x4<f32>,
    pos: vec4<f32>,
    color: vec4<f32>,
}

const c_ambient: vec3<f32> = vec3<f32>(0.05f, 0.05f, 0.05f);
const c_max_lights: u32 = 10u;

@group(0) @binding(0) 
var<uniform> u_globals: Globals;
@group(1) @binding(0) 
var<uniform> u_entity: Entity;
@group(0) @binding(1) 
var<storage> s_lights: array<Light>;
@group(0) @binding(1) 
var<uniform> u_lights: array<Light, 10>;
@group(0) @binding(2) 
var t_shadow: texture_depth_2d_array;
@group(0) @binding(3) 
var sampler_shadow: sampler_comparison;

fn fetch_shadow(light_id: u32, homogeneous_coords: vec4<f32>) -> f32 {
    if (homogeneous_coords.w <= 0f) {
        return 1f;
    }
    const flip_correction = vec2<f32>(0.5f, -0.5f);
    let proj_correction = (1f / homogeneous_coords.w);
    let light_local = (((homogeneous_coords.xy * flip_correction) * proj_correction) + vec2<f32>(0.5f, 0.5f));
    let _e24 = textureSampleCompareLevel(t_shadow, sampler_shadow, light_local, i32(light_id), (homogeneous_coords.z * proj_correction));
    return _e24;
}

@vertex 
fn vs_main(@location(0) @interpolate(flat) position: vec4<i32>, @location(1) @interpolate(flat) normal: vec4<i32>) -> VertexOutput {
    var out: VertexOutput;

    let w = u_entity.world;
    let world_pos = (u_entity.world * vec4<f32>(position));
    out.world_normal = (mat3x3<f32>(w[0].xyz, w[1].xyz, w[2].xyz) * vec3<f32>(normal.xyz));
    out.world_position = world_pos;
    out.proj_position = (u_globals.view_proj * world_pos);
    return out;
}

@fragment 
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    var color: vec3<f32> = c_ambient;
    var i: u32 = 0u;

    let normal_1 = normalize(in.world_normal);
    loop {
        if (i < min(u_globals.num_lights.x, c_max_lights)) {
        } else {
            break;
        }
        {
            let light = s_lights[i];
            let _e23 = fetch_shadow(i, (light.proj * in.world_position));
            let light_dir = normalize((light.pos.xyz - in.world_position.xyz));
            let diffuse = max(0f, dot(normal_1, light_dir));
            color = (color + ((_e23 * diffuse) * light.color.xyz));
        }
        continuing {
            i = (i + 1u);
        }
    }
    return (vec4<f32>(color, 1f) * u_entity.color);
}

@fragment 
fn fs_main_without_storage(in_1: VertexOutput) -> @location(0) vec4<f32> {
    var color_1: vec3<f32> = c_ambient;
    var i_1: u32 = 0u;

    let normal_2 = normalize(in_1.world_normal);
    loop {
        if (i_1 < min(u_globals.num_lights.x, c_max_lights)) {
        } else {
            break;
        }
        {
            let light_1 = u_lights[i_1];
            let _e23 = fetch_shadow(i_1, (light_1.proj * in_1.world_position));
            let light_dir_1 = normalize((light_1.pos.xyz - in_1.world_position.xyz));
            let diffuse_1 = max(0f, dot(normal_2, light_dir_1));
            color_1 = (color_1 + ((_e23 * diffuse_1) * light_1.color.xyz));
        }
        continuing {
            i_1 = (i_1 + 1u);
        }
    }
    return (vec4<f32>(color_1, 1f) * u_entity.color);
}
