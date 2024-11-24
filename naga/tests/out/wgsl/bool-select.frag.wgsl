struct FragmentOutput {
    @location(0) o_color: vec4<f32>,
}

var<private> o_color: vec4<f32>;

fn TevPerCompGT(a: f32, b: f32) -> f32 {
    var a_1: f32;
    var b_1: f32;

    a_1 = a;
    b_1 = b;
    return select(0f, 1f, (a_1 > b_1));
}

fn TevPerCompGT_1(a_2: vec3<f32>, b_2: vec3<f32>) -> vec3<f32> {
    var a_3: vec3<f32>;
    var b_3: vec3<f32>;

    a_3 = a_2;
    b_3 = b_2;
    return select(vec3(0f), vec3(1f), (a_3 > b_3));
}

fn main_1() {
    let _e7 = TevPerCompGT_1(vec3(3f), vec3(5f));
    o_color.x = _e7.x;
    o_color.y = _e7.y;
    o_color.z = _e7.z;
    let _e17 = TevPerCompGT(3f, 5f);
    o_color.w = _e17;
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    return FragmentOutput(o_color);
}
