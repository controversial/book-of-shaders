#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  float lightness = smoothstep(
    sin(u_time) * 0.25 + 0.25,
    -sin(u_time) * 0.25 + 0.75,
    st.x);
  vec3 color = vec3(lightness);
  gl_FragColor = vec4(color, 1.0);
}
