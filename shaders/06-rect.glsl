#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float offsetY = 0.1 * sin(u_time * 2.);
  float offsetX = 0.1 * cos(u_time * 2.);
  float left = step(0.1 + offsetX, st.x);
  float bottom = step(0.1 + offsetY, st.y);
  float right = 1.0 - step(0.9 + offsetX, st.x);
  float top = 1.0 - step(0.9 + offsetY, st.y);

  float lightness = left * top * right * bottom;
  vec3 outside = vec3(1.0, 0.75, 0.25);
  vec3 inside = vec3(0.5, 0.75, 0.65);
  vec3 color = mix(outside, inside, lightness);
  gl_FragColor = vec4(color, 1.0);
}
