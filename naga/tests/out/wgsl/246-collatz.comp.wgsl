struct PrimeIndices {
    indices: array<u32>,
}

@group(0) @binding(0) 
var<storage, read_write> global: PrimeIndices;
var<private> gl_GlobalInvocationID_1: vec3<u32>;

fn collatz_iterations(n: u32) -> u32 {
    var n_1: u32;
    var i: u32 = 0u;

    n_1 = n;
    loop {
        if !((n_1 != 1u)) {
            break;
        }
        {
            let _e14 = f32(n_1);
            if ((_e14 - (floor((_e14 / 2f)) * 2f)) == 0f) {
                {
                    n_1 = (n_1 / 2u);
                }
            } else {
                {
                    n_1 = ((3u * n_1) + 1u);
                }
            }
            i = (i + 1u);
        }
    }
    return i;
}

fn main_1() {
    var index: u32;

    index = gl_GlobalInvocationID_1.x;
    let _e11 = collatz_iterations(global.indices[index]);
    global.indices[index] = _e11;
    return;
}

@compute @workgroup_size(1, 1, 1) 
fn main(@builtin(global_invocation_id) gl_GlobalInvocationID: vec3<u32>) {
    gl_GlobalInvocationID_1 = gl_GlobalInvocationID;
    main_1();
    return;
}
