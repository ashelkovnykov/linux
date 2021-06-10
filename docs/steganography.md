# Steganography

Steganography is the practice of concealing one message within another, or within a physical object. In the context of
computing, steganography is the practice of hiding a message, file, image, audio, or video within another file, image,
audio, or video.

## Hiding Files in Images

### Using Linux Commands

1. Secure the files that you want to hide in a zip file:
```shell
zip -r secret.zip /path/to/dir/of/secret/files
```
Alternatively, you can use this command to also encrypt the archive with a password:
```shell
7za a -p secret.zip /path/to/dir/of/secret/files
```
2. Concatenate the zip file with the image in which you wish to hide the zip file:
```shell
cat someImage.png secret.zip > secret.png
```
Note that the image must come first.
3. The image is viewable as normal in an image viewer. To retrieve the files from the image, unzip the image:
```shell
unzip secret.png
7za x secret.png
```

### Using Specialized Software

Instead of manually hiding files in images, it's possible to use specialized software for this task. The two most
popular tools on Linux are `steghide` and `stegosuite`. `steghide` is a command-line tool for hiding encrypted data in
image or audio files without losing quality. `stegosuite` is a GUI-based tool which functions identically to `steghide`,
but can only hide data in images.
