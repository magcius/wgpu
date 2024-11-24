struct type_1 {
    int member;
};

RWByteAddressBuffer unnamed : register(u0);

void function()
{
    unnamed.Store(0, asuint((asint(unnamed.Load(0)) + 1)));
    return;
}

[numthreads(1, 1, 1)]
void main()
{
    function();
}
