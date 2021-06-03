#define speed  0.010

varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;
uniform lowp vec4 time;

float intensity = 5;
float radius = 1;

float getGlow(float dist, float radius, float intensity){
    return pow(radius/dist, intensity);
}
    
void main()
{
    vec2 res = vec2(1.0, 1.0);
    vec2 uv = var_texcoord0/res.xy;
    float widthHeightRatio = res.x/res.y;
    vec2 centre = vec2(.5, .5);
    vec2 pos = centre - uv;
    pos.y /= widthHeightRatio;
    // pos.y += 0.03;

    float dist = 1./length(pos);
    dist *= 0.1;
    dist = pow(dist, 0.8);

    float glow = getGlow(dist, radius, intensity);
        
    vec3 col = vec3(0.0);
    col += 10.0*vec3(smoothstep(0.006, 0.003, dist));
    col += glow * vec3(0.1,0.4,1.0);
    col = 1.0 - exp(-col);
    col = pow(col, vec3(0.4545));

    //Output to screen
    gl_FragColor = vec4(col,1.0);
}

