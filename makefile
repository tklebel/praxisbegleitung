all: index.html 
	#speaker_notes.pdf

index.html: main.md style.css
	pandoc -t "revealjs"  $(<F) -o $(@F) --smart --standalone --toc --toc-depth=1 \
	-V revealjs-url:reveal.js \
	-V theme=beige \
	--css=style.css \
	-V transition=convex 


# speaker_notes.pdf: speaker_notes.md
# 	pandoc $(<F) -o $(@F) --smart --standalone --number-sections --filter pandoc-citeproc \
# 	--template=excerpt.tex --data-dir=/Users/thomask/Documents/LaTeX/pandoc --variable urlcolor=blue 

live:
	git push
	git checkout gh-pages
	git merge master
	git push
	git checkout master
