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
	paletteValue := paletteColor(value)

	if paletteValue != "" {
		value = paletteValue
	}

	r := regexp.MustCompilePOSIX("#?([0-9a-fA-F]{2,2})([0-9a-fA-F]{2,2})([0-9a-fA-F]{2,2})")
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

func paletteColor(value string) string {
	switch value {
	case "black":
		return "#121212"
	case "white":
		return "#e4e4e4"
	case "green0":
		return "#008B00"
	case "green1":
		return "#00B100"
	case "green2":
		return "#00D700"
	case "green3":
		return "#2DDA2D"
	case "green4":
		return "#56E156"
	case "blue0":
		return "#034D6D"
	case "blue1":
		return "#05638C"
	case "blue2":
		return "#0881B5"
	case "blue3":
		return "#2E90BB"
	case "blue4":
		return "#52A4C8"
	case "brown0":
		return "#AE5C00"
	case "brown1":
		return "#DE7500"
	case "brown2":
		return "#FF8700"
	case "brown3":
		return "#FFA035"
	case "brown4":
		return "#FFB562"
	case "red0":
		return "#AE0000"
	case "red1":
		return "#DE0000"
	case "red2":
		return "#FF0000"
	case "red3":
		return "#FF3535"
	case "red4":
		return "#FF6262"
	}

	return ""
}
