This repo houses a bunch of miscellaneous
`lex | yacc` scripts and tools.

To build any, use the Make targets

Currently available make targets:

```
clean     # rm of end built target
calc1     # simple addition calculator
calc2     # more sophisticated calculator-handles division etc al
calc3     # a mini program language, contains control-flow and while loop
wc        # this is a copy of the wc cli tool but made with lex
html_tags # this will grab each html token in an html doc
```

I verified these on a mac Air running ARM M4 chip. You may
need to change things slightly depending on your distro.
If you do, open an issue and lmk what changes necessary,
I'd like to make these examples both cross platform and
educational.

## NOTEs:

1. The Makefile uses custom output files for both
  flex & yacc so you will notice some header names
  that differ from the boilerplate you often see
  in flex/yacc tutorials. For example if you look
  at calc2 build DAG and inspect the files you will
  see that `#include "calc2parser.tab.h"` is used
  instead of the more typical `y.tab.h`. Check the
  `calc2.l` lexer file for more details.

2. flex alone can be a handy tool, the `wc` target
   and affiliated source code is one example. While
   it uses a compiler, the target does not use `yacc`.

3. In the compilation targets in the makefile
   the cli arguments `-ll` link the flex symbols to
   get the build working. This may or may not be a thing
   on older macs or other distros, it is needed for
   compilation on my machine.


