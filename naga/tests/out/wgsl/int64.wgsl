struct UniformCompatible {
    val_u32_: u32,
    val_i32_: i32,
    val_f32_: f32,
    val_u64_: u64,
    val_u64_2_: vec2<u64>,
    val_u64_3_: vec3<u64>,
    val_u64_4_: vec4<u64>,
    val_i64_: i64,
    val_i64_2_: vec2<i64>,
    val_i64_3_: vec3<i64>,
    val_i64_4_: vec4<i64>,
    final_value: u64,
}

struct StorageCompatible {
    val_u64_array_2_: array<u64, 2>,
    val_i64_array_2_: array<i64, 2>,
}

const constant_variable: u64 = 20lu;

var<private> private_variable: i64 = 1li;
@group(0) @binding(0) 
var<uniform> input_uniform: UniformCompatible;
@group(0) @binding(1) 
var<storage> input_storage: UniformCompatible;
@group(0) @binding(2) 
var<storage> input_arrays: StorageCompatible;
@group(0) @binding(3) 
var<storage, read_write> output: UniformCompatible;
@group(0) @binding(4) 
var<storage, read_write> output_arrays: StorageCompatible;

fn int64_function(x: i64) -> i64 {
    var val: i64 = 20li;

    val = (val + (31li - 1002003004005006li));
    val = (val + (val + 5li));
    val = (val + i64((input_uniform.val_u32_ + u32(val))));
    val = (val + i64((input_uniform.val_i32_ + i32(val))));
    val = (val + i64((input_uniform.val_f32_ + f32(val))));
    val = (val + vec3(input_uniform.val_i64_).z);
    val = (val + bitcast<i64>(input_uniform.val_u64_));
    val = (val + bitcast<vec2<i64>>(input_uniform.val_u64_2_).y);
    val = (val + bitcast<vec3<i64>>(input_uniform.val_u64_3_).z);
    val = (val + bitcast<vec4<i64>>(input_uniform.val_u64_4_).w);
    output.val_i64_ = (input_uniform.val_i64_ + input_storage.val_i64_);
    output.val_i64_2_ = (input_uniform.val_i64_2_ + input_storage.val_i64_2_);
    output.val_i64_3_ = (input_uniform.val_i64_3_ + input_storage.val_i64_3_);
    output.val_i64_4_ = (input_uniform.val_i64_4_ + input_storage.val_i64_4_);
    output_arrays.val_i64_array_2_ = input_arrays.val_i64_array_2_;
    val = (val + abs(val));
    val = (val + clamp(val, val, val));
    val = (val + dot(vec2(val), vec2(val)));
    val = (val + max(val, val));
    val = (val + min(val, val));
    val = (val + sign(val));
    return val;
}

fn uint64_function(x_1: u64) -> u64 {
    var val_1: u64 = 20lu;

    val_1 = (val_1 + (31lu + 1002003004005006lu));
    val_1 = (val_1 + (val_1 + 5lu));
    val_1 = (val_1 + u64((input_uniform.val_u32_ + u32(val_1))));
    val_1 = (val_1 + u64((input_uniform.val_i32_ + i32(val_1))));
    val_1 = (val_1 + u64((input_uniform.val_f32_ + f32(val_1))));
    val_1 = (val_1 + vec3(input_uniform.val_u64_).z);
    val_1 = (val_1 + bitcast<u64>(input_uniform.val_i64_));
    val_1 = (val_1 + bitcast<vec2<u64>>(input_uniform.val_i64_2_).y);
    val_1 = (val_1 + bitcast<vec3<u64>>(input_uniform.val_i64_3_).z);
    val_1 = (val_1 + bitcast<vec4<u64>>(input_uniform.val_i64_4_).w);
    output.val_u64_ = (input_uniform.val_u64_ + input_storage.val_u64_);
    output.val_u64_2_ = (input_uniform.val_u64_2_ + input_storage.val_u64_2_);
    output.val_u64_3_ = (input_uniform.val_u64_3_ + input_storage.val_u64_3_);
    output.val_u64_4_ = (input_uniform.val_u64_4_ + input_storage.val_u64_4_);
    output_arrays.val_u64_array_2_ = input_arrays.val_u64_array_2_;
    val_1 = (val_1 + abs(val_1));
    val_1 = (val_1 + clamp(val_1, val_1, val_1));
    val_1 = (val_1 + dot(vec2(val_1), vec2(val_1)));
    val_1 = (val_1 + max(val_1, val_1));
    val_1 = (val_1 + min(val_1, val_1));
    return val_1;
}

@compute @workgroup_size(1, 1, 1) 
fn main() {
    let _e3 = uint64_function(67lu);
    let _e5 = int64_function(60li);
    output.final_value = (_e3 + bitcast<u64>(_e5));
    return;
}
