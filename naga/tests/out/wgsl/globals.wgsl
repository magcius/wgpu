struct FooStruct {
    v3_: vec3<f32>,
    v1_: f32,
}

const Foo_1: bool = true;

var<workgroup> wg: array<f32, 10>;
var<workgroup> at_1: atomic<u32>;
@group(0) @binding(1) 
var<storage, read_write> alignment: FooStruct;
@group(0) @binding(2) 
var<storage> dummy: array<vec2<f32>>;
@group(0) @binding(3) 
var<uniform> float_vecs: array<vec4<f32>, 20>;
@group(0) @binding(4) 
var<uniform> global_vec: vec3<f32>;
@group(0) @binding(5) 
var<uniform> global_mat: mat3x2<f32>;
@group(0) @binding(6) 
var<uniform> global_nested_arrays_of_matrices_2x4_: array<array<mat2x4<f32>, 2>, 2>;
@group(0) @binding(7) 
var<uniform> global_nested_arrays_of_matrices_4x2_: array<array<mat4x2<f32>, 2>, 2>;

fn test_msl_packed_vec3_as_arg(arg: vec3<f32>) {
    return;
}

fn test_msl_packed_vec3_() {
    var idx: i32 = 1i;

    alignment.v3_ = vec3(1f);
    alignment.v3_.x = 1f;
    alignment.v3_.x = 2f;
    alignment.v3_[idx] = 3f;
    let data = alignment;
    let l0_ = data.v3_;
    let l1_ = data.v3_.zx;
    test_msl_packed_vec3_as_arg(data.v3_);
    let mvm0_ = (data.v3_ * mat3x3<f32>());
    let mvm1_ = (mat3x3<f32>() * data.v3_);
    let svm0_ = (data.v3_ * 2f);
    let svm1_ = (2f * data.v3_);
}

@compute @workgroup_size(1, 1, 1) 
fn main() {
    var Foo: f32 = 1f;
    var at: bool = true;

    test_msl_packed_vec3_();
    wg[7] = (global_nested_arrays_of_matrices_4x2_[0][0] * global_nested_arrays_of_matrices_2x4_[0][0][0]).x;
    wg[6] = (global_mat * global_vec).x;
    wg[5] = dummy[1].y;
    wg[4] = float_vecs[0].w;
    wg[3] = alignment.v1_;
    wg[2] = alignment.v3_.x;
    alignment.v1_ = 4f;
    wg[1] = f32(arrayLength((&dummy)));
    atomicStore((&at_1), 2u);
    return;
}
