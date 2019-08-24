#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;

void main() {
  vec3 color1 = vec3(1.0, 0.75, 0.35);
  vec3 color2 = vec3(0.35, 0.25, 0.9);
  vec3 color = mix(color1, color2, (sin(u_time * 2.0) + 1.0) / 2.0);
  gl_FragColor = vec4(color, 1);
}
