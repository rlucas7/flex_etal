# PHONY target tells make
# tells make that clean is
# not a file to be built
# but rather a label for a
# set of commands that should
# always be executed when requested.

.PHONY: clean

clean:
	rm calc1 calc2 wc

# calc1
# A simple adder calculator which
# handles onlt addition
# taken from Niehmann
# modified a bit for macos
# and to have custom filenames
# for codegen files
calc1.yy.c: calc1.l
	flex -o calc1.yy.c calc1.l

calc1parser.tab.c: calc1.y
	yacc -t -b calc1parser -dy calc1.y

calc1:  calc1.yy.c calc1parser.tab.c
	gcc calc1.yy.c calc1parser.tab.c -o calc1


# calc2 handes multiplication and division
# if you have a complex expression then
# it's best to do something like
# ./calc2 < expression.txt
# where the text file contains the expression to eval
calc2.yy.c: calc2.l
	flex -o calc2.yy.c calc2.l

calc2parser.tab.c: calc2.y
	yacc -t -b calc2parser -dy calc2.y

calc2:  calc2.yy.c calc2parser.tab.c
	gcc calc2.yy.c calc2parser.tab.c -o calc2


# calc goes into more depth 3
# bison -y -d calc3.y

calc3.yy.c: calc3.l
	flex -o calc3.yy.c calc3.l

calc3parser.tab.c: calc3.y
	yacc -t -b calc3parser -dy calc3.y

calc3: calc3.yy.c calc3parser.tab.c
	gcc calc3.yy.c calc3parser.tab.c -o calc3 -ll

#gcc -c y.tab.c lex.yy.c
#gcc y.tab.o lex.yy.o calc3a.c -o calc3a.exe
#gcc y.tab.o lex.yy.o calc3b.c -o calc3b.exe
#gcc y.tab.o lex.yy.o calc3g.c -o calc3g.exe


# a clone of the `wc` command which counts characters
# words and newlines either using `stdin` or the
# stdin via fh redirect
wc.yy.c: wc.l
	flex -o wc.yy.c wc.l

wc:  wc.yy.c
	gcc -o wc  wc.yy.c  -ll


# print out all the html tags in a file
html_tags.yy.c: html_tags.l
	flex -o html_tags.yy.c html_tags.l

html_tags:  html_tags.yy.c
	gcc -o html_tags html_tags.yy.c  -ll

# NOTE: to see this one in action you can do
# curl https://www.example.com/ > example_dot_com
# to put a test file locally
# then pass it intot the built executable
# ./html_tags < example_dot_com
# you will see smth like this:
# ----------------------------
# VALUE: <!doctype html>
# VALUE: <html>
# VALUE: <head>
# VALUE: <title>
# VALUE: </title>
# VALUE: <meta charset="utf-8" />
# VALUE: <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
# VALUE: <meta name="viewport" content="width=device-width, initial-scale=1" />
# VALUE: <style type="text/css">
# VALUE: </style>
# VALUE: </head>
# VALUE: <body>
# VALUE: <div>
# VALUE: <h1>
# VALUE: </h1>
# VALUE: <p>
# VALUE: </p>
# VALUE: <p>
# VALUE: <a href="https://www.iana.org/domains/example">
# VALUE: </a>
# VALUE: </p>
# VALUE: </div>
# VALUE: </body>
# VALUE: </html>
# ----------------------------
# Somewhat handy if doing things with html and a good start to crib from
# After you're done you might want to delete the html file via
# rm example_dot_com
