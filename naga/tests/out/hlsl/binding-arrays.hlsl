struct UniformIndex {
    uint index;
};

struct FragmentIn {
    nointerpolation uint index : LOC0;
};

Texture2D<float4> texture_array_unbounded[10] : register(t0);
Texture2D<float4> texture_array_bounded[5] : register(t0, space1);
Texture2DArray<float4> texture_array_2darray[5] : register(t0, space2);
Texture2DMS<float4> texture_array_multisampled[5] : register(t0, space3);
Texture2D<float> texture_array_depth[5] : register(t0, space4);
RWTexture2D<float4> texture_array_storage[5] : register(u0, space5);
SamplerState samp[5] : register(s0, space6);
SamplerComparisonState samp_comp[5] : register(s0, space7);
cbuffer uni : register(b0, space8) { UniformIndex uni; }

struct FragmentInput_main {
    nointerpolation uint index : LOC0;
};

uint2 NagaDimensions2D(Texture2D<float4> tex)
{
    uint4 ret;
    tex.GetDimensions(0, ret.x, ret.y, ret.z);
    return ret.xy;
}

uint NagaNumLayers2DArray(Texture2DArray<float4> tex)
{
    uint4 ret;
    tex.GetDimensions(0, ret.x, ret.y, ret.z, ret.w);
    return ret.w;
}

uint NagaNumLevels2D(Texture2D<float4> tex)
{
    uint4 ret;
    tex.GetDimensions(0, ret.x, ret.y, ret.z);
    return ret.z;
}

uint NagaMSNumSamples2D(Texture2DMS<float4> tex)
{
    uint4 ret;
    tex.GetDimensions(ret.x, ret.y, ret.z);
    return ret.z;
}

float4 main(FragmentInput_main fragmentinput_main) : SV_Target0
{
    FragmentIn fragment_in = { fragmentinput_main.index };
    uint u1_ = 0u;
    uint2 u2_ = (0u).xx;
    float v1_ = 0.0;
    float4 v4_ = (0.0).xxxx;

    uint uniform_index = uni.index;
    uint non_uniform_index = fragment_in.index;
    float2 uv = (0.0).xx;
    int2 pix = (0).xx;
    u2_ = (u2_ + NagaDimensions2D(texture_array_unbounded[0]));
    u2_ = (u2_ + NagaDimensions2D(texture_array_unbounded[uniform_index]));
    u2_ = (u2_ + NagaDimensions2D(texture_array_unbounded[NonUniformResourceIndex(non_uniform_index)]));
    float4 _e38 = texture_array_bounded[0].Gather(samp[0], uv);
    v4_ = (v4_ + _e38);
    float4 _e45 = texture_array_bounded[uniform_index].Gather(samp[uniform_index], uv);
    v4_ = (v4_ + _e45);
    float4 _e52 = texture_array_bounded[NonUniformResourceIndex(non_uniform_index)].Gather(samp[NonUniformResourceIndex(non_uniform_index)], uv);
    v4_ = (v4_ + _e52);
    float4 _e60 = texture_array_depth[0].GatherCmp(samp_comp[0], uv, 0.0);
    v4_ = (v4_ + _e60);
    float4 _e68 = texture_array_depth[uniform_index].GatherCmp(samp_comp[uniform_index], uv, 0.0);
    v4_ = (v4_ + _e68);
    float4 _e76 = texture_array_depth[NonUniformResourceIndex(non_uniform_index)].GatherCmp(samp_comp[NonUniformResourceIndex(non_uniform_index)], uv, 0.0);
    v4_ = (v4_ + _e76);
    float4 _e82 = texture_array_unbounded[0].Load(int3(pix, 0));
    v4_ = (v4_ + _e82);
    float4 _e88 = texture_array_unbounded[uniform_index].Load(int3(pix, 0));
    v4_ = (v4_ + _e88);
    float4 _e94 = texture_array_unbounded[NonUniformResourceIndex(non_uniform_index)].Load(int3(pix, 0));
    v4_ = (v4_ + _e94);
    u1_ = (u1_ + NagaNumLayers2DArray(texture_array_2darray[0]));
    u1_ = (u1_ + NagaNumLayers2DArray(texture_array_2darray[uniform_index]));
    u1_ = (u1_ + NagaNumLayers2DArray(texture_array_2darray[NonUniformResourceIndex(non_uniform_index)]));
    u1_ = (u1_ + NagaNumLevels2D(texture_array_bounded[0]));
    u1_ = (u1_ + NagaNumLevels2D(texture_array_bounded[uniform_index]));
    u1_ = (u1_ + NagaNumLevels2D(texture_array_bounded[NonUniformResourceIndex(non_uniform_index)]));
    u1_ = (u1_ + NagaMSNumSamples2D(texture_array_multisampled[0]));
    u1_ = (u1_ + NagaMSNumSamples2D(texture_array_multisampled[uniform_index]));
    u1_ = (u1_ + NagaMSNumSamples2D(texture_array_multisampled[NonUniformResourceIndex(non_uniform_index)]));
    float4 _e146 = texture_array_bounded[0].Sample(samp[0], uv);
    v4_ = (v4_ + _e146);
    float4 _e153 = texture_array_bounded[uniform_index].Sample(samp[uniform_index], uv);
    v4_ = (v4_ + _e153);
    float4 _e160 = texture_array_bounded[NonUniformResourceIndex(non_uniform_index)].Sample(samp[NonUniformResourceIndex(non_uniform_index)], uv);
    v4_ = (v4_ + _e160);
    float4 _e168 = texture_array_bounded[0].SampleBias(samp[0], uv, 0.0);
    v4_ = (v4_ + _e168);
    float4 _e176 = texture_array_bounded[uniform_index].SampleBias(samp[uniform_index], uv, 0.0);
    v4_ = (v4_ + _e176);
    float4 _e184 = texture_array_bounded[NonUniformResourceIndex(non_uniform_index)].SampleBias(samp[NonUniformResourceIndex(non_uniform_index)], uv, 0.0);
    v4_ = (v4_ + _e184);
    float _e192 = texture_array_depth[0].SampleCmp(samp_comp[0], uv, 0.0);
    v1_ = (v1_ + _e192);
    float _e200 = texture_array_depth[uniform_index].SampleCmp(samp_comp[uniform_index], uv, 0.0);
    v1_ = (v1_ + _e200);
    float _e208 = texture_array_depth[NonUniformResourceIndex(non_uniform_index)].SampleCmp(samp_comp[NonUniformResourceIndex(non_uniform_index)], uv, 0.0);
    v1_ = (v1_ + _e208);
    float _e216 = texture_array_depth[0].SampleCmpLevelZero(samp_comp[0], uv, 0.0);
    v1_ = (v1_ + _e216);
    float _e224 = texture_array_depth[uniform_index].SampleCmpLevelZero(samp_comp[uniform_index], uv, 0.0);
    v1_ = (v1_ + _e224);
    float _e232 = texture_array_depth[NonUniformResourceIndex(non_uniform_index)].SampleCmpLevelZero(samp_comp[NonUniformResourceIndex(non_uniform_index)], uv, 0.0);
    v1_ = (v1_ + _e232);
    float4 _e239 = texture_array_bounded[0].SampleGrad(samp[0], uv, uv, uv);
    v4_ = (v4_ + _e239);
    float4 _e246 = texture_array_bounded[uniform_index].SampleGrad(samp[uniform_index], uv, uv, uv);
    v4_ = (v4_ + _e246);
    float4 _e253 = texture_array_bounded[NonUniformResourceIndex(non_uniform_index)].SampleGrad(samp[NonUniformResourceIndex(non_uniform_index)], uv, uv, uv);
    v4_ = (v4_ + _e253);
    float4 _e261 = texture_array_bounded[0].SampleLevel(samp[0], uv, 0.0);
    v4_ = (v4_ + _e261);
    float4 _e269 = texture_array_bounded[uniform_index].SampleLevel(samp[uniform_index], uv, 0.0);
    v4_ = (v4_ + _e269);
    float4 _e277 = texture_array_bounded[NonUniformResourceIndex(non_uniform_index)].SampleLevel(samp[NonUniformResourceIndex(non_uniform_index)], uv, 0.0);
    v4_ = (v4_ + _e277);
    texture_array_storage[0][pix] = v4_;
    texture_array_storage[uniform_index][pix] = v4_;
    texture_array_storage[NonUniformResourceIndex(non_uniform_index)][pix] = v4_;
    float2 v2_ = float2((u2_ + (u1_).xx));
    return ((v4_ + float4(v2_.x, v2_.y, v2_.x, v2_.y)) + (v1_).xxxx);
}
