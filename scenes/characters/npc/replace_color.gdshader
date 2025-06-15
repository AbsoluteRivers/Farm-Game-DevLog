shader_type canvas_item;

//void vertex() {
	// Called for every vertex the material is visible on.
//}
//unnecessary

uniform vec4 original_0 : source_color;
uniform vec4 original_1 : source_color;
uniform vec4 original_2 : source_color;

uniform vec4 replace_0 : source_color;
uniform vec4 replace_1 : source_color;
uniform vec4 replace_2 : source_color;

const float precision = 0.1;

vec4 replace_color(vec4 color) {
	vec4 original_colors[3] = vec4[3](original_0, original_1, original_2);
	vec4 replace_colors[3] = vec4[3](replace_0, replace_1, replace_2);
	
	for(int i = 0; i < 3; i++){
		if (distance(color, original_colors[i]) <= precision){
			color = replace_colors[i];
		}
	}
	
	return color;
	
}


void fragment() {
	// Called for every pixel the material is visible on.
	//vec4 color = texture(TEXTURE, UV);
	
	
	//if (distance(color, original_0) <= precision){
		//color = replace_0;
	//}
	
	COLOR = replace_color((texture(TEXTURE, UV)));
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
//unnecessary