#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.1415926
uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  float lightness = step(
    0.5 + 0.25 * sin(u_time * .5),
    st.y + 0.25 * sin(st.x * PI + u_time * 2.05)
  );
  vec3 color = vec3(lightness);
  gl_FragColor = vec4(color, 1.0);
}
