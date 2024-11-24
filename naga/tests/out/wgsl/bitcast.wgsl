@compute @workgroup_size(1, 1, 1) 
fn main() {
    var i2_: vec2<i32> = vec2(0i);
    var i3_: vec3<i32> = vec3(0i);
    var i4_: vec4<i32> = vec4(0i);
    var u2_: vec2<u32> = vec2(0u);
    var u3_: vec3<u32> = vec3(0u);
    var u4_: vec4<u32> = vec4(0u);
    var f2_: vec2<f32> = vec2(0f);
    var f3_: vec3<f32> = vec3(0f);
    var f4_: vec4<f32> = vec4(0f);

    u2_ = bitcast<vec2<u32>>(i2_);
    u3_ = bitcast<vec3<u32>>(i3_);
    u4_ = bitcast<vec4<u32>>(i4_);
    i2_ = bitcast<vec2<i32>>(u2_);
    i3_ = bitcast<vec3<i32>>(u3_);
    i4_ = bitcast<vec4<i32>>(u4_);
    f2_ = bitcast<vec2<f32>>(i2_);
    f3_ = bitcast<vec3<f32>>(i3_);
    f4_ = bitcast<vec4<f32>>(i4_);
    return;
}
