package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestColorCreate(t *testing.T) {
	c := color("#ff0000")

	assert.Equal(t, uint8(0xff), c.r, "red is ff")
}
