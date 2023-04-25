package main

import "fmt"

func main() {
	p := Powerline{}
	p.addSegment("java", segment("☕ ", color("#112233"), color("#22ff44")))
	// p.addSegment("cobol", segment("☕ ", 55, 204))
	// p.addRootSegment(segment("", 13, 26))
	p.closeSegment()
	fmt.Print(" ")
}
