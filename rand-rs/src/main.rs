// use rand::{Rng, SeedableRng};
use rand::prelude::*;
use rand::distributions::Alphanumeric;
use rand_chacha::ChaCha8Rng;
use std::io::{self, Write};

fn main() -> io::Result<()> {
    let mut rng = ChaCha8Rng::seed_from_u64(12345);
    loop {
        let data: Vec<u8> = (&mut rng).sample_iter(&Alphanumeric)
            .take(1 << 10)
            .collect();
        let r = io::stdout().write(&data);
        if r.is_err() {
            return Ok(())
        }
    }
}
