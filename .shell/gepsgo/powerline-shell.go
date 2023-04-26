package main

import "fmt"

func main() {
	p := Powerline{}
	// dev segments
	addJavaSegment()
	p.addSegment("java", segment("☕ ", "white", "green0"))
	p.addSegment("cobol", segment("☕ ", "black", "green1"))
	p.addSegment("c++", segment("☕ ", "black", "green2"))
	p.addSegment("python", segment("☕ ", "black", "green3"))
	p.addSegment("node", segment("☕ ", "black", "green4"))
	p.addEnter()
	p.addSegment("ge", segment("☕ ", "white", "blue0"))
	p.addSegment("default", segment("☕ ", "black", "blue1"))
	p.addSegment("admin", segment("☕ ", "black", "blue2"))
	p.addSegment("wut", segment("☕ ", "black", "blue3"))
	p.addSegment("mut", segment("☕ ", "black", "blue4"))
	// p.addSegment("cobol", segment("☕ ", 55, 204))
	// p.addRootSegment(segment("", 13, 26))
	p.closeSegment()

	fmt.Print(" ")
}
