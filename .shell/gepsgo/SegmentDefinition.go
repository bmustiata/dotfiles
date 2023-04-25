package main

import "fmt"

const SEPARATOR = '\uE0B0'
const SEPARATOR_THIN = '\uE0B1'

type SegmentDefinition struct {
	icon string
	fg   Color
	bg   Color
}

/**
 * Create a segment definition for printing on the screen.
 */
func segment(icon string, fg, bg Color) SegmentDefinition {
	return SegmentDefinition{
		icon: icon,
		fg:   fg,
		bg:   bg,
	}
}

func (this SegmentDefinition) write(value string) {
	// foreground/background set
	if this.fg != "" {
		fmt.Printf("\033[38;05;%sm", this.fg)
	}

	if this.bg != "" {
		fmt.Printf("\033[48;05;%sm", this.bg)
	}

	fmt.Print(value)
	fmt.Print("\033[0m")
}
