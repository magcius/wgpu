struct VertexOutput {
    @location(0) v_uv: vec2<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

const c_scale: f32 = 1.2f;

var<private> a_pos_1: vec2<f32>;
var<private> a_uv_1: vec2<f32>;
var<private> v_uv: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    v_uv = a_uv_1;
    let _e7 = (c_scale * a_pos_1);
    gl_Position = vec4<f32>(_e7.x, _e7.y, 0f, 1f);
    return;
}

@vertex 
fn main(@location(0) a_pos: vec2<f32>, @location(1) a_uv: vec2<f32>) -> VertexOutput {
    a_pos_1 = a_pos;
    a_uv_1 = a_uv;
    main_1();
    return VertexOutput(v_uv, gl_Position);
}
