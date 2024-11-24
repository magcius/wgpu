#version 310 es

precision highp float;
precision highp int;

layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

struct Particle {
    vec2 pos;
    vec2 vel;
};
struct SimParams {
    float deltaT;
    float rule1Distance;
    float rule2Distance;
    float rule3Distance;
    float rule1Scale;
    float rule2Scale;
    float rule3Scale;
};
const uint NUM_PARTICLES = 1500u;

uniform SimParams_block_0Compute { SimParams _group_0_binding_0_cs; };

layout(std430) readonly buffer Particles_block_1Compute {
    Particle particles[];
} _group_0_binding_1_cs;

layout(std430) buffer Particles_block_2Compute {
    Particle particles[];
} _group_0_binding_2_cs;


void main() {
    uvec3 global_invocation_id = gl_GlobalInvocationID;
    vec2 vPos = vec2(0.0);
    vec2 vVel = vec2(0.0);
    vec2 cMass = vec2(0.0, 0.0);
    vec2 cVel = vec2(0.0, 0.0);
    vec2 colVel = vec2(0.0, 0.0);
    int cMassCount = 0;
    int cVelCount = 0;
    vec2 pos = vec2(0.0);
    vec2 vel = vec2(0.0);
    uint i = 0u;
    uint index = global_invocation_id.x;
    if ((index >= NUM_PARTICLES)) {
        return;
    }
    vPos = _group_0_binding_1_cs.particles[index].pos;
    vVel = _group_0_binding_1_cs.particles[index].vel;
    bool loop_init = true;
    while(true) {
        if (!loop_init) {
            i = (i + 1u);
        }
        loop_init = false;
        if ((i >= NUM_PARTICLES)) {
            break;
        }
        if ((i == index)) {
            continue;
        }
        pos = _group_0_binding_1_cs.particles[i].pos;
        vel = _group_0_binding_1_cs.particles[i].vel;
        if ((distance(pos, vPos) < _group_0_binding_0_cs.rule1Distance)) {
            cMass = (cMass + pos);
            cMassCount = (cMassCount + 1);
        }
        if ((distance(pos, vPos) < _group_0_binding_0_cs.rule2Distance)) {
            colVel = (colVel - (pos - vPos));
        }
        if ((distance(pos, vPos) < _group_0_binding_0_cs.rule3Distance)) {
            cVel = (cVel + vel);
            cVelCount = (cVelCount + 1);
        }
    }
    if ((cMassCount > 0)) {
        cMass = ((cMass / vec2(float(cMassCount))) - vPos);
    }
    if ((cVelCount > 0)) {
        cVel = (cVel / vec2(float(cVelCount)));
    }
    vVel = (((vVel + (cMass * _group_0_binding_0_cs.rule1Scale)) + (colVel * _group_0_binding_0_cs.rule2Scale)) + (cVel * _group_0_binding_0_cs.rule3Scale));
    vVel = (normalize(vVel) * clamp(length(vVel), 0.0, 0.1));
    vPos = (vPos + (vVel * _group_0_binding_0_cs.deltaT));
    if ((vPos.x < -1.0)) {
        vPos.x = 1.0;
    }
    if ((vPos.x > 1.0)) {
        vPos.x = -1.0;
    }
    if ((vPos.y < -1.0)) {
        vPos.y = 1.0;
    }
    if ((vPos.y > 1.0)) {
        vPos.y = -1.0;
    }
    _group_0_binding_2_cs.particles[index].pos = vPos;
    _group_0_binding_2_cs.particles[index].vel = vVel;
    return;
}

