#define PI 3.1415926535
#define PI2 (PI * 2.)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 worldMatrix;
uniform mat4 projectionMatrix;
uniform mat4 worldInverseTransposeMatrix;

varying vec4 vTransformedNormal;
varying vec4 vPosition;
varying vec3 vColor;

void main(void) {
  vColor = (position / 2.) + 0.5;
  vPosition = worldMatrix * vec4(position, 1.0);
  vTransformedNormal = worldInverseTransposeMatrix * vec4(normal, 1.0);
  gl_Position = projectionMatrix * vPosition;
}
