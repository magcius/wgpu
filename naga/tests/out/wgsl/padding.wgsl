struct S {
    a: vec3<f32>,
}

struct Test {
    a: S,
    b: f32,
}

struct Test2_ {
    a: array<vec3<f32>, 2>,
    b: f32,
}

struct Test3_ {
    a: mat4x3<f32>,
    b: f32,
}

@group(0) @binding(0) 
var<uniform> input1_: Test;
@group(0) @binding(1) 
var<uniform> input2_: Test2_;
@group(0) @binding(2) 
var<uniform> input3_: Test3_;

@vertex 
fn vertex() -> @builtin(position) vec4<f32> {
    return (((vec4(1f) * input1_.b) * input2_.b) * input3_.b);
}
