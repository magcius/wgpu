#version 310 es

precision highp float;
precision highp int;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;


void breakIfEmpty() {
    bool loop_init = true;
    while(true) {
        if (!loop_init) {
            if (true) {
                break;
            }
        }
        loop_init = false;
    }
    return;
}

void breakIfEmptyBody(bool a) {
    bool b = false;
    bool c = false;
    bool loop_init_1 = true;
    while(true) {
        if (!loop_init_1) {
            b = a;
            c = (a != b);
            if ((a == c)) {
                break;
            }
        }
        loop_init_1 = false;
    }
    return;
}

void breakIf(bool a_1) {
    bool d = false;
    bool e = false;
    bool loop_init_2 = true;
    while(true) {
        if (!loop_init_2) {
            if ((a_1 == e)) {
                break;
            }
        }
        loop_init_2 = false;
        d = a_1;
        e = (a_1 != d);
    }
    return;
}

void breakIfSeparateVariable() {
    uint counter = 0u;
    bool loop_init_3 = true;
    while(true) {
        if (!loop_init_3) {
            if ((counter == 5u)) {
                break;
            }
        }
        loop_init_3 = false;
        counter = (counter + 1u);
    }
    return;
}

void main() {
    return;
}

