struct UniformIndex {
    index: u32,
}

struct FragmentIn {
    @location(0) @interpolate(flat) index: u32,
}

@group(0) @binding(0) 
var texture_array_unbounded: binding_array<texture_2d<f32>>;
@group(0) @binding(1) 
var texture_array_bounded: binding_array<texture_2d<f32>, 5>;
@group(0) @binding(2) 
var texture_array_2darray: binding_array<texture_2d_array<f32>, 5>;
@group(0) @binding(3) 
var texture_array_multisampled: binding_array<texture_multisampled_2d<f32>, 5>;
@group(0) @binding(4) 
var texture_array_depth: binding_array<texture_depth_2d, 5>;
@group(0) @binding(5) 
var texture_array_storage: binding_array<texture_storage_2d<rgba32float,write>, 5>;
@group(0) @binding(6) 
var samp: binding_array<sampler, 5>;
@group(0) @binding(7) 
var samp_comp: binding_array<sampler_comparison, 5>;
@group(0) @binding(8) 
var<uniform> uni: UniformIndex;

@fragment 
fn main(fragment_in: FragmentIn) -> @location(0) vec4<f32> {
    var u1_: u32 = 0u;
    var u2_: vec2<u32> = vec2(0u);
    var v1_: f32 = 0f;
    var v4_: vec4<f32> = vec4(0f);

    let uniform_index = uni.index;
    let non_uniform_index = fragment_in.index;
    const uv = vec2(0f);
    const pix = vec2(0i);
    let _e21 = textureDimensions(texture_array_unbounded[0]);
    u2_ = (u2_ + _e21);
    let _e26 = textureDimensions(texture_array_unbounded[uniform_index]);
    u2_ = (u2_ + _e26);
    let _e31 = textureDimensions(texture_array_unbounded[non_uniform_index]);
    u2_ = (u2_ + _e31);
    let _e38 = textureGather(0, texture_array_bounded[0], samp[0], uv);
    v4_ = (v4_ + _e38);
    let _e45 = textureGather(0, texture_array_bounded[uniform_index], samp[uniform_index], uv);
    v4_ = (v4_ + _e45);
    let _e52 = textureGather(0, texture_array_bounded[non_uniform_index], samp[non_uniform_index], uv);
    v4_ = (v4_ + _e52);
    let _e60 = textureGatherCompare(texture_array_depth[0], samp_comp[0], uv, 0f);
    v4_ = (v4_ + _e60);
    let _e68 = textureGatherCompare(texture_array_depth[uniform_index], samp_comp[uniform_index], uv, 0f);
    v4_ = (v4_ + _e68);
    let _e76 = textureGatherCompare(texture_array_depth[non_uniform_index], samp_comp[non_uniform_index], uv, 0f);
    v4_ = (v4_ + _e76);
    let _e82 = textureLoad(texture_array_unbounded[0], pix, 0i);
    v4_ = (v4_ + _e82);
    let _e88 = textureLoad(texture_array_unbounded[uniform_index], pix, 0i);
    v4_ = (v4_ + _e88);
    let _e94 = textureLoad(texture_array_unbounded[non_uniform_index], pix, 0i);
    v4_ = (v4_ + _e94);
    let _e99 = textureNumLayers(texture_array_2darray[0]);
    u1_ = (u1_ + _e99);
    let _e104 = textureNumLayers(texture_array_2darray[uniform_index]);
    u1_ = (u1_ + _e104);
    let _e109 = textureNumLayers(texture_array_2darray[non_uniform_index]);
    u1_ = (u1_ + _e109);
    let _e114 = textureNumLevels(texture_array_bounded[0]);
    u1_ = (u1_ + _e114);
    let _e119 = textureNumLevels(texture_array_bounded[uniform_index]);
    u1_ = (u1_ + _e119);
    let _e124 = textureNumLevels(texture_array_bounded[non_uniform_index]);
    u1_ = (u1_ + _e124);
    let _e129 = textureNumSamples(texture_array_multisampled[0]);
    u1_ = (u1_ + _e129);
    let _e134 = textureNumSamples(texture_array_multisampled[uniform_index]);
    u1_ = (u1_ + _e134);
    let _e139 = textureNumSamples(texture_array_multisampled[non_uniform_index]);
    u1_ = (u1_ + _e139);
    let _e146 = textureSample(texture_array_bounded[0], samp[0], uv);
    v4_ = (v4_ + _e146);
    let _e153 = textureSample(texture_array_bounded[uniform_index], samp[uniform_index], uv);
    v4_ = (v4_ + _e153);
    let _e160 = textureSample(texture_array_bounded[non_uniform_index], samp[non_uniform_index], uv);
    v4_ = (v4_ + _e160);
    let _e168 = textureSampleBias(texture_array_bounded[0], samp[0], uv, 0f);
    v4_ = (v4_ + _e168);
    let _e176 = textureSampleBias(texture_array_bounded[uniform_index], samp[uniform_index], uv, 0f);
    v4_ = (v4_ + _e176);
    let _e184 = textureSampleBias(texture_array_bounded[non_uniform_index], samp[non_uniform_index], uv, 0f);
    v4_ = (v4_ + _e184);
    let _e192 = textureSampleCompare(texture_array_depth[0], samp_comp[0], uv, 0f);
    v1_ = (v1_ + _e192);
    let _e200 = textureSampleCompare(texture_array_depth[uniform_index], samp_comp[uniform_index], uv, 0f);
    v1_ = (v1_ + _e200);
    let _e208 = textureSampleCompare(texture_array_depth[non_uniform_index], samp_comp[non_uniform_index], uv, 0f);
    v1_ = (v1_ + _e208);
    let _e216 = textureSampleCompareLevel(texture_array_depth[0], samp_comp[0], uv, 0f);
    v1_ = (v1_ + _e216);
    let _e224 = textureSampleCompareLevel(texture_array_depth[uniform_index], samp_comp[uniform_index], uv, 0f);
    v1_ = (v1_ + _e224);
    let _e232 = textureSampleCompareLevel(texture_array_depth[non_uniform_index], samp_comp[non_uniform_index], uv, 0f);
    v1_ = (v1_ + _e232);
    let _e239 = textureSampleGrad(texture_array_bounded[0], samp[0], uv, uv, uv);
    v4_ = (v4_ + _e239);
    let _e246 = textureSampleGrad(texture_array_bounded[uniform_index], samp[uniform_index], uv, uv, uv);
    v4_ = (v4_ + _e246);
    let _e253 = textureSampleGrad(texture_array_bounded[non_uniform_index], samp[non_uniform_index], uv, uv, uv);
    v4_ = (v4_ + _e253);
    let _e261 = textureSampleLevel(texture_array_bounded[0], samp[0], uv, 0f);
    v4_ = (v4_ + _e261);
    let _e269 = textureSampleLevel(texture_array_bounded[uniform_index], samp[uniform_index], uv, 0f);
    v4_ = (v4_ + _e269);
    let _e277 = textureSampleLevel(texture_array_bounded[non_uniform_index], samp[non_uniform_index], uv, 0f);
    v4_ = (v4_ + _e277);
    textureStore(texture_array_storage[0], pix, v4_);
    textureStore(texture_array_storage[uniform_index], pix, v4_);
    textureStore(texture_array_storage[non_uniform_index], pix, v4_);
    let v2_ = vec2<f32>((u2_ + vec2(u1_)));
    return ((v4_ + vec4<f32>(v2_.x, v2_.y, v2_.x, v2_.y)) + vec4(v1_));
}
