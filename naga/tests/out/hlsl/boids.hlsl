struct Particle {
    float2 pos;
    float2 vel;
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

static const uint NUM_PARTICLES = 1500u;

cbuffer params : register(b0) { SimParams params; }
ByteAddressBuffer particlesSrc : register(t1);
RWByteAddressBuffer particlesDst : register(u2);

[numthreads(64, 1, 1)]
void main(uint3 global_invocation_id : SV_DispatchThreadID)
{
    float2 vPos = (float2)0;
    float2 vVel = (float2)0;
    float2 cMass = float2(0.0, 0.0);
    float2 cVel = float2(0.0, 0.0);
    float2 colVel = float2(0.0, 0.0);
    int cMassCount = 0;
    int cVelCount = 0;
    float2 pos = (float2)0;
    float2 vel = (float2)0;
    uint i = 0u;

    uint index = global_invocation_id.x;
    if ((index >= NUM_PARTICLES)) {
        return;
    }
    vPos = asfloat(particlesSrc.Load2(0+index*16+0));
    vVel = asfloat(particlesSrc.Load2(8+index*16+0));
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
        pos = asfloat(particlesSrc.Load2(0+i*16+0));
        vel = asfloat(particlesSrc.Load2(8+i*16+0));
        if ((distance(pos, vPos) < params.rule1Distance)) {
            cMass = (cMass + pos);
            cMassCount = (cMassCount + 1);
        }
        if ((distance(pos, vPos) < params.rule2Distance)) {
            colVel = (colVel - (pos - vPos));
        }
        if ((distance(pos, vPos) < params.rule3Distance)) {
            cVel = (cVel + vel);
            cVelCount = (cVelCount + 1);
        }
    }
    if ((cMassCount > 0)) {
        cMass = ((cMass / (float(cMassCount)).xx) - vPos);
    }
    if ((cVelCount > 0)) {
        cVel = (cVel / (float(cVelCount)).xx);
    }
    vVel = (((vVel + (cMass * params.rule1Scale)) + (colVel * params.rule2Scale)) + (cVel * params.rule3Scale));
    vVel = (normalize(vVel) * clamp(length(vVel), 0.0, 0.1));
    vPos = (vPos + (vVel * params.deltaT));
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
    particlesDst.Store2(0+index*16+0, asuint(vPos));
    particlesDst.Store2(8+index*16+0, asuint(vVel));
    return;
}
