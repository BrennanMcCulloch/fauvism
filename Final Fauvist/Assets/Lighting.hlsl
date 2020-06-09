void GetLightingInformation_float(out float3 Direction, out float3 Color,out float Attenuation)
{
 Direction = float3 (0,0,0);
        Color = float3 (0,0,0);
        Attenuation = 0;
   
    #ifdef LIGHTWEIGHT_LIGHTING_INCLUDED
 
    Light mainLight = GetMainLight();
            Color = mainLight.color;
            Direction = mainLight.direction;
            float4 shadowCoord;
            #ifdef _SHADOWS_ENABLED
            #if SHADOWS_SCREEN
                float4 clipPos = TransformWorldToHClip(WorldPos);
                shadowCoord = ComputeShadowCoord(clipPos);
            #else
                shadowCoord = TransformWorldToShadowCoord(WorldPos);
            #endif
            mainLight.attenuation = MainLightRealtimeShadowAttenuation(shadowCoord);
            #endif
            Attenuation = mainLight.attenuation;
#endif

}