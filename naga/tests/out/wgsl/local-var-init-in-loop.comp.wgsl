fn main_1() {
    var sum: vec4<f32> = vec4(0f);
    var i: i32 = 0i;
    var a: vec4<f32>;

    loop {
        if !((i < 4i)) {
            break;
        }
        {
            a = vec4(1f);
            sum = (sum + a);
        }
        continuing {
            i = (i + 1i);
        }
    }
    return;
}

@compute @workgroup_size(1, 1, 1) 
fn main() {
    main_1();
    return;
}
