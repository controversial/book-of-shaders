#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  float lightness = step(0.5, st.y);
  vec3 color = vec3(lightness);
  gl_FragColor = vec4(color, 1.0);
}
