# xojo-blurhash
This is a **work in progress** [BlurHash](https://blurha.sh) implementation for Xojo. It is useful when there is a high amount of images you need to download, but you want to show something in the meantime, a really blurry version of the final image.

The module contains a custom Canvas that displays the rendered image based on the hash, automatically. As it is CPU intensive, it will draw a quick low-quality version, while the final one finishes in a thread.

At the moment it only contains the decoder. I'm interested in create an encoder later.
