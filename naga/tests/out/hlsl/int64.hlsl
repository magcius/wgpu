struct NagaConstants {
    int first_vertex;
    int first_instance;
    uint other;
};
ConstantBuffer<NagaConstants> _NagaConstants: register(b0, space1);

struct UniformCompatible {
    uint val_u32_;
    int val_i32_;
    float val_f32_;
    int _pad3_0;
    uint64_t val_u64_;
    int _pad4_0;
    int _pad4_1;
    uint64_t2 val_u64_2_;
    int _pad5_0;
    int _pad5_1;
    int _pad5_2;
    int _pad5_3;
    uint64_t3 val_u64_3_;
    int _pad6_0;
    int _pad6_1;
    uint64_t4 val_u64_4_;
    int64_t val_i64_;
    int _pad8_0;
    int _pad8_1;
    int64_t2 val_i64_2_;
    int64_t3 val_i64_3_;
    int _pad10_0;
    int _pad10_1;
    int64_t4 val_i64_4_;
    uint64_t final_value;
    int _end_pad_0;
    int _end_pad_1;
    int _end_pad_2;
    int _end_pad_3;
    int _end_pad_4;
    int _end_pad_5;
};

struct StorageCompatible {
    uint64_t val_u64_array_2_[2];
    int64_t val_i64_array_2_[2];
};

static const uint64_t constant_variable = 20uL;

static int64_t private_variable = 1L;
cbuffer input_uniform : register(b0) { UniformCompatible input_uniform; }
ByteAddressBuffer input_storage : register(t1);
ByteAddressBuffer input_arrays : register(t2);
RWByteAddressBuffer output : register(u3);
RWByteAddressBuffer output_arrays : register(u4);

typedef int64_t ret_Constructarray2_int64_t_[2];
ret_Constructarray2_int64_t_ Constructarray2_int64_t_(int64_t arg0, int64_t arg1) {
    int64_t ret[2] = { arg0, arg1 };
    return ret;
}

int64_t int64_function(int64_t x)
{
    int64_t val = 20L;

    val = (val + (31L - 1002003004005006L));
    val = (val + (val + 5L));
    val = (val + int64_t((input_uniform.val_u32_ + uint(val))));
    val = (val + int64_t((input_uniform.val_i32_ + int(val))));
    val = (val + int64_t((input_uniform.val_f32_ + float(val))));
    val = (val + (input_uniform.val_i64_).xxx.z);
    val = (val + input_uniform.val_u64_);
    val = (val + input_uniform.val_u64_2_.y);
    val = (val + input_uniform.val_u64_3_.z);
    val = (val + input_uniform.val_u64_4_.w);
    output.Store(128, (input_uniform.val_i64_ + input_storage.Load<int64_t>(128)));
    output.Store(144, (input_uniform.val_i64_2_ + input_storage.Load<int64_t2>(144)));
    output.Store(160, (input_uniform.val_i64_3_ + input_storage.Load<int64_t3>(160)));
    output.Store(192, (input_uniform.val_i64_4_ + input_storage.Load<int64_t4>(192)));
    {
        int64_t _value2[2] = Constructarray2_int64_t_(input_arrays.Load<int64_t>(16+0), input_arrays.Load<int64_t>(16+8));
        output_arrays.Store(16+0, _value2[0]);
        output_arrays.Store(16+8, _value2[1]);
    }
    val = (val + abs(val));
    val = (val + clamp(val, val, val));
    val = (val + dot((val).xx, (val).xx));
    val = (val + max(val, val));
    val = (val + min(val, val));
    val = (val + sign(val));
    return val;
}

typedef uint64_t ret_Constructarray2_uint64_t_[2];
ret_Constructarray2_uint64_t_ Constructarray2_uint64_t_(uint64_t arg0, uint64_t arg1) {
    uint64_t ret[2] = { arg0, arg1 };
    return ret;
}

uint64_t uint64_function(uint64_t x_1)
{
    uint64_t val_1 = 20uL;

    val_1 = (val_1 + (31uL + 1002003004005006uL));
    val_1 = (val_1 + (val_1 + 5uL));
    val_1 = (val_1 + uint64_t((input_uniform.val_u32_ + uint(val_1))));
    val_1 = (val_1 + uint64_t((input_uniform.val_i32_ + int(val_1))));
    val_1 = (val_1 + uint64_t((input_uniform.val_f32_ + float(val_1))));
    val_1 = (val_1 + (input_uniform.val_u64_).xxx.z);
    val_1 = (val_1 + input_uniform.val_i64_);
    val_1 = (val_1 + input_uniform.val_i64_2_.y);
    val_1 = (val_1 + input_uniform.val_i64_3_.z);
    val_1 = (val_1 + input_uniform.val_i64_4_.w);
    output.Store(16, (input_uniform.val_u64_ + input_storage.Load<uint64_t>(16)));
    output.Store(32, (input_uniform.val_u64_2_ + input_storage.Load<uint64_t2>(32)));
    output.Store(64, (input_uniform.val_u64_3_ + input_storage.Load<uint64_t3>(64)));
    output.Store(96, (input_uniform.val_u64_4_ + input_storage.Load<uint64_t4>(96)));
    {
        uint64_t _value2[2] = Constructarray2_uint64_t_(input_arrays.Load<uint64_t>(0+0), input_arrays.Load<uint64_t>(0+8));
        output_arrays.Store(0+0, _value2[0]);
        output_arrays.Store(0+8, _value2[1]);
    }
    val_1 = (val_1 + abs(val_1));
    val_1 = (val_1 + clamp(val_1, val_1, val_1));
    val_1 = (val_1 + dot((val_1).xx, (val_1).xx));
    val_1 = (val_1 + max(val_1, val_1));
    val_1 = (val_1 + min(val_1, val_1));
    return val_1;
}

[numthreads(1, 1, 1)]
void main()
{
    const uint64_t _e3 = uint64_function(67uL);
    const int64_t _e5 = int64_function(60L);
    output.Store(224, (_e3 + _e5));
    return;
}
