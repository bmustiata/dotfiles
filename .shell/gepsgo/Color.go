package main

import (
	"fmt"
	"log"
	"regexp"
	"strconv"
)

type Color struct {
	r, g, b   uint8
	isDefined bool
}

func color(value string) Color {
	r := regexp.MustCompilePOSIX("#?([0-9a-f]{2,2})([0-9a-f]{2,2})([0-9a-f]{2,2})")
	m := r.FindStringSubmatch(value)
	fmt.Println(m)

	if m == nil {
		e := fmt.Errorf("cannot parse %s as a color", value)
		log.Fatal(e)
	}

	result := Color{}

	red, _ := strconv.ParseUint(m[1], 16, 8)
	result.r = uint8(red)
	green, _ := strconv.ParseUint(m[2], 16, 8)
	result.g = uint8(green)
	blue, _ := strconv.ParseUint(m[3], 16, 8)
	result.b = uint8(blue)

	return result
}
