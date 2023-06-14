package main

import (
	"fmt"

	"germaniumhq.com/colors/v2"
)

const SEPARATOR = '\uE0B0'
const SEPARATOR_THIN = '\uE0B1'

type SegmentDefinition struct {
	icon string
	fg   colors.Color
	bg   colors.Color
}

/**
 * Create a segment definition for printing on the screen.
 */
func segment(icon, fg, bg string) SegmentDefinition {
	return SegmentDefinition{
		icon: icon,
		fg:   colors.MakeColor(fg),
		bg:   colors.MakeColor(bg),
	}
}

func (this SegmentDefinition) write(value string) {
	// foreground/background set
	if this.fg.IsDefined {
		fmt.Printf("\033[38;2;%d;%d;%dm", this.fg.R, this.fg.G, this.fg.B)
	}

	if this.bg.IsDefined {
		fmt.Printf("\033[48;2;%d;%d;%dm", this.bg.R, this.bg.G, this.bg.B)
	}

	fmt.Print(value)
	fmt.Print("\033[0m")
}
