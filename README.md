# xojo-blurhash
This is a [BlurHash](https://blurha.sh) implementation for Xojo. It is useful when there is a high amount of images you need to download, but you want to show something in the meantime, a really blurry version of the final image.

![BlurHash Screenshot](/public/blurhash-example.png)

The module contains a custom Canvas that displays the rendered image based on the hash, automatically. As it is CPU intensive, it will draw a quick low-quality version, while the final one finishes in a thread.

This module contains a custom Canvas component capable of rendering encoded hashes. There is also a Thread for generating the final pictures in background, and the raw Decoder. The Encoder is also included, so you can now hash the pictures.
