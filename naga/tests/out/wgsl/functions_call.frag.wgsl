fn swizzleCallee(a: ptr<function, vec2<f32>>) {
    return;
}

fn swizzleCaller(a_1: vec3<f32>) {
    var a_2: vec3<f32>;
    var local: vec2<f32>;

    a_2 = a_1;
    local = a_2.xz;
    swizzleCallee((&local));
    a_2.x = local.x;
    a_2.z = local.y;
    return;
}

fn outImplicitCastCallee(a_3: ptr<function, u32>) {
    return;
}

fn outImplicitCastCaller(a_4: f32) {
    var a_5: f32;
    var local_1: u32;

    a_5 = a_4;
    outImplicitCastCallee((&local_1));
    a_5 = f32(local_1);
    return;
}

fn swizzleImplicitCastCallee(a_6: ptr<function, vec2<u32>>) {
    return;
}

fn swizzleImplicitCastCaller(a_7: vec3<f32>) {
    var a_8: vec3<f32>;
    var local_2: vec2<u32>;

    a_8 = a_7;
    swizzleImplicitCastCallee((&local_2));
    a_8.x = f32(local_2.x);
    a_8.z = f32(local_2.y);
    return;
}

fn main_1() {
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
