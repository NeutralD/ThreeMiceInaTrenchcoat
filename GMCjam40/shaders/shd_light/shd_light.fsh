//MIN is the z-near clipping distance.
#define MIN 1.
//MIN is the z-far clipping distance.
#define MAX 65025.
//Screen resolution
#define SAM 32.
#define RAD 5.
#define AMT 3.

uniform float4 lig_pos;//x,y,z,r
uniform float2 RES;//w,h

Texture2D	 tdep : register(t1);
SamplerState sdep : register(s1);

Texture2D	 tnor : register(t2);
SamplerState snor : register(s2);

struct VERTEX
{
	float4 pos : SV_POSITION;
	float4 col : COLOR0;
	float2 tex : TEXCOORD0;
	float  rat : TEXCOORD1;
};

struct PIXEL
{
	float4 col : COLOR0;
};

float unpack_depth(float4 samp)
{
	float z = dot(samp,1./float4(1,255,65025,16581375));
	
	return z*(MAX-MIN)+MIN;
}

PIXEL main(VERTEX IN) : SV_TARGET
{
    float4 depthRGBA = tdep.Sample(sdep,IN.tex);
	float3 normalRGB = tnor.Sample(snor,IN.tex).rgb;
	
	float depth = unpack_depth(depthRGBA);
	float3 normal = normalize(normalRGB-.5)*float3(1,-1,1);
	
	float3 pos = float3(IN.tex-.5,1)*float3(IN.rat/.5625,1./.5625,1)*depth;
	
	float3 diff = pos-lig_pos.xyz;
	float l = length(diff);
	float c = max(dot(diff/l,-normal),0.)*max(1.-l/lig_pos.w,0.);
	
	PIXEL OUT;
	OUT.col = IN.col*float4(c,c,c,1);
    return OUT;
}