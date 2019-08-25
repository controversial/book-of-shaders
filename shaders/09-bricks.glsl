#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  float rows = floor(u_resolution.y / 70.);
  float cols = floor(u_resolution.x / 175.);

  st = vec2(
    fract((st.x - step(0.5, mod(floor(st.y * rows), 2.)) * (.5 / cols)) * cols),
    fract(st.y * rows)
  );
  gl_FragColor = vec4(st.x, st.y, .5, 1.);
}
