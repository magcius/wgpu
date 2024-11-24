const SIZE: u32 = 128u;

@group(0) @binding(0) 
var<storage, read_write> arr_i32_: array<atomic<i32>, 128>;
@group(0) @binding(1) 
var<storage, read_write> arr_u32_: array<atomic<u32>, 128>;

@compute @workgroup_size(1, 1, 1) 
fn test_atomic_compare_exchange_i32_() {
    var i: u32 = 0u;
    var old: i32;
    var exchanged: bool;

    loop {
        if (i < SIZE) {
        } else {
            break;
        }
        {
            old = atomicLoad((&arr_i32_[i]));
            exchanged = false;
            loop {
                if !(exchanged) {
                } else {
                    break;
                }
                {
                    let new_ = bitcast<i32>((bitcast<f32>(old) + 1f));
                    let _e23 = atomicCompareExchangeWeak((&arr_i32_[i]), old, new_);
                    old = _e23.old_value;
                    exchanged = _e23.exchanged;
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
fn test_atomic_compare_exchange_u32_() {
    var i_1: u32 = 0u;
    var old_1: u32;
    var exchanged_1: bool;

    loop {
        if (i_1 < SIZE) {
        } else {
            break;
        }
        {
            old_1 = atomicLoad((&arr_u32_[i_1]));
            exchanged_1 = false;
            loop {
                if !(exchanged_1) {
                } else {
                    break;
                }
                {
                    let new_1 = bitcast<u32>((bitcast<f32>(old_1) + 1f));
                    let _e23 = atomicCompareExchangeWeak((&arr_u32_[i_1]), old_1, new_1);
                    old_1 = _e23.old_value;
                    exchanged_1 = _e23.exchanged;
                }
            }
        }
        continuing {
            i_1 = (i_1 + 1u);
        }
    }
    return;
}
