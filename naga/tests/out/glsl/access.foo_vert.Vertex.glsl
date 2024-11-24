#version 310 es

precision highp float;
precision highp int;

struct GlobalConst {
    uint a;
    uvec3 b;
    int c;
};
struct AlignedWrapper {
    int value;
};
struct Baz {
    mat3x2 m;
};
struct MatCx2InArray {
    mat4x2 am[2];
};
struct AssignToMember {
    uint x;
};
layout(std430) buffer Bar_block_0Vertex {
    mat4x3 _matrix;
    mat2x2 matrix_array[2];
    int atom;
    int atom_arr[10];
    uvec2 arr[2];
    AlignedWrapper data[];
} _group_0_binding_0_vs;

uniform Baz_block_1Vertex { Baz _group_0_binding_1_vs; };

layout(std430) buffer type_13_block_2Vertex { ivec2 _group_0_binding_2_vs; };

uniform MatCx2InArray_block_3Vertex { MatCx2InArray _group_0_binding_3_vs; };


void test_matrix_within_struct_accesses() {
    int idx = 1;
    Baz t = Baz(mat3x2(vec2(1.0), vec2(2.0), vec2(3.0)));
    idx = (idx - 1);
    mat3x2 l0_ = _group_0_binding_1_vs.m;
    vec2 l1_ = _group_0_binding_1_vs.m[0];
    vec2 l2_ = _group_0_binding_1_vs.m[idx];
    float l3_ = _group_0_binding_1_vs.m[0][1];
    float l4_ = _group_0_binding_1_vs.m[0][idx];
    float l5_ = _group_0_binding_1_vs.m[idx][1];
    float l6_ = _group_0_binding_1_vs.m[idx][idx];
    idx = (idx + 1);
    t.m = mat3x2(vec2(6.0), vec2(5.0), vec2(4.0));
    t.m[0] = vec2(9.0);
    t.m[idx] = vec2(90.0);
    t.m[0][1] = 10.0;
    t.m[0][idx] = 20.0;
    t.m[idx][1] = 30.0;
    t.m[idx][idx] = 40.0;
    return;
}

void test_matrix_within_array_within_struct_accesses() {
    int idx_1 = 1;
    MatCx2InArray t_1 = MatCx2InArray(mat4x2[2](mat4x2(0.0), mat4x2(0.0)));
    idx_1 = (idx_1 - 1);
    mat4x2 l0_1[2] = _group_0_binding_3_vs.am;
    mat4x2 l1_1 = _group_0_binding_3_vs.am[0];
    vec2 l2_1 = _group_0_binding_3_vs.am[0][0];
    vec2 l3_1 = _group_0_binding_3_vs.am[0][idx_1];
    float l4_1 = _group_0_binding_3_vs.am[0][0][1];
    float l5_1 = _group_0_binding_3_vs.am[0][0][idx_1];
    float l6_1 = _group_0_binding_3_vs.am[0][idx_1][1];
    float l7_ = _group_0_binding_3_vs.am[0][idx_1][idx_1];
    idx_1 = (idx_1 + 1);
    t_1.am = mat4x2[2](mat4x2(0.0), mat4x2(0.0));
    t_1.am[0] = mat4x2(vec2(8.0), vec2(7.0), vec2(6.0), vec2(5.0));
    t_1.am[0][0] = vec2(9.0);
    t_1.am[0][idx_1] = vec2(90.0);
    t_1.am[0][0][1] = 10.0;
    t_1.am[0][0][idx_1] = 20.0;
    t_1.am[0][idx_1][1] = 30.0;
    t_1.am[0][idx_1][idx_1] = 40.0;
    return;
}

float read_from_private(inout float foo_1) {
    return foo_1;
}

float test_arr_as_arg(float a[5][10]) {
    return a[4][9];
}

void assign_through_ptr_fn(inout uint p) {
    p = 42u;
    return;
}

void assign_array_through_ptr_fn(inout vec4 foo_2[2]) {
    foo_2 = vec4[2](vec4(1.0), vec4(2.0));
    return;
}

uint fetch_arg_ptr_member(inout AssignToMember p_1) {
    return p_1.x;
}

void assign_to_arg_ptr_member(inout AssignToMember p_2) {
    p_2.x = 10u;
    return;
}

uint fetch_arg_ptr_array_element(inout uint p_3[4]) {
    return p_3[1];
}

void assign_to_arg_ptr_array_element(inout uint p_4[4]) {
    p_4[1] = 10u;
    return;
}

void main() {
    uint vi = uint(gl_VertexID);
    float foo = 0.0;
    int c2_[5] = int[5](0, 0, 0, 0, 0);
    float baz_1 = foo;
    foo = 1.0;
    test_matrix_within_struct_accesses();
    test_matrix_within_array_within_struct_accesses();
    mat4x3 _matrix = _group_0_binding_0_vs._matrix;
    uvec2 arr_1[2] = _group_0_binding_0_vs.arr;
    float b = _group_0_binding_0_vs._matrix[3u][0];
    int a_1 = _group_0_binding_0_vs.data[(uint(_group_0_binding_0_vs.data.length()) - 2u)].value;
    ivec2 c = _group_0_binding_2_vs;
    float _e33 = read_from_private(foo);
    c2_ = int[5](a_1, int(b), 3, 4, 5);
    c2_[(vi + 1u)] = 42;
    int value = c2_[vi];
    float _e47 = test_arr_as_arg(float[5][10](float[10](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), float[10](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), float[10](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), float[10](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), float[10](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)));
    gl_Position = vec4((_matrix * vec4(ivec4(value))), 2.0);
    gl_Position.yz = vec2(-gl_Position.y, gl_Position.z * 2.0 - gl_Position.w);
    return;
}

