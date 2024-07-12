"
A PEPluggableTextMorphPlus is a PluggableTextMorphPlus with some modifications so we do not get the orange triangle in the upper right corner when editing the text and you cant scroll.

Instance Variables

"
Class {
	#name : #PEPluggableTextMorphPlus,
	#superclass : #PluggableTextMorphPlus,
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:38'
}

{
	#category : #contents,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:40'
}
PEPluggableTextMorphPlus >> string [

	^ self text asString
]

{
	#category : #miscellaneous,
	#'squeak_changestamp' : 'LW 6/10/2024 18:47'
}
PEPluggableTextMorphPlus >> vScrollBarPolicy [

	^ #never
]

{
	#category : #miscellaneous,
	#'squeak_changestamp' : 'LW 6/10/2024 19:34'
}
PEPluggableTextMorphPlus >> wantsFrameAdornments [

	^ false
]
