#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_resolution;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  vec2 center = vec2(
    0.5 + 0.3 * cos(u_time * 3.),
    0.5 + 0.3 * sin(u_time * 2.)
  ) * u_resolution;
  float distanceFromCenter = distance(gl_FragCoord.xy, center);
  float lightness = step(30.0, distanceFromCenter);
  vec3 color = mix(vec3(0.0784, 0.5451, 0.9255), vec3(0.075, 0.075, 0.075), lightness);
  gl_FragColor = vec4(color, 1.0);
}
