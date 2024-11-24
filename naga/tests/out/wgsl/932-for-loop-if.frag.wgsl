fn main_1() {
    var i: i32 = 0i;

    loop {
        if !((i < 1i)) {
            break;
        }
        {
        }
        continuing {
            i = (i + 1i);
        }
    }
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
