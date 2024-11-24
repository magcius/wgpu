fn main_1() {
    var a: vec4<f64> = vec4(1.0lf);
    var b: vec4<f64> = vec4(2.0lf);
    var m: mat4x4<f64>;
    var i: i32 = 5i;
    var ceilOut: vec4<f64>;
    var roundOut: vec4<f64>;
    var floorOut: vec4<f64>;
    var fractOut: vec4<f64>;
    var truncOut: vec4<f64>;
    var absOut: vec4<f64>;
    var sqrtOut: vec4<f64>;
    var inversesqrtOut: vec4<f64>;
    var signOut: vec4<f64>;
    var transposeOut: mat4x4<f64>;
    var normalizeOut: vec4<f64>;
    var lengthOut: f64;
    var determinantOut: f64;
    var modOut: f64;
    var dotOut: f64;
    var maxOut: vec4<f64>;
    var minOut: vec4<f64>;
    var reflectOut: vec4<f64>;
    var crossOut: vec3<f64>;
    var distanceOut: f64;
    var stepOut: vec4<f64>;
    var ldexpOut: f64;
    var smoothStepScalar: f64;
    var smoothStepVector: vec4<f64>;
    var smoothStepMixed: vec4<f64>;

    let _e8 = a;
    let _e9 = b;
    let _e10 = a;
    let _e11 = b;
    m = mat4x4<f64>(vec4<f64>(_e8.x, _e8.y, _e8.z, _e8.w), vec4<f64>(_e9.x, _e9.y, _e9.z, _e9.w), vec4<f64>(_e10.x, _e10.y, _e10.z, _e10.w), vec4<f64>(_e11.x, _e11.y, _e11.z, _e11.w));
    ceilOut = ceil(a);
    roundOut = round(a);
    floorOut = floor(a);
    fractOut = fract(a);
    truncOut = trunc(a);
    absOut = abs(a);
    sqrtOut = sqrt(a);
    inversesqrtOut = inverseSqrt(a);
    signOut = sign(a);
    transposeOut = transpose(m);
    normalizeOut = normalize(a);
    lengthOut = length(a);
    determinantOut = determinant(m);
    modOut = (a.x - (floor((a.x / b.x)) * b.x));
    dotOut = dot(a, b);
    maxOut = max(a, b);
    minOut = min(a, b);
    reflectOut = reflect(a, b);
    crossOut = cross(a.xyz, b.xyz);
    distanceOut = distance(a, b);
    stepOut = step(a, b);
    ldexpOut = ldexp(a.x, i);
    smoothStepScalar = f64(smoothstep(0f, 1f, 0.5f));
    smoothStepVector = smoothstep(vec4(0.0lf), vec4(1.0lf), vec4(0.5lf));
    smoothStepMixed = smoothstep(vec4(0.0lf), vec4(1.0lf), vec4(0.5lf));
    return;
}

@fragment 
fn main() {
    main_1();
    return;
}
