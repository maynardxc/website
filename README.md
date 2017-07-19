# Maynard XC Website

### About:
Maynard cross country website

### Install:

Install all dependencies using the handy `reinstall` script:
```
npm run reinstall
```
*This does a clean (re)install of all npm and elm packages.*


### Serve locally:
```
npm start
```
* Access app at `http://localhost:8080/`
* Get coding! The entry point file is `src/elm/Main.elm`
* Browser will refresh automatically on any file changes..

#### Troubleshooting

You might see an error like,

```
ERROR in ./src/elm/Main.elm
Module build failed: Error: Compiler process exited with error Compilation failed
Starting downloads...

  ● debois/elm-dom 1.2.3
  ✗ elm-lang/animation-frame 1.0.1
  ● elm-lang/core 5.1.1
elm-make: elm-lang-mouse-f738b73: rename: unsatisified constraints (Directory not empty)
```

The first time running `npm start` but it will succeeded the second time.

### Build & bundle for prod:
```
npm run build
```

* Files are saved into the `/dist` folder
* To run locally, use `npm run local`


### Credits:

* [jiwhiz starter pack](https://github.com/jiwhiz/elm-bootstrap-webpack-starter)
