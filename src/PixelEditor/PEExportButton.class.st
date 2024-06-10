Class {
	#name : #PEExportButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:10'
}
PEExportButton >> doAction [

	self export
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:44'
}
PEExportButton >> export [

	| fileName |
	
	fileName := PEFileSaver new windowTitle: 'Export File'; 
		setDirectoryTo: (FileDirectory on: (FileStream fullName: 'Exported-Images'));
		getUserResponse.
	fileName isNil ifFalse: [
		(fileName findLastOccurrenceOfString: '.png' startingAt: 1) = 0 ifTrue: 
			[fileName := fileName, '.png'].
		self exportAsPNG: fileName]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:43'
}
PEExportButton >> exportAsPNG: aFileName [
	
	JPEGReadWriter2 putForm: (self target formFromCanvas) quality: -1 progressiveJPEG: true onFileNamed: aFileName.
]
