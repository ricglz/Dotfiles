sudo chmod -R ugo+rw /usr/local/texlive
tlmgr update --self
tlmgr install adjustbox babel-german background bidi collectbox csquotes everypage filehook footmisc \
  footnotebackref framed fvextra letltxmacro lm-math ly1 mdframed mweights needspace pagecolor sourcecodepro \
  sourcesanspro titling ucharcat ulem unicode-math upquote xecjk xurl zref
tlmgr update --all
