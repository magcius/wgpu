RWByteAddressBuffer v_indices : register(u0);

uint collatz_iterations(uint n_base)
{
    uint n = (uint)0;
    uint i = 0u;

    n = n_base;
    while(true) {
        if ((n > 1u)) {
        } else {
            break;
        }
        {
            if (((n % 2u) == 0u)) {
                n = (n / 2u);
            } else {
                n = ((3u * n) + 1u);
            }
            i = (i + 1u);
        }
    }
    return i;
}

[numthreads(1, 1, 1)]
void main(uint3 global_id : SV_DispatchThreadID)
{
    const uint _e10 = collatz_iterations(asuint(v_indices.Load(global_id.x*4+0)));
    v_indices.Store(global_id.x*4+0, asuint(_e10));
    return;
}
