struct UniformIndex {
    index: u32,
}

struct Foo {
    x: u32,
    far: array<i32>,
}

struct FragmentIn {
    @location(0) @interpolate(flat) index: u32,
}

@group(0) @binding(0) 
var<storage> storage_array: binding_array<Foo, 1>;
@group(0) @binding(10) 
var<uniform> uni: UniformIndex;

@fragment 
fn main(fragment_in: FragmentIn) -> @location(0) @interpolate(flat) u32 {
    var u1_: u32 = 0u;

    let uniform_index = uni.index;
    let non_uniform_index = fragment_in.index;
    u1_ = (u1_ + storage_array[0].x);
    u1_ = (u1_ + storage_array[uniform_index].x);
    u1_ = (u1_ + storage_array[non_uniform_index].x);
    u1_ = (u1_ + arrayLength((&storage_array[0].far)));
    u1_ = (u1_ + arrayLength((&storage_array[uniform_index].far)));
    u1_ = (u1_ + arrayLength((&storage_array[non_uniform_index].far)));
    return u1_;
}
