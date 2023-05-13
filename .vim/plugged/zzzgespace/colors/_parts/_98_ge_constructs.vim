" normal text stays the same, keywords are roughly normal text
" immovable things are green - constants, static fields, singletons
" local variables, attributes of data (xml, yaml) are blue
" instance variables, and active state is red
" functions, decorators, classes, processors, important names are brown

if &g:background=="light"
<<<<<<< HEAD
" files are separate for keeping in sync with dir
hi! link GeFsDirectory GeBlue0Bold
hi! link GeFsDirectoryLink GeBlue2
hi! link GeFsDirectoryLinkTarget GeGray1Italic
hi! link GeFsExecutable GeGreen0Bold
hi! link GeFsExecutableLink GeGreen0BoldItalic
hi! link GeFsExecutableLinkTarget GeGray1Italic

" normal text
hi! link GeNormal GeBlack
hi! link GeNormalBold GeBlackBold
hi! link GeNormalUnderline GeBlackUnderline
hi! link GeNormalItalic GeBlackItalic
hi! link GeNormalBoldItalic GeBlackBoldItalic
hi! link GeKeyword GeGray2Bold
hi! link GeKeywordItalic GeGray1BoldItalic

" comments are distracting, so they're gray
hi! link GeComment GeGray2Italic
hi! link GeCommentNormal GeGray2
hi! link GeCommentBold GeGray2Bold
hi! link GeCommentBoldItalic GeGray2BoldItalic

" immovable things
hi! link GeConstant GeGreen0
hi! link GeConstantItalic GeGreen0Italic
hi! link GeConstantBold GeGreen0Bold

" state
hi! link GeState GeRed0
hi! link GeStateItalic GeRed0Italic
hi! link GeStateBold GeRed0Bold
hi! link GeStateBoldItalic GeRed0BoldItalic

" locals
hi! link GeLocal GeBlue0Bold
hi! link GeLocalItalic GeBlue0Italic
hi! link GeLocalBold GeBlue0Bold

" important things
hi! link GeTitle GeBrown0Bold
hi! link GeSubTitle GeBrown0
hi! link GeSubTitleItalic GeBrown0Italic
hi! link GeSubTitleBoldItalic GeBrown0BoldItalic
hi! link GeProcessor GeBrown0Italic

hi! link GeLink GeBlue0Underline
else
" else &g:background=="dark"

" files are separate for keeping in sync with dir
hi! link GeFsDirectory GeBlue4Bold
hi! link GeFsDirectoryLink GeBlue2Italic
hi! link GeFsDirectoryLinkTarget GeGray3Italic
hi! link GeFsExecutable GeGreen4Bold
hi! link GeFsExecutableLink GeGreen4BoldItalic
hi! link GeFsExecutableLinkTarget GeGray3Italic

" normal text
hi! link GeNormal GeWhite
hi! link GeNormalBold GeWhiteBold
hi! link GeNormalUnderline GeWhiteUnderline
hi! link GeNormalItalic GeWhiteItalic
hi! link GeNormalBoldItalic GeWhiteBoldItalic
hi! link GeKeyword GeGray3Bold
hi! link GeKeywordItalic GeGray5BoldItalic

" comments are distracting, so they're gray
hi! link GeComment GeGray2Italic
hi! link GeCommentNormal GeGray2
hi! link GeCommentBold GeGray2Bold
hi! link GeCommentBoldItalic GeGray2BoldItalic

" immovable things
hi! link GeConstant GeGreen4
hi! link GeConstantItalic GeGreen4Italic
hi! link GeConstantBold GeGreen4Bold

" state
hi! link GeState GeRed4
hi! link GeStateItalic GeRed4Italic
hi! link GeStateBold GeRed4Bold
hi! link GeStateBoldItalic GeRed4BoldItalic

" locals
hi! link GeLocal GeBlue4
hi! link GeLocalItalic GeBlue4Italic
hi! link GeLocalBold GeBlue4Bold

" important things
hi! link GeTitle GeBrown4Bold
hi! link GeSubTitle GeBrown4
hi! link GeSubTitleItalic GeBrown4Italic
hi! link GeSubTitleBoldItalic GeBrown4BoldItalic
hi! link GeProcessor GeBrown4Italic

hi! link GeLink GeBlue4Underline

=======
  " files are separate for keeping in sync with dir
  hi! link GeFsDirectory GeBlue0Bold
  hi! link GeFsDirectoryLink GeBlue2
  hi! link GeFsDirectoryLinkTarget GeGray1Italic
  hi! link GeFsExecutable GeGreen0Bold
  hi! link GeFsExecutableLink GeGreen0BoldItalic
  hi! link GeFsExecutableLinkTarget GeGray1Italic

  " normal text
  hi! link GeNormal GeBlack
  hi! link GeNormalBold GeBlackBold
  hi! link GeNormalUnderline GeBlackUnderline
  hi! link GeNormalItalic GeBlackItalic
  hi! link GeNormalBoldItalic GeBlackBoldItalic
  hi! link GeKeyword GeGray1Bold
  hi! link GeKeywordItalic GeGray1BoldItalic

  " comments are distracting, so they're gray
  hi! link GeComment GeGray2Italic
  hi! link GeCommentNormal GeGray2
  hi! link GeCommentBold GeGray2Bold
  hi! link GeCommentBoldItalic GeGray2BoldItalic

  " immovable things
  hi! link GeConstant GeGreen0
  hi! link GeConstantItalic GeGreen0Italic
  hi! link GeConstantBold GeGreen0Bold

  " state
  hi! link GeState GeRed0
  hi! link GeStateItalic GeRed0Italic
  hi! link GeStateBold GeRed0Bold
  hi! link GeStateBoldItalic GeRed0BoldItalic

  " locals
  hi! link GeLocal GeBlue0Bold
  hi! link GeLocalItalic GeBlue0Italic
  hi! link GeLocalBold GeBlue0Bold

  " important things
  hi! link GeTitle GeBrown0Bold
  hi! link GeSubTitle GeBrown0
  hi! link GeSubTitleItalic GeBrown0Italic
  hi! link GeSubTitleBoldItalic GeBrown0BoldItalic
  hi! link GeProcessor GeBrown0Italic

  hi! link GeLink GeBlue0Underline
else
  " else &g:background=="dark"

  " files are separate for keeping in sync with dir
  hi! link GeFsDirectory GeBlue4Bold
  hi! link GeFsDirectoryLink GeBlue2Italic
  hi! link GeFsDirectoryLinkTarget GeGray3Italic
  hi! link GeFsExecutable GeGreen4Bold
  hi! link GeFsExecutableLink GeGreen4BoldItalic
  hi! link GeFsExecutableLinkTarget GeGray3Italic

  " normal text
  hi! link GeNormal GeWhite
  hi! link GeNormalBold GeWhiteBold
  hi! link GeNormalUnderline GeWhiteUnderline
  hi! link GeNormalItalic GeWhiteItalic
  hi! link GeNormalBoldItalic GeWhiteBoldItalic
  hi! link GeKeyword GeGray5Bold
  hi! link GeKeywordItalic GeGray5BoldItalic

  " comments are distracting, so they're gray
  hi! link GeComment GeGray2Italic
  hi! link GeCommentNormal GeGray2
  hi! link GeCommentBold GeGray2Bold
  hi! link GeCommentBoldItalic GeGray2BoldItalic

  " immovable things
  hi! link GeConstant GeGreen4
  hi! link GeConstantItalic GeGreen4Italic
  hi! link GeConstantBold GeGreen4Bold

  " state
  hi! link GeState GeRed4
  hi! link GeStateItalic GeRed4Italic
  hi! link GeStateBold GeRed4Bold
  hi! link GeStateBoldItalic GeRed4BoldItalic

  " locals
  hi! link GeLocal GeBlue4
  hi! link GeLocalItalic GeBlue4Italic
  hi! link GeLocalBold GeBlue4Bold

  " important things
  hi! link GeTitle GeBrown4Bold
  hi! link GeSubTitle GeBrown4
  hi! link GeSubTitleItalic GeBrown4Italic
  hi! link GeSubTitleBoldItalic GeBrown4BoldItalic
  hi! link GeProcessor GeBrown4Italic

  hi! link GeLink GeBlue4Underline
>>>>>>> sync
endif


