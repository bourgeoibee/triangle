struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) vertex_position: vec3<f32>,
};

@vertex
fn vertex_main(
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(1 - i32(in_vertex_index)) * 0.5;
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    out.vertex_position = out.clip_position.xyz;
    return out;
}

@fragment
fn fragment_main(in: VertexOutput) -> @location(0) vec4<f32> {
    let r = 0.5 - 0.5 * in.vertex_position.x;
    let g = 0.5 - 0.5 * in.vertex_position.y;
    return vec4<f32>(r, g, 0.1, 1.0);
}
