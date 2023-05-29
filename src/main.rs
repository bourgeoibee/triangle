use pollster;
use winit_input_helper::WinitInputHelper;

fn main() {
    pollster::block_on(wgpu_test::run());
}
