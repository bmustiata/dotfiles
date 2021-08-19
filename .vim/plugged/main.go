package main

import "fmt"

type TypeA struct {
	name string
}

type TypeB struct {
	que string
}

func Create(t string) interface{} {
	if t == "a" {
		return TypeA { name: "wut" }
	}

	return TypeB { que: "meh" }
}

func main() {
	x := Create("a").(TypeB)
	fmt.Println(x)
}
