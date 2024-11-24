#version 430 core
uniform sampler1D _group_0_binding_0_fs;

uniform sampler2D _group_0_binding_1_fs;

uniform sampler2DArray _group_0_binding_4_fs;

uniform samplerCubeArray _group_0_binding_6_fs;

layout(location = 0) out vec4 _fs2p_location0;

void main() {
    vec4 a = vec4(0.0);
    vec2 tc = vec2(0.5);
    vec3 tc3_ = vec3(0.5);
    vec4 _e9 = texture(_group_0_binding_0_fs, tc.x);
    a = (a + _e9);
    vec4 _e14 = texture(_group_0_binding_1_fs, vec2(tc));
    a = (a + _e14);
    vec4 _e19 = textureOffset(_group_0_binding_1_fs, vec2(tc), ivec2(3, 1));
    a = (a + _e19);
    vec4 _e24 = textureLod(_group_0_binding_1_fs, vec2(tc), 2.3);
    a = (a + _e24);
    vec4 _e29 = textureLodOffset(_group_0_binding_1_fs, vec2(tc), 2.3, ivec2(3, 1));
    a = (a + _e29);
    vec4 _e35 = textureOffset(_group_0_binding_1_fs, vec2(tc), ivec2(3, 1), 2.0);
    a = (a + _e35);
    vec4 _e41 = texture(_group_0_binding_4_fs, vec3(tc, 0u));
    a = (a + _e41);
    vec4 _e47 = textureOffset(_group_0_binding_4_fs, vec3(tc, 0u), ivec2(3, 1));
    a = (a + _e47);
    vec4 _e53 = textureLod(_group_0_binding_4_fs, vec3(tc, 0u), 2.3);
    a = (a + _e53);
    vec4 _e59 = textureLodOffset(_group_0_binding_4_fs, vec3(tc, 0u), 2.3, ivec2(3, 1));
    a = (a + _e59);
    vec4 _e66 = textureOffset(_group_0_binding_4_fs, vec3(tc, 0u), ivec2(3, 1), 2.0);
    a = (a + _e66);
    vec4 _e72 = texture(_group_0_binding_4_fs, vec3(tc, 0));
    a = (a + _e72);
    vec4 _e78 = textureOffset(_group_0_binding_4_fs, vec3(tc, 0), ivec2(3, 1));
    a = (a + _e78);
    vec4 _e84 = textureLod(_group_0_binding_4_fs, vec3(tc, 0), 2.3);
    a = (a + _e84);
    vec4 _e90 = textureLodOffset(_group_0_binding_4_fs, vec3(tc, 0), 2.3, ivec2(3, 1));
    a = (a + _e90);
    vec4 _e97 = textureOffset(_group_0_binding_4_fs, vec3(tc, 0), ivec2(3, 1), 2.0);
    a = (a + _e97);
    vec4 _e103 = texture(_group_0_binding_6_fs, vec4(tc3_, 0u));
    a = (a + _e103);
    vec4 _e109 = textureLod(_group_0_binding_6_fs, vec4(tc3_, 0u), 2.3);
    a = (a + _e109);
    vec4 _e116 = texture(_group_0_binding_6_fs, vec4(tc3_, 0u), 2.0);
    a = (a + _e116);
    vec4 _e122 = texture(_group_0_binding_6_fs, vec4(tc3_, 0));
    a = (a + _e122);
    vec4 _e128 = textureLod(_group_0_binding_6_fs, vec4(tc3_, 0), 2.3);
    a = (a + _e128);
    vec4 _e135 = texture(_group_0_binding_6_fs, vec4(tc3_, 0), 2.0);
    a = (a + _e135);
    _fs2p_location0 = a;
    return;
}

