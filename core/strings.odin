import "core:mem.odin"

new_string :: proc(s: string) -> string {
	c := make([]u8, len(s)+1);
	copy(c, cast([]u8)s);
	c[len(s)] = 0;
	return string(c[..len(s)]);
}

new_c_string :: proc(s: string) -> ^u8 {
	c := make([]u8, len(s)+1);
	copy(c, cast([]u8)s);
	c[len(s)] = 0;
	return &c[0];
}

to_odin_string :: proc(str: ^u8) -> string {
	if str == nil do return "";
	end := str;
	for end^ != 0 do end+=1;
	return string(mem.slice_ptr(str, end-str));
}
