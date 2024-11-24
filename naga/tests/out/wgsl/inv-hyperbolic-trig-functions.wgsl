var<private> a: f32;

fn main_1() {
    var b: f32;
    var c: f32;
    var d: f32;

    b = asinh(a);
    c = acosh(a);
    d = atanh(a);
    return;
}

@fragment 
fn main() {
    main_1();
}
