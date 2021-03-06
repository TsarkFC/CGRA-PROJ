#ifdef GL_ES
precision highp float;
#endif


attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat4 uNMatrix;

uniform float timeFactor;
uniform float v;
uniform float speed;

varying vec2 vTextureCoord;

uniform float normScale;


void main() {
	vec3 offset=vec3(0.0, 0.0, 1.0);
	
	vTextureCoord.x = aTextureCoord.x;
	vTextureCoord.y = -aTextureCoord.y;

	offset *= sin((timeFactor * (v*speed*2.0+0.1) + aTextureCoord.x * 10.0)) / 5.0 * aTextureCoord.x;
	gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition + offset , 1.0);
}



