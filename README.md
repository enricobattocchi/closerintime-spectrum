# Closer In Time — ZX Spectrum Edition

A ZX Spectrum BASIC port of [closerinti.me](https://closerinti.me).

<img width="960" height="720" alt="screenshot" src="https://github.com/user-attachments/assets/60cc87e0-f0c5-4491-8627-d583dab12896" />

Select 2 or 3 historical events and see them on a proportional timeline. The program generates comparison sentences like:

> *"Cleopatra's death is closer to us than to the Great Pyramid of Giza"*

50 curated events from 28000 BC to 2022.

## Controls

| Key | Action |
|-----|--------|
| **Q** / **7** | Move cursor up |
| **A** / **6** | Move cursor down |
| **SPACE** | Select / deselect event |
| **G** | Show timeline (when 2+ selected) |

## Running

Download `closerintime.tzx` from the [latest release](https://github.com/enricobattocchi/closerintime-spectrum/releases/latest) and load it in any ZX Spectrum emulator ([FUSE](https://fuse-emulator.sourceforge.net/), [ZXSpin](https://www.zxspin.org/), etc.).

Or [play in your browser](https://jsspeccy.zxdemo.org/) by dragging the TZX file onto the emulator window.

## Building from source

Requires `zmakebas` and `fuse-emulator-utils`:

```sh
sudo apt install zmakebas fuse-emulator-utils
zmakebas -a 1 -n "CLOSERINT" -o closerintime.tap closerintime.bas
tapeconv closerintime.tap closerintime.tzx
```
