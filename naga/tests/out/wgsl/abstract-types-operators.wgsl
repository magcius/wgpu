const plus_fafaf_1: f32 = 3f;
const plus_fafai_1: f32 = 3f;
const plus_faf_f_1: f32 = 3f;
const plus_faiaf_1: f32 = 3f;
const plus_faiai_1: f32 = 3f;
const plus_fai_f_1: f32 = 3f;
const plus_f_faf_1: f32 = 3f;
const plus_f_fai_1: f32 = 3f;
const plus_f_f_f_1: f32 = 3f;
const plus_iaiai_1: i32 = 3i;
const plus_iai_i_1: i32 = 3i;
const plus_i_iai_1: i32 = 3i;
const plus_i_i_i_1: i32 = 3i;
const plus_uaiai_1: u32 = 3u;
const plus_uai_u_1: u32 = 3u;
const plus_u_uai_1: u32 = 3u;
const plus_u_u_u_1: u32 = 3u;
const bitflip_u_u: u32 = 0u;
const bitflip_uai: u32 = 0u;
const least_i32_: i32 = i32(-2147483648);
const least_f32_: f32 = -340282350000000000000000000000000000000f;
const wgpu_4492_: i32 = i32(-2147483648);
const wgpu_4492_2_: i32 = i32(-2147483648);

var<workgroup> a: array<u32, 64>;

fn runtime_values() {
    var f: f32 = 42f;
    var i: i32 = 43i;
    var u: u32 = 44u;
    var plus_fafaf: f32 = 3f;
    var plus_fafai: f32 = 3f;
    var plus_faf_f: f32;
    var plus_faiaf: f32 = 3f;
    var plus_faiai: f32 = 3f;
    var plus_fai_f: f32;
    var plus_f_faf: f32;
    var plus_f_fai: f32;
    var plus_f_f_f: f32;
    var plus_iaiai: i32 = 3i;
    var plus_iai_i: i32;
    var plus_i_iai: i32;
    var plus_i_i_i: i32;
    var plus_uaiai: u32 = 3u;
    var plus_uai_u: u32;
    var plus_u_uai: u32;
    var plus_u_u_u: u32;

    plus_faf_f = (1f + f);
    plus_fai_f = (1f + f);
    plus_f_faf = (f + 2f);
    plus_f_fai = (f + 2f);
    plus_f_f_f = (f + f);
    plus_iai_i = (1i + i);
    plus_i_iai = (i + 2i);
    plus_i_i_i = (i + i);
    plus_uai_u = (1u + u);
    plus_u_uai = (u + 2u);
    plus_u_u_u = (u + u);
    return;
}

fn wgpu_4445_() {
    return;
}

fn wgpu_4435_() {
    let y = a[(1i - 1i)];
}

