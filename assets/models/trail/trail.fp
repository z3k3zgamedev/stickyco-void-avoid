varying lowp vec4 var_tint;
varying mediump vec2 var_texcoord0;

uniform highp sampler2D texture0;
uniform lowp sampler2D texture1;

void main()
{
    lowp vec4 tint_pm = vec4(var_tint.xyz * var_tint.w, var_tint.w) * vec4(1.0, 1.5, 2.1, 1.0);
    gl_FragColor = texture2D(texture1, var_texcoord0.xy) * tint_pm;
}
