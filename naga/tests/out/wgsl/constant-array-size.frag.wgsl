struct Data {
    vecs: array<vec4<f32>, 42>,
}

const NUM_VECS: i32 = 42i;

@group(1) @binding(0) 
var<uniform> global: Data;

fn function() -> vec4<f32> {
    var sum: vec4<f32> = vec4(0f);
    var i: i32 = 0i;

    loop {
        if !((i < NUM_VECS)) {
            break;
        }
        {
            sum = (sum + global.vecs[i]);
        }
        continuing {
            i = (i + 1i);
        }
    }
    return sum;
}

fn main_1() {
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
