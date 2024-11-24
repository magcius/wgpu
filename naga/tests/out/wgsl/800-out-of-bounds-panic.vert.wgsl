struct Globals {
    view_matrix: mat4x4<f32>,
}

struct VertexPushConstants {
    world_matrix: mat4x4<f32>,
}

struct VertexOutput {
    @location(0) frag_color: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> global: Globals;
var<push_constant> global_1: VertexPushConstants;
var<private> position_1: vec2<f32>;
var<private> color_1: vec4<f32>;
var<private> frag_color: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    frag_color = color_1;
    let _e12 = position_1;
    gl_Position = ((global.view_matrix * global_1.world_matrix) * vec4<f32>(_e12.x, _e12.y, 0f, 1f));
    gl_Position.z = ((gl_Position.z + gl_Position.w) / 2f);
    return;
}

@vertex 
fn main(@location(0) position: vec2<f32>, @location(1) color: vec4<f32>) -> VertexOutput {
    position_1 = position;
    color_1 = color;
    main_1();
    return VertexOutput(frag_color, gl_Position);
}
