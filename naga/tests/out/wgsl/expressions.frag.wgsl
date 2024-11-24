struct BST {
    data: i32,
}

struct a_buf {
    a: array<f32>,
}

struct TestStruct {
    array_: array<vec4<u32>, 2>,
}

struct FragmentOutput {
    @location(0) o_color: vec4<f32>,
}

const strct: TestStruct = TestStruct(array<vec4<u32>, 2>(vec4(0u), vec4(1u)));

var<private> global: f32;
@group(0) @binding(0) 
var<storage, read_write> global_1: a_buf;
var<private> o_color: vec4<f32>;

fn testBinOpVecFloat(a: vec4<f32>, b: f32) {
    var a_1: vec4<f32>;
    var b_1: f32;
    var v: vec4<f32>;

    a_1 = a;
    b_1 = b;
    v = (a_1 * 2f);
    v = (a_1 / vec4(2f));
    v = (a_1 + vec4(2f));
    v = (a_1 - vec4(2f));
    return;
}

fn testBinOpFloatVec(a_2: vec4<f32>, b_2: f32) {
    var a_3: vec4<f32>;
    var b_3: f32;
    var v_1: vec4<f32>;

    a_3 = a_2;
    b_3 = b_2;
    v_1 = (a_3 * b_3);
    v_1 = (a_3 / vec4(b_3));
    v_1 = (a_3 + vec4(b_3));
    v_1 = (a_3 - vec4(b_3));
    return;
}

fn testBinOpIVecInt(a_4: vec4<i32>, b_4: i32) {
    var a_5: vec4<i32>;
    var b_5: i32;
    var v_2: vec4<i32>;

    a_5 = a_4;
    b_5 = b_4;
    v_2 = (a_5 * b_5);
    v_2 = (a_5 / vec4(b_5));
    v_2 = (a_5 + vec4(b_5));
    v_2 = (a_5 - vec4(b_5));
    v_2 = (a_5 & vec4(b_5));
    v_2 = (a_5 | vec4(b_5));
    v_2 = (a_5 ^ vec4(b_5));
    v_2 = (a_5 >> vec4(u32(b_5)));
    v_2 = (a_5 << vec4(u32(b_5)));
    return;
}

fn testBinOpIntIVec(a_6: i32, b_6: vec4<i32>) {
    var a_7: i32;
    var b_7: vec4<i32>;
    var v_3: vec4<i32>;

    a_7 = a_6;
    b_7 = b_6;
    v_3 = (a_7 * b_7);
    v_3 = (vec4(a_7) + b_7);
    v_3 = (vec4(a_7) - b_7);
    v_3 = (vec4(a_7) & b_7);
    v_3 = (vec4(a_7) | b_7);
    v_3 = (vec4(a_7) ^ b_7);
    return;
}

fn testBinOpUVecUint(a_8: vec4<u32>, b_8: u32) {
    var a_9: vec4<u32>;
    var b_9: u32;
    var v_4: vec4<u32>;

    a_9 = a_8;
    b_9 = b_8;
    v_4 = (a_9 * b_9);
    v_4 = (a_9 / vec4(b_9));
    v_4 = (a_9 + vec4(b_9));
    v_4 = (a_9 - vec4(b_9));
    v_4 = (a_9 & vec4(b_9));
    v_4 = (a_9 | vec4(b_9));
    v_4 = (a_9 ^ vec4(b_9));
    v_4 = (a_9 >> vec4(b_9));
    v_4 = (a_9 << vec4(b_9));
    return;
}

fn testBinOpUintUVec(a_10: u32, b_10: vec4<u32>) {
    var a_11: u32;
    var b_11: vec4<u32>;
    var v_5: vec4<u32>;

    a_11 = a_10;
    b_11 = b_10;
    v_5 = (a_11 * b_11);
    v_5 = (vec4(a_11) + b_11);
    v_5 = (vec4(a_11) - b_11);
    v_5 = (vec4(a_11) & b_11);
    v_5 = (vec4(a_11) | b_11);
    v_5 = (vec4(a_11) ^ b_11);
    return;
}

fn testBinOpMatMat(a_12: mat3x3<f32>, b_12: mat3x3<f32>) {
    var a_13: mat3x3<f32>;
    var b_13: mat3x3<f32>;
    var v_6: mat3x3<f32>;
    var c: bool;

    a_13 = a_12;
    b_13 = b_12;
    let _e6 = a_13;
    let _e7 = b_13;
    v_6 = mat3x3<f32>((_e6[0] / _e7[0]), (_e6[1] / _e7[1]), (_e6[2] / _e7[2]));
    v_6 = (a_13 * b_13);
    v_6 = (a_13 + b_13);
    v_6 = (a_13 - b_13);
    let _e27 = a_13;
    let _e28 = b_13;
    c = (all((_e27[2] == _e28[2])) && (all((_e27[1] == _e28[1])) && all((_e27[0] == _e28[0]))));
    let _e43 = a_13;
    let _e44 = b_13;
    c = (any((_e43[2] != _e44[2])) || (any((_e43[1] != _e44[1])) || any((_e43[0] != _e44[0]))));
    return;
}

fn testBinOpMatFloat(a_14: f32, b_14: mat3x3<f32>) {
    var a_15: f32;
    var b_15: mat3x3<f32>;
    var v_7: mat3x3<f32>;

    a_15 = a_14;
    b_15 = b_14;
    let _e6 = b_15;
    let _e7 = vec3(a_15);
    v_7 = mat3x3<f32>((_e7 / _e6[0]), (_e7 / _e6[1]), (_e7 / _e6[2]));
    v_7 = (a_15 * b_15);
    let _e19 = b_15;
    let _e20 = vec3(a_15);
    v_7 = mat3x3<f32>((_e20 + _e19[0]), (_e20 + _e19[1]), (_e20 + _e19[2]));
    let _e29 = b_15;
    let _e30 = vec3(a_15);
    v_7 = mat3x3<f32>((_e30 - _e29[0]), (_e30 - _e29[1]), (_e30 - _e29[2]));
    let _e38 = b_15;
    let _e40 = vec3(a_15);
    v_7 = mat3x3<f32>((_e38[0] / _e40), (_e38[1] / _e40), (_e38[2] / _e40));
    v_7 = (b_15 * a_15);
    let _e51 = b_15;
    let _e53 = vec3(a_15);
    v_7 = mat3x3<f32>((_e51[0] + _e53), (_e51[1] + _e53), (_e51[2] + _e53));
    let _e61 = b_15;
    let _e63 = vec3(a_15);
    v_7 = mat3x3<f32>((_e61[0] - _e63), (_e61[1] - _e63), (_e61[2] - _e63));
    return;
}

fn testUnaryOpMat(a_16: mat3x3<f32>) {
    var a_17: mat3x3<f32>;
    var v_8: mat3x3<f32>;

    a_17 = a_16;
    v_8 = -(a_17);
    const _e7 = vec3(1f);
    let _e9 = (a_17 - mat3x3<f32>(_e7, _e7, _e7));
    a_17 = _e9;
    v_8 = _e9;
    let _e10 = a_17;
    const _e12 = vec3(1f);
    a_17 = (_e10 - mat3x3<f32>(_e12, _e12, _e12));
    v_8 = _e10;
    return;
}

fn testStructConstructor() {
    var tree: BST = BST(1i);

}

fn testNonScalarToScalarConstructor() {
    var f: f32 = 1f;

}

fn testArrayConstructor() {
    var tree_1: array<f32, 1> = array<f32, 1>(0f);

}

fn testFreestandingConstructor() {
    return;
}

fn testNonImplicitCastVectorCast() {
    var a_18: u32 = 1u;
    var b_16: vec4<i32>;

    b_16 = vec4(i32(a_18));
    return;
}

fn privatePointer(a_19: ptr<function, f32>) {
    return;
}

fn ternary(a_20: bool) {
    var a_21: bool;
    var local: u32;
    var b_17: u32;
    var local_1: u32;
    var c_1: u32;
    var local_2: u32;
    var local_3: u32;
    var local_4: u32;
    var nested: u32;

    a_21 = a_20;
    if a_21 {
        local = 0u;
    } else {
        local = 1u;
    }
    b_17 = local;
    if a_21 {
        local_1 = 0u;
    } else {
        local_1 = 1u;
    }
    c_1 = local_1;
    if a_21 {
        if a_21 {
            if a_21 {
                local_2 = 2u;
            } else {
                local_2 = 3u;
            }
            local_3 = local_2;
        } else {
            local_3 = 4u;
        }
        local_4 = local_3;
    } else {
        local_4 = 5u;
    }
    nested = local_4;
    return;
}

fn testMatrixMultiplication(a_22: mat4x3<f32>, b_18: mat4x4<f32>) {
    var a_23: mat4x3<f32>;
    var b_19: mat4x4<f32>;
    var c_2: mat4x3<f32>;

    a_23 = a_22;
    b_19 = b_18;
    c_2 = (a_23 * b_19);
    return;
}

fn testLength() {
    var len: i32;

    len = i32(arrayLength((&global_1.a)));
    return;
}

fn testConstantLength(a_24: array<f32, 4>) {
    var a_25: array<f32, 4>;
    var len_1: i32 = 4i;

    a_25 = a_24;
}

fn indexConstantNonConstantIndex(i: i32) {
    var i_1: i32;
    var local_5: TestStruct = strct;
    var a_26: vec4<u32>;

    i_1 = i;
    a_26 = local_5.array_[i_1];
    return;
}

fn testSwizzleWrites(a_27: vec3<f32>) {
    var a_28: vec3<f32>;

    a_28 = a_27;
    let _e6 = a_28;
    a_28.z = 3f;
    a_28.x = 4f;
    let _e19 = (a_28.xy * 5f);
    a_28.x = _e19.x;
    a_28.y = _e19.y;
    let _e28 = (a_28.zy + vec2(1f));
    a_28.z = _e28.x;
    a_28.y = _e28.y;
    return;
}

fn main_1() {
    var local_6: f32;

    local_6 = global;
    privatePointer((&local_6));
    global = local_6;
    o_color.x = 1f;
    o_color.y = 1f;
    o_color.z = 1f;
    o_color.w = 1f;
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    return FragmentOutput(o_color);
}
