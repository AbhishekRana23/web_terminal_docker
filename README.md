## Dockerfile for a Web Terminal

### Build the image

```
docker build -t <image-name> .
```

<image-name> can be anything you wish example

`docker build -t my_own_web_terminal .`

**Note**:  don't forget the **.** at the end cos, it denotes the current directory

### On successful build list the images

```
docker images
```

### Run the image

```
docker run -it -p 7681:7681 <image-name>
```

 ex: `docker run -it -p 7681:7681 my_own_web_terminal`
 
 Now you can visit [http://localhost:7681](http://localhost:7681) and start playing with your own web playground.