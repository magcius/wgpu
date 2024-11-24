struct Mat4x3_ {
    mx: vec4<f32>,
    my: vec4<f32>,
    mz: vec4<f32>,
}

struct FragmentOutput {
    @location(0) o_color: vec4<f32>,
}

var<private> o_color: vec4<f32>;

fn Fma(d: ptr<function, Mat4x3_>, m: Mat4x3_, s: f32) {
    var m_1: Mat4x3_;
    var s_1: f32;

    m_1 = m;
    s_1 = s;
    (*d).mx = ((*d).mx + (m_1.mx * s_1));
    (*d).my = ((*d).my + (m_1.my * s_1));
    (*d).mz = ((*d).mz + (m_1.mz * s_1));
    return;
}

fn main_1() {
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
