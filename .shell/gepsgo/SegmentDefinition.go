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
func segment(icon, fg, bg string) SegmentDefinition {
	return SegmentDefinition{
		icon: icon,
		fg:   color(fg),
		bg:   color(bg),
	}
}

func (this SegmentDefinition) write(value string) {
	// foreground/background set
	if this.fg.isDefined {
		fmt.Printf("\033[38;2;%d;%d;%dm", this.fg.r, this.fg.g, this.fg.b)
	}

	if this.bg.isDefined {
		fmt.Printf("\033[48;2;%d;%d;%dm", this.bg.r, this.bg.g, this.bg.b)
	}

	fmt.Print(value)
	fmt.Print("\033[0m")
}
