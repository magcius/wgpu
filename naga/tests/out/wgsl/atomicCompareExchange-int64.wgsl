const SIZE: u32 = 128u;

@group(0) @binding(0) 
var<storage, read_write> arr_i64_: array<atomic<i64>, 128>;
@group(0) @binding(1) 
var<storage, read_write> arr_u64_: array<atomic<u64>, 128>;

@compute @workgroup_size(1, 1, 1) 
fn test_atomic_compare_exchange_i64_() {
    var i: u32 = 0u;
    var old: i64;
    var exchanged: bool;

    loop {
        if (i < SIZE) {
        } else {
            break;
        }
        {
            old = atomicLoad((&arr_i64_[i]));
            exchanged = false;
            loop {
                if !(exchanged) {
                } else {
                    break;
                }
                {
                    let new_ = bitcast<i64>((old + 10li));
                    let _e22 = atomicCompareExchangeWeak((&arr_i64_[i]), old, new_);
                    old = _e22.old_value;
                    exchanged = _e22.exchanged;
                }
            }
        }
        continuing {
            i = (i + 1u);
        }
    }
    return;
}

@compute @workgroup_size(1, 1, 1) 
fn test_atomic_compare_exchange_u64_() {
    var i_1: u32 = 0u;
    var old_1: u64;
    var exchanged_1: bool;

    loop {
        if (i_1 < SIZE) {
        } else {
            break;
        }
        {
            old_1 = atomicLoad((&arr_u64_[i_1]));
            exchanged_1 = false;
            loop {
                if !(exchanged_1) {
                } else {
                    break;
                }
                {
                    let new_1 = bitcast<u64>((old_1 + 10lu));
                    let _e22 = atomicCompareExchangeWeak((&arr_u64_[i_1]), old_1, new_1);
                    old_1 = _e22.old_value;
                    exchanged_1 = _e22.exchanged;
                }
            }
        }
        continuing {
            i_1 = (i_1 + 1u);
        }
    }
    return;
}
