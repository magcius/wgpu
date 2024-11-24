struct NagaConstants {
    int first_vertex;
    int first_instance;
    uint other;
};
ConstantBuffer<NagaConstants> _NagaConstants: register(b0, space1);

struct PushConstants {
    float multiplier;
};

struct FragmentIn {
    float4 color : LOC0;
};

ConstantBuffer<PushConstants> pc: register(b0);

struct FragmentInput_main {
    float4 color : LOC0;
};

float4 vert_main(float2 pos : LOC0, uint ii : SV_InstanceID, uint vi : SV_VertexID) : SV_Position
{
    return float4((((float((_NagaConstants.first_instance + ii)) * float((_NagaConstants.first_vertex + vi))) * pc.multiplier) * pos), 0.0, 1.0);
}

float4 main(FragmentInput_main fragmentinput_main) : SV_Target0
{
    FragmentIn in_ = { fragmentinput_main.color };
    return (in_.color * pc.multiplier);
}
