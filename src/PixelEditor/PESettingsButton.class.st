Class {
	#name : #PESettingsButton,
	#superclass : #PluggableButtonMorph,
	#instVars : [
		'jsonString'
	],
	#category : #PixelEditor
}

{
	#category : #'user interface',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:32'
}
PESettingsButton >> basicType [

	^ #PESettingsButton
]

{
	#category : #'user interface',
	#'squeak_changestamp' : 'GLE 6/20/2024 12:10'
}
PESettingsButton >> checkIfFileExists: aFileName [
	
	(StandardFileStream isAFileNamed: (StandardFileStream fullName: aFileName))
		ifTrue: [ PEUserInputBuilder default fileExists: aFileName sentFrom: self ]
		ifFalse: [ self writeFile: aFileName stream: (StandardFileStream newFileNamed: aFileName) ]
		
	
	
]

{
	#category : #'user interface',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:29'
}
PESettingsButton >> directory [
	
	self subclassResponsibility
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:53'
}
PESettingsButton >> mouseDown: anEvent [

	self doAction
]

{
	#category : #'user interface',
	#'squeak_changestamp' : 'GLE 6/20/2024 12:09'
}
PESettingsButton >> openFileSaverDialog [

	^ PEUserInputBuilder default fileSaverDialogWithTitle: self windowTitle andDirectory: self directory
]

{
	#category : #'user interface',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:29'
}
PESettingsButton >> windowTitle [

	self subclassResponsibility
]
