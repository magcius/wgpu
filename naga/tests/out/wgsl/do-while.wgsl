fn fb1_(cond: ptr<function, bool>) {
    loop {
        continue;
        continuing {
            break if !((*cond));
        }
    }
    return;
}

fn main_1() {
    var param: bool;

    param = false;
    fb1_((&param));
    return;
}

@fragment 
fn main() {
    main_1();
}
