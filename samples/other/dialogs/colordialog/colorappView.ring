# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.13 Form Designer
# Date : 27/06/2020
# Time : 01:39:57

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new colorappView { win.show() } 
		exec()
	}
}

class colorappView from WindowsViewParent
	win = new MainWindow() { 
		move(20,20)
		resize(400,400)
		setWindowTitle("RingQt for WebAssembly - Select Color")
		setstylesheet("background-color:;") 
		Button1 = new pushbutton(win) {
			move(45,83)
			resize(186,44)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			setText("Set Color")
			setClickEvent(Method(:setcolor))
			setBtnImage(Button1,"")
			
		}
		Layout1 = new QVBoxLayout() {
			AddWidget(Button1)
			
		}

		oMWLayoutWidget = new qWidget() { setLayout(Layout1) }
		setCentralWidget(oMWLayoutWidget) 
	}

# End of the Generated Source Code File...