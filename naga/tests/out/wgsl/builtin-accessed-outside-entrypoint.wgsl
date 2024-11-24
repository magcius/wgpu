struct gl_PerVertex {
    @builtin(position) gl_Position: vec4<f32>,
    gl_PointSize: f32,
    gl_ClipDistance: array<f32, 1>,
    gl_CullDistance: array<f32, 1>,
}

var<private> unnamed: gl_PerVertex = gl_PerVertex(vec4<f32>(0f, 0f, 0f, 1f), 1f, array<f32, 1>(), array<f32, 1>());
var<private> gl_VertexIndex_1: i32;

fn builtin_usage() {
    unnamed.gl_Position = vec4<f32>(select(1f, -4f, (gl_VertexIndex_1 == 0i)), select(-1f, 4f, (gl_VertexIndex_1 == 2i)), 0f, 1f);
    return;
}

fn main_1() {
    builtin_usage();
    return;
}

@vertex 
fn main(@builtin(vertex_index) gl_VertexIndex: u32) -> @builtin(position) vec4<f32> {
    gl_VertexIndex_1 = i32(gl_VertexIndex);
    main_1();
    unnamed.gl_Position.y = -(unnamed.gl_Position.y);
    return unnamed.gl_Position;
}
