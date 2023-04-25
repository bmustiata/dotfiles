package main

import "regexp"

type Color struct {
	r, g, b uint8
}

func color(value string) (Color, error) {
	r := regexp.MustCompilePOSIX("#?([0-9a-f]{2,2}([0-9a-f]{2,2}))([0-9a-f]{2,2})")
	m := r.FindAllString(value, -1)

	if
}
