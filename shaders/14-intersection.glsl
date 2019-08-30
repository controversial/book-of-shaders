#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  float barsX = 70.;
  float barsY = 70.;

  // -pi to pi in both dimensions
  vec2 st = gl_FragCoord.xy / u_resolution * 2. * PI - PI;
  // Use floor to create second set of coordinates which are stepped in a grid
  vec2 st2 = vec2(
    floor(st.x * (barsX / (2. * PI))) / (barsX / (2. * PI)),
    floor(st.y * (barsY / (2. * PI))) / (barsY / (2. * PI))
  );

  float xCenter = 0.5 * cos(st2.x + u_time * 5.);
  float yCenter = 0.5 * sin(st2.y + u_time * 5.);


  float yLightness =
    // Thick sin wave
    (1. - step(PI / 2., abs(st.x - yCenter)))
    // Stripes
    * mod(st2.y * (barsY / (2. * PI)), 2.);

  float xLightness =
    (1. - step(PI / 2., abs(st.y - xCenter)))
    * mod(st2.x * (barsX / (2. * PI)), 2.);

  float lightness = mod(yLightness + xLightness, 2.);

  gl_FragColor = vec4(vec3(lightness), 1.);
}
