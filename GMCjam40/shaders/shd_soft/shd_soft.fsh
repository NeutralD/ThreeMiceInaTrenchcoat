struct VERTEX
{
	float4 pos : SV_POSITION;
	float2 tex : TEXCOORD0;
};


struct PIXEL
{
	float4 col : COLOR0;
};

//MIN is the z-near clipping distance.
#define MIN 1.
//MIN is the z-far clipping distance.
#define MAX 65025.
//Screen resolution
#define RES float2(1366,768) 
//#define RATIO RES.x/RES.y
#define SAM 32.
#define RAD 6.

float unpack_depth(float4 samp)
{
	float z = dot(samp,1./float4(1,255,65025,16581375));
	
	return z*(MAX-MIN)+MIN;
}
float2 hash2(float2 p)
{
	return normalize(frac(cos(mul(p,float2x2(94.55,-69.38,-89.27,78.69)))*825.79)-.5);
}

PIXEL main(VERTEX IN) : SV_TARGET
{
    float4 depthRGBA = gm_BaseTextureObject.Sample(gm_BaseTexture,IN.tex);
	
	float depth = unpack_depth(depthRGBA);
	
	float3 pos = float3(IN.tex-.5,1)*float3(RES.x/RES.y,1,1)*depth;
	float o = 0.;
	
	float s = RAD*RES.x/SAM/depth;
	float2 r = hash2(IN.tex)*s;
	float2x2 g = float2x2(.73736882209777832,-.67549037933349609,.67549037933349609,.73736882209777832);
	
	for(float i = 1.;i<=SAM;i++)
	{
		r = mul(r,g);
		float2 u = IN.tex + r*i/RES;
		float2 b = step(abs(u-.5),.5);
		
		float d = unpack_depth(gm_BaseTextureObject.Sample(gm_BaseTexture,u));
		float3 p = float3(u-.5,1)*float3(RES.x/RES.y,1,1)*d-pos;
		float l = length(p);
		
		o += b.x*b.y*rsqrt(1.+l/RAD)*clamp(3.-l/RAD,0.,1.);
	}
	
	PIXEL OUT;
	float occ = 1.-4.*o/SAM;
	OUT.col = float4(occ,occ,occ,1);
    return OUT;
}