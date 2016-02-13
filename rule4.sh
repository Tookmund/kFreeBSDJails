#!/bin/sh
while read RULE ; do devfs rule -s 4 add ${RULE} ; done <<EOF
hide
path log unhide
path null unhide
path zero unhide
path crypto unhide
path random unhide
path urandom unhide
path ptyp* unhide
path ptyq* unhide
path ptyr* unhide
path ptys* unhide
path ptyP* unhide
path ptyQ* unhide
path ptyR* unhide
path ptyS* unhide
path ptyl* unhide
path ptym* unhide
path ptyn* unhide
path ptyo* unhide
path ptyL* unhide
path ptyM* unhide
path ptyN* unhide
path ptyO* unhide
path ttyp* unhide
path ttyq* unhide
path ttyr* unhide
path ttys* unhide
path ttyP* unhide
path ttyQ* unhide
path ttyR* unhide
path ttyS* unhide
path ttyl* unhide
path ttym* unhide
path ttyn* unhide
path ttyo* unhide
path ttyL* unhide
path ttyM* unhide
path ttyN* unhide
path ttyO* unhide
path ptmx unhide
path pts unhide
path pts/* unhide
path fd unhide
path fd/* unhide
path stdin unhide
path stdout unhide
path stderr unhide
path ptyp* unhide user root group root
path pt* unhide
EOF
