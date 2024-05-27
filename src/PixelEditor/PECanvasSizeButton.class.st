Class {
	#name : #PECanvasSizeButton,
	#superclass : #PEButton,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/21/2024 22:38'
}
PECanvasSizeButton >> buttonback [	
	
	^ self actionLeft: #save;
		extent: (PEButtonBuilder canvasSizeButtonSize);
		label: 'Create Project';
		yourself
]
