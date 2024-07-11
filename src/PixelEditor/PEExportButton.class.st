Class {
	#name : #PEExportButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

{
	#category : #exporting,
	#'squeak_changestamp' : 'GLE 6/19/2024 21:30'
}
PEExportButton >> directory [

	^ 'Exported-Images'
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:10'
}
PEExportButton >> doAction [

	self export
]

{
	#category : #exporting,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:14'
}
PEExportButton >> export [

	| fileName |
	
	fileName := self openFileSaverDialog getUserResponse.
	fileName isNil ifFalse: [
		(fileName findLastOccurrenceOfString: '.png' startingAt: 1) = 0 
			ifTrue: [ fileName := fileName, '.png' ].
		self exportAsPNG: fileName ]
]

{
	#category : #exporting,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:14'
}
PEExportButton >> exportAsPNG: aFileName [
	
	JPEGReadWriter2 
		putForm: (self target formFromCanvas) quality: -1 progressiveJPEG: true onFileNamed: aFileName.
]

{
	#category : #'ui label',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:31'
}
PEExportButton >> windowTitle [

	^ 'Export File'
]
