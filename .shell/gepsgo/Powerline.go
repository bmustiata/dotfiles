package main

import "fmt"

/**
 * Permits writing a powerline string for use in the command line.
 */
type Powerline struct {
	segmentStarted   bool
	lastSegmentColor SegmentDefinition
}

/**
 * Add a segment with the given colors on the screen.
 */
func (this *Powerline) addSegment(value string, s SegmentDefinition) {
	// close previous segment if needed
	if this.segmentStarted {
		SegmentDefinition{
			fg: this.lastSegmentColor.bg,
			bg: s.bg,
		}.write(string(SEPARATOR))
	}

	this.lastSegmentColor = s
	this.segmentStarted = true

	if s.icon != "" {
		s.write(s.icon)
	}

	s.write(value)
}

/**
 * Close the current segment.
 */
func (this *Powerline) closeSegment() {
	if !this.segmentStarted {
		return
	}

	SegmentDefinition{
		fg: this.lastSegmentColor.bg,
		bg: Color{},
	}.write(string(SEPARATOR))
}

func (this *Powerline) addRootSegment(s SegmentDefinition) {
	this.addSegment("$", s)
}

func (this *Powerline) addEnter() {
	if !this.segmentStarted {
		return
	}

	this.segmentStarted = false
	this.closeSegment()

	fmt.Println()
}
