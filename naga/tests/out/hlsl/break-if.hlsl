void breakIfEmpty()
{
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

void breakIfEmptyBody(bool a)
{
    bool b = (bool)0;
    bool c = (bool)0;

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

void breakIf(bool a_1)
{
    bool d = (bool)0;
    bool e = (bool)0;

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

void breakIfSeparateVariable()
{
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

[numthreads(1, 1, 1)]
void main()
{
    return;
}
