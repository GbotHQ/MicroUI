# ![microui](https://user-images.githubusercontent.com/3920290/75171571-be83c500-5723-11ea-8a50-504cc2ae1109.png)
 A complete rewrite of the amazing microui library in nim https://github.com/rxi/microui
 
 See [`demo`](demo) for example usage
 
## Demo requirements
* futhark - see https://github.com/PMunch/futhark?tab=readme-ov-file#installation for installation instructions
* GLFW - see https://www.glfw.org/download.html
* Glad - included in [`demo`](demo)

## Features
* Works within a fixed-sized memory region: no additional memory is allocated
* Built-in controls: window, scrollable panel, button, slider, textbox, label,
  checkbox, wordwrapped text
* Works with any rendering system that can draw rectangles and text
* Designed to allow the user to easily add custom controls
* Simple layout system

## Example
![example](https://user-images.githubusercontent.com/3920290/75187058-2b598800-5741-11ea-9358-38caf59f8791.png)
```c
if (mu_begin_window(ctx, "My Window", mu_rect(10, 10, 140, 86))) {
  mu_layout_row(ctx, 2, (int[]) { 60, -1 }, 0);

  mu_label(ctx, "First:");
  if (mu_button(ctx, "Button1")) {
    printf("Button1 pressed\n");
  }

  mu_label(ctx, "Second:");
  if (mu_button(ctx, "Button2")) {
    mu_open_popup(ctx, "My Popup");
  }

  if (mu_begin_popup(ctx, "My Popup")) {
    mu_label(ctx, "Hello world!");
    mu_end_popup(ctx);
  }

  mu_end_window(ctx);
}
```

## Screenshot
![screenshot](https://user-images.githubusercontent.com/3920290/75188642-63ae9580-5744-11ea-9eee-d753ff5c0aa7.png)

[**Browser Demo**](https://floooh.github.io/sokol-html5/sgl-microui-sapp.html)

## Usage
* See [`doc/usage.md`](doc/usage.md) for usage instructions
* See the [`demo`](demo) directory for a usage example

## Notes
The library expects the user to provide input and handle the resultant drawing
commands, it does not do any drawing itself.

