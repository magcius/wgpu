struct PointLight {
    pos: vec4<f32>,
    color: vec4<f32>,
    lightParams: vec4<f32>,
}

struct DirectionalLight {
    direction: vec4<f32>,
    color: vec4<f32>,
}

struct CameraViewProj {
    ViewProj: mat4x4<f32>,
}

struct CameraPosition {
    CameraPos: vec4<f32>,
}

struct Lights {
    AmbientColor: vec4<f32>,
    NumLights: vec4<u32>,
    PointLights: array<PointLight, 10>,
    DirectionalLights: array<DirectionalLight, 1>,
}

struct StandardMaterial_base_color {
    base_color: vec4<f32>,
}

struct StandardMaterial_roughness {
    perceptual_roughness: f32,
}

struct StandardMaterial_metallic {
    metallic: f32,
}

struct StandardMaterial_reflectance {
    reflectance: f32,
}

struct StandardMaterial_emissive {
    emissive: vec4<f32>,
}

struct FragmentOutput {
    @location(0) o_Target: vec4<f32>,
}

const MAX_POINT_LIGHTS: i32 = 10i;
const MAX_DIRECTIONAL_LIGHTS: i32 = 1i;
const PI: f32 = 3.1415927f;

var<private> v_WorldPosition_1: vec3<f32>;
var<private> v_WorldNormal_1: vec3<f32>;
var<private> v_Uv_1: vec2<f32>;
var<private> v_WorldTangent_1: vec4<f32>;
var<private> o_Target: vec4<f32>;
@group(0) @binding(0) 
var<uniform> global: CameraViewProj;
@group(0) @binding(1) 
var<uniform> global_1: CameraPosition;
@group(1) @binding(0) 
var<uniform> global_2: Lights;
@group(3) @binding(0) 
var<uniform> global_3: StandardMaterial_base_color;
@group(3) @binding(1) 
var StandardMaterial_base_color_texture: texture_2d<f32>;
@group(3) @binding(2) 
var StandardMaterial_base_color_texture_sampler: sampler;
@group(3) @binding(3) 
var<uniform> global_4: StandardMaterial_roughness;
@group(3) @binding(4) 
var<uniform> global_5: StandardMaterial_metallic;
@group(3) @binding(5) 
var StandardMaterial_metallic_roughness_texture: texture_2d<f32>;
@group(3) @binding(6) 
var StandardMaterial_metallic_roughness_texture_sampler: sampler;
@group(3) @binding(7) 
var<uniform> global_6: StandardMaterial_reflectance;
@group(3) @binding(8) 
var StandardMaterial_normal_map: texture_2d<f32>;
@group(3) @binding(9) 
var StandardMaterial_normal_map_sampler: sampler;
@group(3) @binding(10) 
var StandardMaterial_occlusion_texture: texture_2d<f32>;
@group(3) @binding(11) 
var StandardMaterial_occlusion_texture_sampler: sampler;
@group(3) @binding(12) 
var<uniform> global_7: StandardMaterial_emissive;
@group(3) @binding(13) 
var StandardMaterial_emissive_texture: texture_2d<f32>;
@group(3) @binding(14) 
var StandardMaterial_emissive_texture_sampler: sampler;
var<private> gl_FrontFacing_1: bool;

fn pow5_(x: f32) -> f32 {
    var x_1: f32;
    var x2_: f32;

    x_1 = x;
    x2_ = (x_1 * x_1);
    return ((x2_ * x2_) * x_1);
}

fn getDistanceAttenuation(distanceSquare: f32, inverseRangeSquared: f32) -> f32 {
    var distanceSquare_1: f32;
    var inverseRangeSquared_1: f32;
    var factor: f32;
    var smoothFactor: f32;
    var attenuation: f32;

    distanceSquare_1 = distanceSquare;
    inverseRangeSquared_1 = inverseRangeSquared;
    factor = (distanceSquare_1 * inverseRangeSquared_1);
    smoothFactor = clamp((1f - (factor * factor)), 0f, 1f);
    attenuation = (smoothFactor * smoothFactor);
    return ((attenuation * 1f) / max(distanceSquare_1, 0.001f));
}

fn D_GGX(roughness: f32, NoH: f32, h: vec3<f32>) -> f32 {
    var roughness_1: f32;
    var NoH_1: f32;
    var oneMinusNoHSquared: f32;
    var a: f32;
    var k: f32;
    var d: f32;

    roughness_1 = roughness;
    NoH_1 = NoH;
    oneMinusNoHSquared = (1f - (NoH_1 * NoH_1));
    a = (NoH_1 * roughness_1);
    k = (roughness_1 / (oneMinusNoHSquared + (a * a)));
    d = ((k * k) * 0.31830987f);
    return d;
}

fn V_SmithGGXCorrelated(roughness_2: f32, NoV: f32, NoL: f32) -> f32 {
    var roughness_3: f32;
    var NoV_1: f32;
    var NoL_1: f32;
    var a2_: f32;
    var lambdaV: f32;
    var lambdaL: f32;
    var v: f32;

    roughness_3 = roughness_2;
    NoV_1 = NoV;
    NoL_1 = NoL;
    a2_ = (roughness_3 * roughness_3);
    lambdaV = (NoL_1 * sqrt((((NoV_1 - (a2_ * NoV_1)) * NoV_1) + a2_)));
    lambdaL = (NoV_1 * sqrt((((NoL_1 - (a2_ * NoL_1)) * NoL_1) + a2_)));
    v = (0.5f / (lambdaV + lambdaL));
    return v;
}

fn F_Schlick(f0_: vec3<f32>, f90_: f32, VoH: f32) -> vec3<f32> {
    var f90_1: f32;
    var VoH_1: f32;

    f90_1 = f90_;
    VoH_1 = VoH;
    let _e51 = pow5_((1f - VoH_1));
    return (f0_ + ((vec3(f90_1) - f0_) * _e51));
}

fn F_Schlick_1(f0_1: f32, f90_2: f32, VoH_2: f32) -> f32 {
    var f0_2: f32;
    var f90_3: f32;
    var VoH_3: f32;

    f0_2 = f0_1;
    f90_3 = f90_2;
    VoH_3 = VoH_2;
    let _e53 = pow5_((1f - VoH_3));
    return (f0_2 + ((f90_3 - f0_2) * _e53));
}

fn fresnel(f0_3: vec3<f32>, LoH: f32) -> vec3<f32> {
    var f0_4: vec3<f32>;
    var LoH_1: f32;
    var f90_4: f32;

    f0_4 = f0_3;
    LoH_1 = LoH;
    f90_4 = clamp(dot(f0_4, vec3(16.5f)), 0f, 1f);
    let _e57 = F_Schlick(f0_4, f90_4, LoH_1);
    return _e57;
}

fn specular(f0_5: vec3<f32>, roughness_4: f32, h_1: vec3<f32>, NoV_2: f32, NoL_2: f32, NoH_2: f32, LoH_2: f32, specularIntensity: f32) -> vec3<f32> {
    var f0_6: vec3<f32>;
    var roughness_5: f32;
    var NoV_3: f32;
    var NoL_3: f32;
    var NoH_3: f32;
    var LoH_3: f32;
    var specularIntensity_1: f32;
    var D: f32;
    var V: f32;
    var F: vec3<f32>;

    f0_6 = f0_5;
    roughness_5 = roughness_4;
    NoV_3 = NoV_2;
    NoL_3 = NoL_2;
    NoH_3 = NoH_2;
    LoH_3 = LoH_2;
    specularIntensity_1 = specularIntensity;
    let _e57 = D_GGX(roughness_5, NoH_3, h_1);
    D = _e57;
    let _e62 = V_SmithGGXCorrelated(roughness_5, NoV_3, NoL_3);
    V = _e62;
    let _e66 = fresnel(f0_6, LoH_3);
    F = _e66;
    return (((specularIntensity_1 * D) * V) * F);
}

fn Fd_Burley(roughness_6: f32, NoV_4: f32, NoL_4: f32, LoH_4: f32) -> f32 {
    var roughness_7: f32;
    var NoV_5: f32;
    var NoL_5: f32;
    var LoH_5: f32;
    var f90_5: f32;
    var lightScatter: f32;
    var viewScatter: f32;

    roughness_7 = roughness_6;
    NoV_5 = NoV_4;
    NoL_5 = NoL_4;
    LoH_5 = LoH_4;
    f90_5 = (0.5f + (((2f * roughness_7) * LoH_5) * LoH_5));
    let _e61 = F_Schlick_1(1f, f90_5, NoL_5);
    lightScatter = _e61;
    let _e66 = F_Schlick_1(1f, f90_5, NoV_5);
    viewScatter = _e66;
    return ((lightScatter * viewScatter) * 0.31830987f);
}

fn EnvBRDFApprox(f0_7: vec3<f32>, perceptual_roughness: f32, NoV_6: f32) -> vec3<f32> {
    var f0_8: vec3<f32>;
    var perceptual_roughness_1: f32;
    var NoV_7: f32;
    var c0_: vec4<f32> = vec4<f32>(-1f, -0.0275f, -0.572f, 0.022f);
    var c1_: vec4<f32> = vec4<f32>(1f, 0.0425f, 1.04f, -0.04f);
    var r: vec4<f32>;
    var a004_: f32;
    var AB: vec2<f32>;

    f0_8 = f0_7;
    perceptual_roughness_1 = perceptual_roughness;
    NoV_7 = NoV_6;
    r = ((vec4(perceptual_roughness_1) * c0_) + c1_);
    a004_ = ((min((r.x * r.x), exp2((-9.28f * NoV_7))) * r.x) + r.y);
    AB = ((vec2<f32>(-1.04f, 1.04f) * vec2(a004_)) + r.zw);
    return ((f0_8 * vec3(AB.x)) + vec3(AB.y));
}

fn perceptualRoughnessToRoughness(perceptualRoughness: f32) -> f32 {
    var perceptualRoughness_1: f32;
    var clampedPerceptualRoughness: f32;

    perceptualRoughness_1 = perceptualRoughness;
    clampedPerceptualRoughness = clamp(perceptualRoughness_1, 0.089f, 1f);
    return (clampedPerceptualRoughness * clampedPerceptualRoughness);
}

fn reinhard(color: vec3<f32>) -> vec3<f32> {
    var color_1: vec3<f32>;

    color_1 = color;
    return (color_1 / (vec3(1f) + color_1));
}

fn reinhard_extended(color_2: vec3<f32>, max_white: f32) -> vec3<f32> {
    var color_3: vec3<f32>;
    var max_white_1: f32;
    var numerator: vec3<f32>;

    color_3 = color_2;
    max_white_1 = max_white;
    numerator = (color_3 * (vec3(1f) + (color_3 / vec3((max_white_1 * max_white_1)))));
    return (numerator / (vec3(1f) + color_3));
}

fn luminance(v_1: vec3<f32>) -> f32 {
    var v_2: vec3<f32>;

    v_2 = v_1;
    return dot(v_2, vec3<f32>(0.2126f, 0.7152f, 0.0722f));
}

fn change_luminance(c_in: vec3<f32>, l_out: f32) -> vec3<f32> {
    var c_in_1: vec3<f32>;
    var l_out_1: f32;
    var l_in: f32;

    c_in_1 = c_in;
    l_out_1 = l_out;
    let _e45 = luminance(c_in_1);
    l_in = _e45;
    return (c_in_1 * (l_out_1 / l_in));
}

fn reinhard_luminance(color_4: vec3<f32>) -> vec3<f32> {
    var color_5: vec3<f32>;
    var l_old: f32;
    var l_new: f32;

    color_5 = color_4;
    let _e43 = luminance(color_5);
    l_old = _e43;
    l_new = (l_old / (1f + l_old));
    let _e53 = change_luminance(color_5, l_new);
    return _e53;
}

fn reinhard_extended_luminance(color_6: vec3<f32>, max_white_l: f32) -> vec3<f32> {
    var color_7: vec3<f32>;
    var max_white_l_1: f32;
    var l_old_1: f32;
    var numerator_1: f32;
    var l_new_1: f32;

    color_7 = color_6;
    max_white_l_1 = max_white_l;
    let _e45 = luminance(color_7);
    l_old_1 = _e45;
    numerator_1 = (l_old_1 * (1f + (l_old_1 / (max_white_l_1 * max_white_l_1))));
    l_new_1 = (numerator_1 / (1f + l_old_1));
    let _e65 = change_luminance(color_7, l_new_1);
    return _e65;
}

fn point_light(light: PointLight, roughness_8: f32, NdotV: f32, N: vec3<f32>, V_1: vec3<f32>, R: vec3<f32>, F0_: vec3<f32>, diffuseColor: vec3<f32>) -> vec3<f32> {
    var light_1: PointLight;
    var roughness_9: f32;
    var NdotV_1: f32;
    var N_1: vec3<f32>;
    var V_2: vec3<f32>;
    var R_1: vec3<f32>;
    var F0_1: vec3<f32>;
    var diffuseColor_1: vec3<f32>;
    var light_to_frag: vec3<f32>;
    var distance_square: f32;
    var rangeAttenuation: f32;
    var a_1: f32;
    var radius: f32;
    var centerToRay: vec3<f32>;
    var closestPoint: vec3<f32>;
    var LspecLengthInverse: f32;
    var normalizationFactor: f32;
    var specularIntensity_2: f32;
    var L: vec3<f32>;
    var H: vec3<f32>;
    var NoL_6: f32;
    var NoH_4: f32;
    var LoH_6: f32;
    var specular_1: vec3<f32>;
    var diffuse: vec3<f32>;

    light_1 = light;
    roughness_9 = roughness_8;
    NdotV_1 = NdotV;
    N_1 = N;
    V_2 = V_1;
    R_1 = R;
    F0_1 = F0_;
    diffuseColor_1 = diffuseColor;
    light_to_frag = (light_1.pos.xyz - v_WorldPosition_1.xyz);
    distance_square = dot(light_to_frag, light_to_frag);
    let _e71 = getDistanceAttenuation(distance_square, light_1.lightParams.x);
    rangeAttenuation = _e71;
    a_1 = roughness_9;
    radius = light_1.lightParams.y;
    centerToRay = ((dot(light_to_frag, R_1) * R_1) - light_to_frag);
    closestPoint = (light_to_frag + (centerToRay * clamp((radius * inverseSqrt(dot(centerToRay, centerToRay))), 0f, 1f)));
    LspecLengthInverse = inverseSqrt(dot(closestPoint, closestPoint));
    normalizationFactor = (a_1 / clamp((a_1 + ((radius * 0.5f) * LspecLengthInverse)), 0f, 1f));
    specularIntensity_2 = (normalizationFactor * normalizationFactor);
    L = (closestPoint * LspecLengthInverse);
    H = normalize((L + V_2));
    NoL_6 = clamp(dot(N_1, L), 0f, 1f);
    NoH_4 = clamp(dot(N_1, H), 0f, 1f);
    LoH_6 = clamp(dot(L, H), 0f, 1f);
    let _e161 = specular(F0_1, roughness_9, H, NdotV_1, NoL_6, NoH_4, LoH_6, specularIntensity_2);
    specular_1 = _e161;
    L = normalize(light_to_frag);
    H = normalize((L + V_2));
    NoL_6 = clamp(dot(N_1, L), 0f, 1f);
    NoH_4 = clamp(dot(N_1, H), 0f, 1f);
    LoH_6 = clamp(dot(L, H), 0f, 1f);
    let _e192 = Fd_Burley(roughness_9, NdotV_1, NoL_6, LoH_6);
    diffuse = (diffuseColor_1 * _e192);
    return (((diffuse + specular_1) * light_1.color.xyz) * (rangeAttenuation * NoL_6));
}

fn dir_light(light_2: DirectionalLight, roughness_10: f32, NdotV_2: f32, normal: vec3<f32>, view: vec3<f32>, R_2: vec3<f32>, F0_2: vec3<f32>, diffuseColor_2: vec3<f32>) -> vec3<f32> {
    var light_3: DirectionalLight;
    var roughness_11: f32;
    var NdotV_3: f32;
    var normal_1: vec3<f32>;
    var view_1: vec3<f32>;
    var R_3: vec3<f32>;
    var F0_3: vec3<f32>;
    var diffuseColor_3: vec3<f32>;
    var incident_light: vec3<f32>;
    var half_vector: vec3<f32>;
    var NoL_7: f32;
    var NoH_5: f32;
    var LoH_7: f32;
    var diffuse_1: vec3<f32>;
    var specularIntensity_3: f32 = 1f;
    var specular_2: vec3<f32>;

    light_3 = light_2;
    roughness_11 = roughness_10;
    NdotV_3 = NdotV_2;
    normal_1 = normal;
    view_1 = view;
    R_3 = R_2;
    F0_3 = F0_2;
    diffuseColor_3 = diffuseColor_2;
    incident_light = light_3.direction.xyz;
    half_vector = normalize((incident_light + view_1));
    NoL_7 = clamp(dot(normal_1, incident_light), 0f, 1f);
    NoH_5 = clamp(dot(normal_1, half_vector), 0f, 1f);
    LoH_7 = clamp(dot(incident_light, half_vector), 0f, 1f);
    let _e91 = Fd_Burley(roughness_11, NdotV_3, NoL_7, LoH_7);
    diffuse_1 = (diffuseColor_3 * _e91);
    let _e104 = specular(F0_3, roughness_11, half_vector, NdotV_3, NoL_7, NoH_5, LoH_7, specularIntensity_3);
    specular_2 = _e104;
    return (((specular_2 + diffuse_1) * light_3.color.xyz) * NoL_7);
}

fn main_1() {
    var output_color: vec4<f32>;
    var metallic_roughness: vec4<f32>;
    var metallic: f32;
    var perceptual_roughness_2: f32;
    var roughness_12: f32;
    var N_2: vec3<f32>;
    var T: vec3<f32>;
    var B: vec3<f32>;
    var local: vec3<f32>;
    var local_1: vec3<f32>;
    var local_2: vec3<f32>;
    var TBN: mat3x3<f32>;
    var occlusion: f32;
    var emissive: vec4<f32>;
    var V_3: vec3<f32>;
    var NdotV_4: f32;
    var F0_4: vec3<f32>;
    var diffuseColor_4: vec3<f32>;
    var R_4: vec3<f32>;
    var light_accum: vec3<f32> = vec3(0f);
    var i: i32 = 0i;
    var i_1: i32 = 0i;
    var diffuse_ambient: vec3<f32>;
    var specular_ambient: vec3<f32>;

    output_color = global_3.base_color;
    let _e44 = textureSample(StandardMaterial_base_color_texture, StandardMaterial_base_color_texture_sampler, v_Uv_1);
    output_color = (output_color * _e44);
    let _e47 = textureSample(StandardMaterial_metallic_roughness_texture, StandardMaterial_metallic_roughness_texture_sampler, v_Uv_1);
    metallic_roughness = _e47;
    metallic = (global_5.metallic * metallic_roughness.z);
    perceptual_roughness_2 = (global_4.perceptual_roughness * metallic_roughness.y);
    let _e60 = perceptualRoughnessToRoughness(perceptual_roughness_2);
    roughness_12 = _e60;
    N_2 = normalize(v_WorldNormal_1);
    T = normalize(v_WorldTangent_1.xyz);
    B = (cross(N_2, T) * v_WorldTangent_1.w);
    if gl_FrontFacing_1 {
        local = N_2;
    } else {
        local = -(N_2);
    }
    N_2 = local;
    if gl_FrontFacing_1 {
        local_1 = T;
    } else {
        local_1 = -(T);
    }
    T = local_1;
    if gl_FrontFacing_1 {
        local_2 = B;
    } else {
        local_2 = -(B);
    }
    B = local_2;
    let _e95 = T;
    let _e96 = B;
    let _e97 = N_2;
    TBN = mat3x3<f32>(vec3<f32>(_e95.x, _e95.y, _e95.z), vec3<f32>(_e96.x, _e96.y, _e96.z), vec3<f32>(_e97.x, _e97.y, _e97.z));
    let _e114 = textureSample(StandardMaterial_normal_map, StandardMaterial_normal_map_sampler, v_Uv_1);
    N_2 = (TBN * normalize(((_e114.xyz * 2f) - vec3(1f))));
    let _e124 = textureSample(StandardMaterial_occlusion_texture, StandardMaterial_occlusion_texture_sampler, v_Uv_1);
    occlusion = _e124.x;
    emissive = global_7.emissive;
    let _e134 = textureSample(StandardMaterial_emissive_texture, StandardMaterial_emissive_texture_sampler, v_Uv_1);
    let _e136 = (emissive.xyz * _e134.xyz);
    emissive.x = _e136.x;
    emissive.y = _e136.y;
    emissive.z = _e136.z;
    V_3 = normalize((global_1.CameraPos.xyz - v_WorldPosition_1.xyz));
    NdotV_4 = max(dot(N_2, V_3), 0.001f);
    F0_4 = (vec3((((0.16f * global_6.reflectance) * global_6.reflectance) * (1f - metallic))) + (output_color.xyz * vec3(metallic)));
    diffuseColor_4 = (output_color.xyz * vec3((1f - metallic)));
    R_4 = reflect(-(V_3), N_2);
    loop {
        if !(((i < i32(global_2.NumLights.x)) && (i < MAX_POINT_LIGHTS))) {
            break;
        }
        {
            let _e214 = point_light(global_2.PointLights[i], roughness_12, NdotV_4, N_2, V_3, R_4, F0_4, diffuseColor_4);
            light_accum = (light_accum + _e214);
        }
        continuing {
            i = (i + 1i);
        }
    }
    loop {
        if !(((i_1 < i32(global_2.NumLights.y)) && (i_1 < MAX_DIRECTIONAL_LIGHTS))) {
            break;
        }
        {
            let _e241 = dir_light(global_2.DirectionalLights[i_1], roughness_12, NdotV_4, N_2, V_3, R_4, F0_4, diffuseColor_4);
            light_accum = (light_accum + _e241);
        }
        continuing {
            i_1 = (i_1 + 1i);
        }
    }
    let _e246 = EnvBRDFApprox(diffuseColor_4, 1f, NdotV_4);
    diffuse_ambient = _e246;
    let _e251 = EnvBRDFApprox(F0_4, perceptual_roughness_2, NdotV_4);
    specular_ambient = _e251;
    let _e255 = light_accum;
    output_color.x = _e255.x;
    output_color.y = _e255.y;
    output_color.z = _e255.z;
    let _e274 = (output_color.xyz + (((diffuse_ambient + specular_ambient) * global_2.AmbientColor.xyz) * occlusion));
    output_color.x = _e274.x;
    output_color.y = _e274.y;
    output_color.z = _e274.z;
    let _e290 = (output_color.xyz + (emissive.xyz * output_color.w));
    output_color.x = _e290.x;
    output_color.y = _e290.y;
    output_color.z = _e290.z;
    let _e301 = reinhard_luminance(output_color.xyz);
    output_color.x = _e301.x;
    output_color.y = _e301.y;
    output_color.z = _e301.z;
    o_Target = output_color;
    return;
}

@fragment 
fn main(@location(0) v_WorldPosition: vec3<f32>, @location(1) v_WorldNormal: vec3<f32>, @location(2) v_Uv: vec2<f32>, @location(3) v_WorldTangent: vec4<f32>, @builtin(front_facing) gl_FrontFacing: bool) -> FragmentOutput {
    v_WorldPosition_1 = v_WorldPosition;
    v_WorldNormal_1 = v_WorldNormal;
    v_Uv_1 = v_Uv;
    v_WorldTangent_1 = v_WorldTangent;
    gl_FrontFacing_1 = gl_FrontFacing;
    main_1();
    return FragmentOutput(o_Target);
}
