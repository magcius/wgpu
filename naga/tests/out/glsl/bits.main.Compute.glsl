#version 310 es

precision highp float;
precision highp int;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;


void main() {
    int i = 0;
    ivec2 i2_ = ivec2(0);
    ivec3 i3_ = ivec3(0);
    ivec4 i4_ = ivec4(0);
    uint u = 0u;
    uvec2 u2_ = uvec2(0u);
    uvec3 u3_ = uvec3(0u);
    uvec4 u4_ = uvec4(0u);
    vec2 f2_ = vec2(0.0);
    vec4 f4_ = vec4(0.0);
    u = packSnorm4x8(f4_);
    u = packUnorm4x8(f4_);
    u = packSnorm2x16(f2_);
    u = packUnorm2x16(f2_);
    u = packHalf2x16(f2_);
    ivec4 _e38 = i4_;
    u = uint((_e38[0] & 0xFF) | ((_e38[1] & 0xFF) << 8) | ((_e38[2] & 0xFF) << 16) | ((_e38[3] & 0xFF) << 24));
    uvec4 _e40 = u4_;
    u = (_e40[0] & 0xFFu) | ((_e40[1] & 0xFFu) << 8) | ((_e40[2] & 0xFFu) << 16) | ((_e40[3] & 0xFFu) << 24);
    f4_ = unpackSnorm4x8(u);
    f4_ = unpackUnorm4x8(u);
    f2_ = unpackSnorm2x16(u);
    f2_ = unpackUnorm2x16(u);
    f2_ = unpackHalf2x16(u);
    uint _e52 = u;
    i4_ = ivec4(bitfieldExtract(int(_e52), 0, 8), bitfieldExtract(int(_e52), 8, 8), bitfieldExtract(int(_e52), 16, 8), bitfieldExtract(int(_e52), 24, 8));
    uint _e54 = u;
    u4_ = uvec4(bitfieldExtract(_e54, 0, 8), bitfieldExtract(_e54, 8, 8), bitfieldExtract(_e54, 16, 8), bitfieldExtract(_e54, 24, 8));
    i = bitfieldInsert(i, i, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i2_ = bitfieldInsert(i2_, i2_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i3_ = bitfieldInsert(i3_, i3_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i4_ = bitfieldInsert(i4_, i4_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u = bitfieldInsert(u, u, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u2_ = bitfieldInsert(u2_, u2_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u3_ = bitfieldInsert(u3_, u3_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u4_ = bitfieldInsert(u4_, u4_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i = bitfieldExtract(i, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i2_ = bitfieldExtract(i2_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i3_ = bitfieldExtract(i3_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i4_ = bitfieldExtract(i4_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u = bitfieldExtract(u, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u2_ = bitfieldExtract(u2_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u3_ = bitfieldExtract(u3_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    u4_ = bitfieldExtract(u4_, int(min(5u, 32u)), int(min(10u, 32u - min(5u, 32u))));
    i = findLSB(i);
    u2_ = uvec2(findLSB(u2_));
    i3_ = findMSB(i3_);
    u3_ = uvec3(findMSB(u3_));
    i = findMSB(i);
    u = uint(findMSB(u));
    i = bitCount(i);
    i2_ = bitCount(i2_);
    i3_ = bitCount(i3_);
    i4_ = bitCount(i4_);
    u = uint(bitCount(u));
    u2_ = uvec2(bitCount(u2_));
    u3_ = uvec3(bitCount(u3_));
    u4_ = uvec4(bitCount(u4_));
    i = bitfieldReverse(i);
    i2_ = bitfieldReverse(i2_);
    i3_ = bitfieldReverse(i3_);
    i4_ = bitfieldReverse(i4_);
    u = bitfieldReverse(u);
    u2_ = bitfieldReverse(u2_);
    u3_ = bitfieldReverse(u3_);
    u4_ = bitfieldReverse(u4_);
    return;
}

