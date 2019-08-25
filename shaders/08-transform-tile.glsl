// Using fract to tile a pattern across the canvas

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  st = vec2(fract(st.x * 4.), fract(st.y * 4.));

  float lightness = step(0.5, st.y + 0.25 * sin(st.x * 4. + u_time * 4.));
  gl_FragColor = vec4(vec3(lightness), 1.0);
}
