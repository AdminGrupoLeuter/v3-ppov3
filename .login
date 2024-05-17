
# @(#)B.11.31_LR      


# Default user .login file ( /usr/bin/csh initialization )

# Set up the default search paths:
set path=( $path )

#set up the terminal
eval `tset -s -Q -m ':?hp' `
stty erase "^H" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop
tabs	

# Set up shell environment:
set noclobber
set history=20
