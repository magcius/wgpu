struct Particle {
    pos: vec2<f32>,
    vel: vec2<f32>,
}

struct SimParams {
    deltaT: f32,
    rule1Distance: f32,
    rule2Distance: f32,
    rule3Distance: f32,
    rule1Scale: f32,
    rule2Scale: f32,
    rule3Scale: f32,
}

struct Particles {
    particles: array<Particle>,
}

const NUM_PARTICLES: u32 = 1500u;

@group(0) @binding(0) 
var<uniform> params: SimParams;
@group(0) @binding(1) 
var<storage> particlesSrc: Particles;
@group(0) @binding(2) 
var<storage, read_write> particlesDst: Particles;

@compute @workgroup_size(64, 1, 1) 
fn main(@builtin(global_invocation_id) global_invocation_id: vec3<u32>) {
    var vPos: vec2<f32>;
    var vVel: vec2<f32>;
    var cMass: vec2<f32> = vec2<f32>(0f, 0f);
    var cVel: vec2<f32> = vec2<f32>(0f, 0f);
    var colVel: vec2<f32> = vec2<f32>(0f, 0f);
    var cMassCount: i32 = 0i;
    var cVelCount: i32 = 0i;
    var pos: vec2<f32>;
    var vel: vec2<f32>;
    var i: u32 = 0u;

    let index = global_invocation_id.x;
    if (index >= NUM_PARTICLES) {
        return;
    }
    vPos = particlesSrc.particles[index].pos;
    vVel = particlesSrc.particles[index].vel;
    loop {
        if (i >= NUM_PARTICLES) {
            break;
        }
        if (i == index) {
            continue;
        }
        pos = particlesSrc.particles[i].pos;
        vel = particlesSrc.particles[i].vel;
        if (distance(pos, vPos) < params.rule1Distance) {
            cMass = (cMass + pos);
            cMassCount = (cMassCount + 1i);
        }
        if (distance(pos, vPos) < params.rule2Distance) {
            colVel = (colVel - (pos - vPos));
        }
        if (distance(pos, vPos) < params.rule3Distance) {
            cVel = (cVel + vel);
            cVelCount = (cVelCount + 1i);
        }
        continuing {
            i = (i + 1u);
        }
    }
    if (cMassCount > 0i) {
        cMass = ((cMass / vec2(f32(cMassCount))) - vPos);
    }
    if (cVelCount > 0i) {
        cVel = (cVel / vec2(f32(cVelCount)));
    }
    vVel = (((vVel + (cMass * params.rule1Scale)) + (colVel * params.rule2Scale)) + (cVel * params.rule3Scale));
    vVel = (normalize(vVel) * clamp(length(vVel), 0f, 0.1f));
    vPos = (vPos + (vVel * params.deltaT));
    if (vPos.x < -1f) {
        vPos.x = 1f;
    }
    if (vPos.x > 1f) {
        vPos.x = -1f;
    }
    if (vPos.y < -1f) {
        vPos.y = 1f;
    }
    if (vPos.y > 1f) {
        vPos.y = -1f;
    }
    particlesDst.particles[index].pos = vPos;
    particlesDst.particles[index].vel = vVel;
    return;
}
