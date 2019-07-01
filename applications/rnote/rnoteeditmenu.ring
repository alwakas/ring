# The Ring Notepad Application (RNote)
# Author : Mahmoud Fayed <msfclipper@yahoo.com>
# Author : Gal Zsolt 

class RNoteEditMenu

	func Undo
		textedit1.undo()
		StatusMessage("Undo!")

	func Cut
		textedit1.cut()
		StatusMessage("Cut!")

	func CopyText
		textedit1.copy()
		StatusMessage("Copy!")

	func Paste
		textedit1.paste()
		StatusMessage("Paste!")

	func Font
		oFontDialog = new qfontdialog() {

			this.oTFont.fromstring(this.cFont)
			setcurrentfont(this.oTFont)

			aFont = getfont()
		}
		if aFont[1] != NULL
			cFont = aFont[1]
			SetFont()	# set the new font
		ok

	func SetFont
		oTFont.fromstring(cFont)
		oCursor = textedit1.textCursor()
		oCursor.clearselection()
		textedit1.settextcursor(oCursor)
		textedit1.Document().setdefaultfont(oTFont)
		if lSetProjectFilesFont 
			oTFont.setFamily("Roboto")
			oTFont.setStrikeout(False)
			oTFont.setbold(False)
			oTFont.setpointsize(max(oTFont.pointsize()-2,8))
			tree1.setfont(oTFont)
		ok

	func SelectColor
		new qcolordialog() {
			r = exec()
			if r = 0 return ok
			oColor = currentcolor()
			r = oColor.red()
			g = oColor.green()
			b = oColor.blue()
		}
		this.aTextColor = [r,g,b]
		SetColors()

	func SelectColor2
		new qcolordialog() {
			r = exec()
			if r = 0 return ok
			oColor = currentcolor()
			r = oColor.red()
			g = oColor.green()
			b = oColor.blue()
		}
		this.aBackColor = [r,g,b]
		SetColors()

	func SetColors
		this.textedit1.setstylesheet("QPlainTextEdit { color: rgb(" + aTextColor[1] + "," + aTextColor[2] +
					"," + aTextColor[3] + ");" + "background-color: rgb(" +
					aBackColor[1] + "," + aBackColor[2] + "," +
					aBackColor[3] + ") }")

	func LowerCase
		oCursor = textedit1.textCursor()
		nStart = oCursor.SelectionStart() + 1
		nEnd = oCursor.SelectionEnd() + 1
		cStr = textedit1.toPlainText()
		cNewStr = ""
		if nStart > 1
			cNewStr += left(cStr,nStart-1)
		ok
		cNewStr += lower(substr(cStr,nStart,nEnd-nStart)) 
		if nEnd < len(cStr)
			cNewStr += substr(cStr,nEnd)
		ok
		textedit1.setPlainText(cNewStr)
	
	func UpperCase
		oCursor = textedit1.textCursor()
		nStart = oCursor.SelectionStart() + 1
		nEnd = oCursor.SelectionEnd() + 1
		cStr = textedit1.toPlainText()
		cNewStr = ""
		if nStart > 1
			cNewStr += left(cStr,nStart-1)
		ok
		cNewStr += Upper(substr(cStr,nStart,nEnd-nStart)) 
		if nEnd < len(cStr)
			cNewStr += substr(cStr,nEnd)
		ok
		textedit1.setPlainText(cNewStr)
	
	func capitalize
		oCursor = textedit1.textCursor()
		nStart = oCursor.SelectionStart() + 1
		nEnd = oCursor.SelectionEnd() + 1
		cStr = textedit1.toPlainText()
		if nStart = 0
			cStrNew = substr(cStr,nStart+1,nEnd-nStart+1)
		else
			cStrNew = substr(cStr,nStart,nEnd-nStart+1)
		ok            
		cListCap = str2list(cStrNew)
		cStr2 = ""
		for n = 1 to len(cListCap)
			cLeft = upper(left(cListCap[n],1))
			cRight = lower(right(cListCap[n],len(cListCap[n])-1))
			cStr2 = cStr2 + cLeft + cRight
			if n != len(cListCap)
				cStr2 = cStr2 + nl
			ok
		next
		cStart = left(cStr,nStart-1)
		cEnd = substr(cStr,nEnd+1)
		cStr = cStart + cStr2 + cEnd
		textedit1.setPlainText(cStr)
		oCursor.setposition(nEnd+1,0)
		textedit1.settextcursor(oCursor)
