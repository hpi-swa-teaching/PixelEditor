Class {
	#name : #PECanvasSizeInput3,
	#superclass : #PEUI,
	#instVars : [
		'heightInput',
		'widthInput'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 23:35'
}
PECanvasSizeInput3 >> createMorph [

Transcript show: 'Hello, world!'; cr.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 23:31'
}
PECanvasSizeInput3 >> createMorphi [

    | redMorph |
    redMorph := Morph new.
    redMorph color: Color red.
    redMorph extent: 100@100. "Größe des Morphs festlegen"

    World addMorph: redMorph.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInput3 >> heightInput [

	^ heightInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInput3 >> heightInput: aHeight [

	heightInput := aHeight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:35'
}
PECanvasSizeInput3 >> initialize [

	self open
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 23:56'
}
PECanvasSizeInput3 >> okbutton [

|s bp|

s := StringMorph new.
s openInWorld.
s contents: '0'.
s position: 100@100. 

bp := SimpleButtonMorph new.
bp openInWorld.
bp label: 'Submit size'.
bp position: 50@50.
bp target: [ s contents: (s contents asInteger -1) asString].
bp actionSelector: #value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/22/2024 19:24'
}
PECanvasSizeInput3 >> open [

| window button textInput|

window := SystemWindow new.
window setLabel: 'My System Window';
extent: 1000@2000.

"Erstellen und Konfigurieren des TextMorphs"
textInput := TextMorph new.
textInput position: 50@75;
    extent: 200@30; "Größe des TextMorphs"
    borderWidth: 1; "Optional: Hinzufügen eines Rahmens"
    borderColor: Color black; "Optional: Rahmenfarbe"
	backgroundColor: Color white.
textInput contents: ''. "Leeres Textfeld" 

button := PEButton new.
button anObject: self;
		arguments: (Array with: textInput);
		actionLeft: #saveText:;
		extent: 300@100;
		label: 'Submit size';
		position: 70@150;
		color: Color blue.
button labelText textColor: Color white.

window addMorph: textInput.
window addMorph: button.
window openInWorld.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:34'
}
PECanvasSizeInput3 >> processHeight: height width: width [
    "Hier kannst du tun, was du mit den Werten machen möchtest"
    Transcript show: 'Height: ', height printString; cr.
    Transcript show: 'Width: ', width printString; cr.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/22/2024 11:15'
}
PECanvasSizeInput3 >> saveText: aText [

aText getNumericValue
	ifNotNil: [Transcript show: aText contents; cr.]
	ifNil: [Transcript show: 'Ne'; cr.]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:34'
}
PECanvasSizeInput3 >> submit [
    | height width |
    
    height := self heightInput contents asInteger.
    width := self widthInput contents asInteger.
    
    self processHeight: height width: width.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInput3 >> widthInput [

	^ widthInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInput3 >> widthInput: aWidth [

	widthInput := aWidth
]
