#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.1415926

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  float rows = floor(u_resolution.y / 50.);
  float cols = floor(u_resolution.x / 50.);
  float xOffset = (1. / cols) * (.5 * cos(PI * u_time) + .5) * mod(floor(u_time), 2.);
  float yOffset = (1. / rows) * (.5 * cos(PI * (u_time + 1.)) + .5) * mod(floor(u_time + 1.), 2.);

  st = vec2(
    fract(cols * (st.x + (step(0.5, mod(floor(st.y * rows), 2.)) * 2.0 - 1.0) * xOffset)),
    fract(rows * (st.y + (step(0.5, mod(floor(st.x * cols), 2.)) * 2.0 - 1.0) * yOffset))
  );
  float lightness = smoothstep(.22, .26, distance(st, vec2(0.5, 0.5)));
  gl_FragColor = vec4(vec3(lightness), 1.);
}
