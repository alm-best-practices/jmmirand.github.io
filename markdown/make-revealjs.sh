
export FROM=markdown+emoji
export TRANSITION=linear
export THEME=jmms-white
export SLIDE_LEVEL=2

pandoc -s --from ${FROM} \
  -t revealjs  \
  -V transition=${TRANSITION} \
  -V theme=${THEME} \
  -V revealjs-url="../reveal.js" \
  -V center=true \
  --slide-level=${SLIDE_LEVEL} \
  -o markdown/reveal.html \
  markdown/revealjs.md
