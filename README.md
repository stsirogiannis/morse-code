# morse.sh

A Bash script that encodes plain text into Morse code and decodes Morse code back into plain text.

- `encode` — converts letters (A–Z) and digits (0–9) into their Morse code equivalent.
- `decode` — converts Morse code (dots `.` and dashes `-`) back into uppercase letters and digits.

## Requirements

- A Unix-like environment with `bash` (uses associative arrays, so Bash 4+ is required).
- Standard core utilities: `grep`, `sed`.

## Setup

Make the script executable before running it:

```bash
chmod +x morse.sh
```

## Usage

```bash
./morse.sh -e <file_to_encode>    # encode a text file into Morse code
./morse.sh -d <file_to_decode>    # decode a Morse code file into text
```

Any other first argument (or none at all) prints `Invalid input.`

## Examples

**Encoding** — given a file `fileE.txt` containing:

```
hello world
```

Running:

```bash
./morse.sh -e fileE.txt
```

produces:

```
.... . .-.. .-.. --- .-- --- .-. .-.. -..
```

**Decoding** — given a file `fileD.txt` containing:

```
.... . .-.. .-.. --- / .-- --- .-. .-.. -..
```

Running:

```bash
./morse.sh -d fileD.txt
```

produces:

```
HELLO WORLD
```

## Notes and behavior

- Input to `encode` is automatically converted to uppercase, so `hello` and `HELLO` produce the same result.
- Decoded output is always uppercase, regardless of how the Morse code was formatted.
- `/` represents a word space in Morse code output and is what `decode` expects between words.
- Characters with no Morse mapping (punctuation such as `,` or `!`) are encoded as `/` by `encode`. Unrecognized Morse tokens are silently skipped by `decode`.
- Extra spaces, tabs, or blank lines in the input file are tolerated and do not break either mode.
- **Known limitation:** because the script reads the file with unquoted word-splitting, spaces *between words* in the source text are consumed while the file is being split into words, before they ever reach the `encode` function. In practice this means running `-e` on multi-word input encodes each word correctly but does **not** insert a `/` separator between words in the output (see the [full documentation](Documentation.pdf) for details). Round-tripping a file through `-e` and then `-d` will therefore merge word boundaries.

## Morse Code Reference

| Char | Code | | Char | Code | | Char | Code |
|---|---|---|---|---|---|---|---|
| A | `.-` | | K | `-.-` | | U | `..-` |
| B | `-...` | | L | `.-..` | | V | `...-` |
| C | `-.-.` | | M | `--` | | W | `.--` |
| D | `-..` | | N | `-.` | | X | `-..-` |
| E | `.` | | O | `---` | | Y | `-.--` |
| F | `..-.` | | P | `.--.` | | Z | `--..` |
| G | `--.` | | Q | `--.-` | | 0 | `-----` |
| H | `....` | | R | `.-.` | | 1 | `.----` |
| I | `..` | | S | `...` | | 2 | `..---` |
| J | `.---` | | T | `-` | | 3 | `...--` |
|   |  | |   |  | | 4 | `....-` |
|   |  | |   |  | | 5 | `.....` |
|   |  | |   |  | | 6 | `-....` |
|   |  | |   |  | | 7 | `--...` |
|   |  | |   |  | | 8 | `---..` |
|   |  | |   |  | | 9 | `----.` |

Word space is represented as `/`.

## Files

| File | Purpose |
|---|---|
| `morse.sh` | The script itself. |
| `README.md` | This quick-start guide. |
| `Documentation.pdf` | Detailed, line-by-line explanation of how the script works. |

For a full technical breakdown of every function and line of code, see **Documentation.pdf**.
