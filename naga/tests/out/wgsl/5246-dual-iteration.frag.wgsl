fn main_1() {
    var x: i32 = 0i;
    var y: i32;
    var z: i32;

    loop {
        if !((x < 10i)) {
            break;
        }
        {
            y = 0i;
            loop {
                if !((y < 10i)) {
                    break;
                }
                {
                    z = 0i;
                    loop {
                        if !((z < 10i)) {
                            break;
                        }
                        {
                        }
                        continuing {
                            z = (z + 1i);
                        }
                    }
                }
                continuing {
                    y = (y + 1i);
                }
            }
        }
        continuing {
            x = (x + 1i);
        }
    }
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
