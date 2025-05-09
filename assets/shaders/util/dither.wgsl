// 4x4 Bayer matrix (normalized to 0–1 range)
fn bayer_4x4(x: u32, y: u32) -> f32 {
    let bayer4x4 = array<array<u32, 4>, 4>(
        array<u32, 4>( 0,  8,  2, 10),
        array<u32, 4>(12,  4, 14,  6),
        array<u32, 4>( 3, 11,  1,  9),
        array<u32, 4>(15,  7, 13,  5),
    );
    return f32(bayer4x4[y % 4][x % 4]) / 16.0;
}

fn bayer_8x8(x: u32, y: u32) -> f32 {
    let bayer8x8 = array<array<u32, 8>, 8>(
        array<u32, 8>( 0, 48, 12, 60,  3, 51, 15, 63),
        array<u32, 8>(32, 16, 44, 28, 35, 19, 47, 31),
        array<u32, 8>( 8, 56,  4, 52, 11, 59,  7, 55),
        array<u32, 8>(40, 24, 36, 20, 43, 27, 39, 23),
        array<u32, 8>( 2, 50, 14, 62,  1, 49, 13, 61),
        array<u32, 8>(34, 18, 46, 30, 33, 17, 45, 29),
        array<u32, 8>(10, 58,  6, 54,  9, 57,  5, 53),
        array<u32, 8>(42, 26, 38, 22, 41, 25, 37, 21),
    );

    let xi = x % 8;
    let yi = y % 8;
    return f32(bayer8x8[yi][xi]) / 64.0; // Normalize to [0.0, ~0.984]
}
