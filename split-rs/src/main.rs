use std::io::{self, Read, Write};

fn main() -> io::Result<()> {
    let count = std::env::args().nth(1).unwrap_or("10000".into())
        .parse::<usize>().unwrap();

    let mut buf = [0; 1 << 20];
    io::stdin().read_exact(&mut buf)?;

    let stdout = io::stdout();
    let mut w = io::BufWriter::new(stdout);

    for _i in 0..count {
        for v in buf.split(|c| *c == b'0') {
            w.write(&v)?;
            w.write(&[b'\n'])?;
        }
    }

    Ok(())
}
