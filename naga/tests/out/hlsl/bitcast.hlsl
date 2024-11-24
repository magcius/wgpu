[numthreads(1, 1, 1)]
void main()
{
    int2 i2_ = (0).xx;
    int3 i3_ = (0).xxx;
    int4 i4_ = (0).xxxx;
    uint2 u2_ = (0u).xx;
    uint3 u3_ = (0u).xxx;
    uint4 u4_ = (0u).xxxx;
    float2 f2_ = (0.0).xx;
    float3 f3_ = (0.0).xxx;
    float4 f4_ = (0.0).xxxx;

    u2_ = asuint(i2_);
    u3_ = asuint(i3_);
    u4_ = asuint(i4_);
    i2_ = asint(u2_);
    i3_ = asint(u3_);
    i4_ = asint(u4_);
    f2_ = asfloat(i2_);
    f3_ = asfloat(i3_);
    f4_ = asfloat(i4_);
    return;
}
