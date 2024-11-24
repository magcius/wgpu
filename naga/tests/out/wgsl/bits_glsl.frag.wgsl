fn main_1() {
    var i: i32 = 0i;
    var i2_: vec2<i32> = vec2(0i);
    var i3_: vec3<i32> = vec3(0i);
    var i4_: vec4<i32> = vec4(0i);
    var u: u32 = 0u;
    var u2_: vec2<u32> = vec2(0u);
    var u3_: vec3<u32> = vec3(0u);
    var u4_: vec4<u32> = vec4(0u);
    var f2_: vec2<f32> = vec2(0f);
    var f4_: vec4<f32> = vec4(0f);

    u = pack4x8snorm(f4_);
    u = pack4x8unorm(f4_);
    u = pack2x16unorm(f2_);
    u = pack2x16snorm(f2_);
    u = pack2x16float(f2_);
    f4_ = unpack4x8snorm(u);
    f4_ = unpack4x8unorm(u);
    f2_ = unpack2x16snorm(u);
    f2_ = unpack2x16unorm(u);
    f2_ = unpack2x16float(u);
    i = insertBits(i, i, 5u, 10u);
    i2_ = insertBits(i2_, i2_, 5u, 10u);
    i3_ = insertBits(i3_, i3_, 5u, 10u);
    i4_ = insertBits(i4_, i4_, 5u, 10u);
    u = insertBits(u, u, 5u, 10u);
    u2_ = insertBits(u2_, u2_, 5u, 10u);
    u3_ = insertBits(u3_, u3_, 5u, 10u);
    u4_ = insertBits(u4_, u4_, 5u, 10u);
    i = extractBits(i, 5u, 10u);
    i2_ = extractBits(i2_, 5u, 10u);
    i3_ = extractBits(i3_, 5u, 10u);
    i4_ = extractBits(i4_, 5u, 10u);
    u = extractBits(u, 5u, 10u);
    u2_ = extractBits(u2_, 5u, 10u);
    u3_ = extractBits(u3_, 5u, 10u);
    u4_ = extractBits(u4_, 5u, 10u);
    i = firstTrailingBit(i);
    i2_ = firstTrailingBit(i2_);
    i3_ = firstTrailingBit(i3_);
    i4_ = firstTrailingBit(i4_);
    i = i32(firstTrailingBit(u));
    i2_ = vec2<i32>(firstTrailingBit(u2_));
    i3_ = vec3<i32>(firstTrailingBit(u3_));
    i4_ = vec4<i32>(firstTrailingBit(u4_));
    i = firstLeadingBit(i);
    i2_ = firstLeadingBit(i2_);
    i3_ = firstLeadingBit(i3_);
    i4_ = firstLeadingBit(i4_);
    i = i32(firstLeadingBit(u));
    i2_ = vec2<i32>(firstLeadingBit(u2_));
    i3_ = vec3<i32>(firstLeadingBit(u3_));
    i4_ = vec4<i32>(firstLeadingBit(u4_));
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
