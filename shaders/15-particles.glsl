#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.141592653

uniform vec2 u_resolution;
uniform float u_time;


void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float progress = (fract(u_time / 4.)
    // Go off bounds a little bit on each side
    * 1.1 - 0.05)
    // Range from 0 to 2PI
    * 2. * PI;

  vec2 center = vec2(
    // Moves across the screen horizontally, repeats
    progress / (2. * PI),
    // Moves up and down, centered
    0.5 + (200./u_resolution.y) * sin(progress)
  ) * u_resolution;
  float distanceFromCenter = distance(gl_FragCoord.xy, center);

  float lightness = smoothstep(29., 31., distanceFromCenter);
  vec3 color = mix(
    vec3(1., 1., 1.),
    vec3(0., 0., 0.),
    lightness
  );

  gl_FragColor = vec4(color, 1.);
}
