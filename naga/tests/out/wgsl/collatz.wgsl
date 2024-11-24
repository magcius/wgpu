struct PrimeIndices {
    data: array<u32>,
}

@group(0) @binding(0) 
var<storage, read_write> v_indices: PrimeIndices;

fn collatz_iterations(n_base: u32) -> u32 {
    var n: u32;
    var i: u32 = 0u;

    n = n_base;
    loop {
        if (n > 1u) {
        } else {
            break;
        }
        {
            if ((n % 2u) == 0u) {
                n = (n / 2u);
            } else {
                n = ((3u * n) + 1u);
            }
            i = (i + 1u);
        }
    }
    return i;
}

@compute @workgroup_size(1, 1, 1) 
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let _e10 = collatz_iterations(v_indices.data[global_id.x]);
    v_indices.data[global_id.x] = _e10;
    return;
}
