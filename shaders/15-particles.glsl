#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.141592653

uniform vec2 u_resolution;
uniform float u_time;


float random() { return fract(sin(u_time) * 100000.); }
float random(float seed) { return fract(sin(seed) * 100000.); }


vec2 particlePos(float seed, float time) {
  float this_startProgress = random(seed + .5);
  float this_speed = random(seed + .6) * 20. + 5.;
  float this_amplitude = random(seed + .7) * .15;
  float this_yshift = random(seed + .8) * .3 - .15;
  float progress = fract(this_startProgress + (time / 4.));

  return vec2(
    progress * 1.1 - 0.05, // go off left and right edge a little bit
    0.5 + this_yshift + (this_amplitude * sin(progress * 2. * PI))
  ) * u_resolution;
}


void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec3 color = vec3(0., 0., 0.);

  float radius;
  float opacity;
  vec2 center;
  float inCircle;

  for (float seed = 0.; seed < 100.; seed += 1.) {
    radius = random(seed) * 15. + 5.;
    opacity = random(seed + .1);
    center = particlePos(seed, u_time);
    inCircle = smoothstep(radius - 1., radius + 1., distance(gl_FragCoord.xy, center));
    color += mix(
      vec3(opacity, opacity, opacity),
      vec3(0., 0., 0.),
      inCircle
    );
  }

  gl_FragColor = vec4(color, 1.);
}
