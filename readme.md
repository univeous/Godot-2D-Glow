# Godot 2D Glow demo
This repository is a godot port of [Brackeys Unity 2D GLOW tutorial](https://www.youtube.com/watch?v=WiDVoj5VQ4c).

You can make part of sprite glow,and change the glow color at runtime.

![Pireview](imgs/preview.png)

There is also a better(I think) hdr color picker in this repository:

![Hdr Color Picker preview](imgs/hdr-color-picker.jpg)

## How it works
The player's [material](https://github.com/2254FB/Godot-2D-Glow/blob/master/godot/materials/player_emission.tres) will set specific hdr color to part of sprite,
and the WorldEnvironment node in main scene will make all hdr color glow.

## Credits
- The main idea comes from [Brackeys](https://www.youtube.com/c/Brackeys).

- The sprites is created by [ansimuz](https://opengameart.org/content/gothicvania-church-pack).

- Some of the code in hdr_color_picker.gd is from [UnityCsReference](https://github.com/Unity-Technologies/UnityCsReference/blob/master/Editor/Mono/GUI/ColorMutator.cs).
