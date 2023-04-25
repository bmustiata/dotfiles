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

	if m == nil {
		e := fmt.Errorf("cannot parse %s as a color", value)
		log.Fatal(e)
	}

	result := Color{}

	result.isDefined = true
	result.r = colorFromGroup(m, 1)
	result.g = colorFromGroup(m, 2)
	result.b = colorFromGroup(m, 3)

	return result
}

func colorFromGroup(m []string, index int) uint8 {
	red, _ := strconv.ParseUint(m[index], 16, 8)
	return uint8(red)
}
