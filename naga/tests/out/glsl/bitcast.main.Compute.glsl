#version 310 es

precision highp float;
precision highp int;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;


void main() {
    ivec2 i2_ = ivec2(0);
    ivec3 i3_ = ivec3(0);
    ivec4 i4_ = ivec4(0);
    uvec2 u2_ = uvec2(0u);
    uvec3 u3_ = uvec3(0u);
    uvec4 u4_ = uvec4(0u);
    vec2 f2_ = vec2(0.0);
    vec3 f3_ = vec3(0.0);
    vec4 f4_ = vec4(0.0);
    u2_ = uvec2(i2_);
    u3_ = uvec3(i3_);
    u4_ = uvec4(i4_);
    i2_ = ivec2(u2_);
    i3_ = ivec3(u3_);
    i4_ = ivec4(u4_);
    f2_ = intBitsToFloat(i2_);
    f3_ = intBitsToFloat(i3_);
    f4_ = intBitsToFloat(i4_);
    return;
}

