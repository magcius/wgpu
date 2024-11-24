struct NagaConstants {
    int first_vertex;
    int first_instance;
    uint other;
};
ConstantBuffer<NagaConstants> _NagaConstants: register(b0, space1);

struct Struct {
    uint64_t atomic_scalar;
    uint64_t atomic_arr[2];
};

RWByteAddressBuffer storage_atomic_scalar : register(u0);
RWByteAddressBuffer storage_atomic_arr : register(u1);
RWByteAddressBuffer storage_struct : register(u2);
cbuffer input : register(b3) { uint64_t input; }

[numthreads(2, 1, 1)]
void cs_main(uint3 id : SV_GroupThreadID)
{
    storage_atomic_scalar.InterlockedMax64(0, input);
    storage_atomic_arr.InterlockedMax64(8, (1uL + input));
    storage_struct.InterlockedMax64(0, 1uL);
    storage_struct.InterlockedMax64(8+8, uint64_t(id.x));
    GroupMemoryBarrierWithGroupSync();
    storage_atomic_scalar.InterlockedMin64(0, input);
    storage_atomic_arr.InterlockedMin64(8, (1uL + input));
    storage_struct.InterlockedMin64(0, 1uL);
    storage_struct.InterlockedMin64(8+8, uint64_t(id.x));
    return;
}
