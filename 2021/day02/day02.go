package year2020

import (
	"strconv"
	"strings"
)

// forward X increases the horizontal position by X units.
// down X increases the depth by X units.
// up X decreases the depth by X units.

func day02a(input []string) int {
	position := 0
	depth := 0

	for _, instruction := range input {
		parts := strings.Split(instruction, " ")
		direction := parts[0]
		amount, _ := strconv.Atoi(parts[1])

		switch direction {
		case "forward":
			position += amount
		case "down":
			depth += amount
		case "up":
			depth -= amount
		}
	}

	return depth * position
}

// down X increases your aim by X units.
// up X decreases your aim by X units.
// forward X does two things:
//    - It increases your horizontal position by X units.
//    - It increases your depth by your aim multiplied by X.

func day02b(input []string) int {
	position := 0
	depth := 0
	aim := 0

	for _, instruction := range input {
		parts := strings.Split(instruction, " ")
		direction := parts[0]
		amount, _ := strconv.Atoi(parts[1])

		switch direction {
		case "forward":
			position += amount
			depth += aim * amount
		case "down":
			aim += amount
		case "up":
			aim -= amount
		}
	}

	return depth * position
}
