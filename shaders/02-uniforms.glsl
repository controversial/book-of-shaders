#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
	gl_FragColor = vec4(
    (sin(u_time) + 1.0) * .5,
    .5 * st.x + .5,
    .5 * st.y + .5,
    1.0
  );
}
