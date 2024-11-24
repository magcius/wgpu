fn breakIfEmpty() {
    loop {
        continuing {
            break if true;
        }
    }
    return;
}

fn breakIfEmptyBody(a: bool) {
    var b: bool;
    var c: bool;

    loop {
        continuing {
            b = a;
            c = (a != b);
            break if (a == c);
        }
    }
    return;
}

fn breakIf(a_1: bool) {
    var d: bool;
    var e: bool;

    loop {
        d = a_1;
        e = (a_1 != d);
        continuing {
            break if (a_1 == e);
        }
    }
    return;
}

fn breakIfSeparateVariable() {
    var counter: u32 = 0u;

    loop {
        counter = (counter + 1u);
        continuing {
            break if (counter == 5u);
        }
    }
    return;
}

@compute @workgroup_size(1, 1, 1) 
fn main() {
    return;
}
