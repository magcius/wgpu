struct CameraViewProj {
    ViewProj: mat4x4<f32>,
}

struct Transform {
    Model: mat4x4<f32>,
}

struct VertexOutput {
    @location(0) v_WorldPosition: vec3<f32>,
    @location(1) v_WorldNormal: vec3<f32>,
    @location(2) v_Uv: vec2<f32>,
    @location(3) v_WorldTangent: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

var<private> Vertex_Position_1: vec3<f32>;
var<private> Vertex_Normal_1: vec3<f32>;
var<private> Vertex_Uv_1: vec2<f32>;
var<private> Vertex_Tangent_1: vec4<f32>;
var<private> v_WorldPosition: vec3<f32>;
var<private> v_WorldNormal: vec3<f32>;
var<private> v_Uv: vec2<f32>;
@group(0) @binding(0) 
var<uniform> global: CameraViewProj;
var<private> v_WorldTangent: vec4<f32>;
@group(2) @binding(0) 
var<uniform> global_1: Transform;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var world_position: vec4<f32>;

    let _e13 = Vertex_Position_1;
    world_position = (global_1.Model * vec4<f32>(_e13.x, _e13.y, _e13.z, 1f));
    v_WorldPosition = world_position.xyz;
    let _e23 = global_1.Model;
    v_WorldNormal = (mat3x3<f32>(_e23[0].xyz, _e23[1].xyz, _e23[2].xyz) * Vertex_Normal_1);
    v_Uv = Vertex_Uv_1;
    let _e36 = global_1.Model;
    let _e48 = (mat3x3<f32>(_e36[0].xyz, _e36[1].xyz, _e36[2].xyz) * Vertex_Tangent_1.xyz);
    v_WorldTangent = vec4<f32>(_e48.x, _e48.y, _e48.z, Vertex_Tangent_1.w);
    gl_Position = (global.ViewProj * world_position);
    return;
}

@vertex 
fn main(@location(0) Vertex_Position: vec3<f32>, @location(1) Vertex_Normal: vec3<f32>, @location(2) Vertex_Uv: vec2<f32>, @location(3) Vertex_Tangent: vec4<f32>) -> VertexOutput {
    Vertex_Position_1 = Vertex_Position;
    Vertex_Normal_1 = Vertex_Normal;
    Vertex_Uv_1 = Vertex_Uv;
    Vertex_Tangent_1 = Vertex_Tangent;
    main_1();
    return VertexOutput(v_WorldPosition, v_WorldNormal, v_Uv, v_WorldTangent, gl_Position);
}
