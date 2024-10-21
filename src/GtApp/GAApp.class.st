Class {
	#name : #GAApp,
	#superclass : #Object,
	#instVars : [
		'model',
		'element',
		'topBar'
	],
	#category : #GtApp
}

{ #category : #accessing }
GAApp class >> open [
	^self new open 
]

{ #category : #accessing }
GAApp >> barGray [
	^Color white darker
]

{ #category : #accessing }
GAApp >> model [
	^ model ifNil: [model := GAModel default.
		model announcer when: GAEntityChanged send: #update:  to: self.
		model]
]

{ #category : #accessing }
GAApp >> model: anObject [
	model := anObject
]

{ #category : #accessing }
GAApp >> open [
	| space split |
	self windowElement.
	space := BlSpace new
			position: 100@100;
			extent: 300 @ 200;
			title: 'Application'.
	self topBar.
	element addChild: topBar.
	split := BrHorizontalPane new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent];
		background: Color paleYellow lighter .
	element addChild: split.
	space root addChild: element.
	space when: BlSpaceClosedEvent do: [self model announcer unsubscribe: self].
	space show
]

{ #category : #accessing }
GAApp >> topBar [
	topBar := BlElement new
		size: 300@20;
		constraintsDo: [ :c | 
			c horizontal matchParent];
		background: self barGray;
		yourself
]

{ #category : #'as yet unclassified' }
GAApp >> update: theModelChanged [

]

{ #category : #accessing }
GAApp >> windowElement [
	element := BrVerticalPane new.
	element
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	element margin: (BlInsets all: 5)
]
