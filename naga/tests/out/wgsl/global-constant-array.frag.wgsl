const array_: array<f32, 2> = array<f32, 2>(1f, 2f);

var<private> i: u32;

fn main_1() {
    var local: array<f32, 2> = array_;

}

@fragment 
fn main() {
    main_1();
    return;
}
