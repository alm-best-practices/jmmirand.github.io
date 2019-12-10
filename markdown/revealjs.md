---
title: Crear Presentaciones HTLM usando MarckDown
author: Jose Miguel Miranda Sanabria
date: Diciembre-2019
output:
  ioslides_presentation:
    widescreen: true
    smaller: true

# Reveal.js & Pandoc

---

# Presentaciones MarkDown {.smaller}

---

## Herramientas


### Reveal.js

Framwork para hacer presentaciones en html muy faciles y apariencia profesional.

### Pandoc

Herramienta que permite tranformar de culaquier formato a cualquier formato

___

# Instalación

Sobre **MacOS Mojave 10.14.6**

Instalaremos todo lo necesario

## Pandoc

Instalamos Pandoc usaremos homebrew

``` bash
# Para la Instalación
brew install pandoc

# Para la Actualización
brew upgrade pandoc
```

## NodeJS

Instalamos NodeJS con [nodebrew](https://github.com/hokaccha/nodebrew)


```bash

# Comprobamos si está instalado y que version tenemos
$ which node
node not found  

# Instalamos nodebrew
$ brew install nodebrew
==> Downloading https://github.com/../v1.0.1.tar.gz
==> Downloadin
....

# Comprobamos la version
$ nodebrew -v
nodebrew 1.0.1

Usage:
    nodebrew help                         Show ..
    nodebrew install <version>            Download..
...

# Añadimos  en el path nodebrew
$ echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH'\
        >> ~/.zprofile

# Cargamos el perfil zbash
$ source ~/.zprofile

# Versiones de node disponibles con nodebrew
$ nodebrew ls-remote
v0.0.1    v0.0.2    v0.0.3    v0.0.4    v0.0.5

v0.1.0    v0.1.1    v0.1.2    v0.1.3    v0.1.4


# Configurar NodeBrew
$ nodebrew setup

# Instalar la version estable e node
$ nodebrew install-binary stable


# Versiones instaladas
$ nodebrew ls
v10.15.1


# activamos la version de node que queremos usar
$ nodebrew use v10.15.1

# Comprobamos
$ node -v
v10.15.1

```

## Clonar reveal.js

```bash
$ cd your/work/directory

$ git clone https://github.com/hakimel/reveal.js.git
Cloning into 'reveal.js'...
remote: Enumerating objects: 11068, done.
...
```

## Fin Instalación.

## Referencias

  - [Set-up to convert a markdown file to reveal.js slides by pandoc](https://dev.to/berry_clione/set-up-to-convert-a-markdown-file-to-revealjs-slides-by-pandoc-58n5)   
----

# QuickStart

## Crear fichero MD

Creamos un fichero md en el directorio de trabajo

```MarkDown

% Title
% Name
% yyyy/mm/dd

# Header1

---

### Header3

- foo
- bar
- foobar

---

### header

1. foo
1. bar
1. baz

# HEADER

---

_foo_

__bar__

___baz___

[foobar_link](https://github.com/hakimel/reveal.js/#full-setup)

> foo bar  
> baz

```

## Estructura Directorio

```bash
$ cd your/work/directory
$ tree
.
├── reveal.js
│       └--...
└── test.md

```

## Ejecutamos la Transformación

```bash
# Opciones que nos interesan cambiar
export THEME=black
export SLIDE_LEVEL=1 d

#Ejecutamos la transformación
$ pandoc -s -t revealjs  \
            --variable transition=linear \
            -V theme=${THEME} \
            -V revealjs-url="reveal.js" \
            --slide-level=${SLIDE_LEVEL} \
            -o test.html \
            test.md

# abrimos el fichero que se acaba de generar
$ open test.html
```
---
# MarkDown

Marckdown es un formato fichero texto simple, este nos permitirá traducirlo
a formato presentación.

## MarckDown : Headers

ATX-style

```
### Header 3 **Bold** [link](/url)

#### Header 4

##### Header 5

<smaller>Texto Pequeño con Smaller</smaller>

```

Setext-style

```
Header1
=================

Header2
__________________

```

## MarckDown : Ejemplos Headers

### Header 3 **Bold** [link](/url)

#### Header 4 **Bold** [link](/url)  

##### Header 5 **Bold** [link](/url)

<smaller>Texto Pequeño con Smaller</smaller>

## MarckDown : Listas

Listas Numeradas

```
1. Opción 1
1. Opción 2
    5. Sub Opcion 1
    1. Sub Opcion
```

Lista Bullet

```
 * Opcion1
   - Opción 1.1
 * Opción2
```

## MarckDown : Ejemplo Listas

Lista Numeradas

1. Opción 1
1. Opción 2
    5. Sub Opcion 1
    1. Sub Opcion

Lista Bullet

* Opcion1
  - Opción 1.1
* Opción2


## Bloque Código

Los bloques de código pueden realizarse con la notación MarckDown o bien empezar la línea con '>'

```
> Ejemplo
> Ejemplo 2

```
Ejemplo Bloque

> This is a block quote. This
> paragraph has two lines.
>
> 1. This is a list inside a block quote.
> 2. Second item.


# Reveal.js Themes

Cambiar el tema se hace vía comando

## Cambio Tema por defecto {-}

En la línea de comando se puede especificar el comando usando camviando el valor del a variable theme -v/--variable


```
pandoc -s -t revealjs  \
  --variable transition=linear \
  --variable theme=black \
  --variable revealjs-url="../reveal.js" \
  --slide-level=${SLIDE_LEVEL} \
  -o markdown/reveal.html \
  markdown/revealjs.md
```

## Lista de temas disponibles {-}

```
➜  reveal.js git:(master) ✗ tree
.
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── bower.json
├── css
│   ├── print
│   │   ├── paper.css
│   │   └── pdf.css
│   ├── reset.css
│   ├── reveal.css
│   ├── reveal.scss
│   └── theme
│       ├── README.md
│       ├── beige.css
│       ├── black.css
│       ├── blood.css
│       ├── jmms.css
│       ├── league.css
│       ├── moon.css
│       ├── night.css
│       ├── serif.css
│       ├── simple.css
│       ├── sky.css
│       ├── solarized.css
│       ├── source
│       │   ├── beige.scss
│       │   ├── black.scss
│       │   ├── blood.scss
```

## Personalización de Fuente {-}

  * Para cambiar la fuente por defecto, editar la css del tema.

```css
.reveal {
  font-family: "Source Sans Pro", Helvetica, sans-serif;
  font-size: 30px;
  color: #222; }
```
  * Se puede modificar el estilo y tamaño de las cabeceras

```css
.reveal h1,
.reveal h6 {
  margin: 0 0 20px 0;
  color: #222;
  font-family: Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif;}

.reveal h1 {
  font-size: 1.7em;
  color: #FF0000;
  text-transform: uppercase; }
```


# Extensiones

## emojis

Para los emojis neceistamos activar su extensión

:smile:
:penguin:

[Lista de emojis](https://gist.github.com/rxaviers/7360908)

```bash
export FROM=markdown+emoji
pandoc -s --from ${FROM} \
  -t revealjs  \
  -V transition=${TRANSITION} \
  -V theme=${THEME} \
  -V revealjs-url="../reveal.js" \
  -V center=true \
  --slide-level=${SLIDE_LEVEL} \
  -o markdown/reveal.html \
  markdown/revealjs.md
```


# Referencias

* [Reveal.js](https://revealjs.com/#/) presentation framework
* [Reveal.js on GitHub](https://github.com/hakimel/reveal.js).
* [Pandoc](https://pandoc.org/) document converter
* [Instalación HomeBrew](https://dev.to/berry_clione/install-homebrew-on-macos-mojave-4m3m)
* [BookDown Presentaciones Reveal](https://bookdown.org/yihui/rmarkdown/revealjs.html)
* [Slides en HTML](https://en.wikipedia.org/wiki/Web-based_slideshow)
