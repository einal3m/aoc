package year2021

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

func day13a(input []string) int {
	points, instructions := parseInput(input)
	instruction := instructions[0]

	if instruction.direction == "y" {
		points = foldUp(points, instruction)
	} else {
		points = foldLeft(points, instruction)
	}

	return len(points)
}

func foldUp(points map[Point]bool, instruction Instruction) map[Point]bool {
	newPoints := map[Point]bool{}

	// fold up
	// everything below y = y1, needs to be moved up to 2*y1 - y
	for point, _ := range points {
		if point.y < instruction.amount {
			newPoints[point] = true
		} else {
			newPoints[Point{point.x, 2*instruction.amount - point.y}] = true
		}
	}

	return newPoints
}

func foldLeft(points map[Point]bool, instruction Instruction) map[Point]bool {
	newPoints := map[Point]bool{}

	// fold left
	// everything after x = x1 needs to be moved left to 2*x1 - x
	for point, _ := range points {
		if point.x < instruction.amount {
			newPoints[point] = true
		} else {
			newPoints[Point{2*instruction.amount - point.x, point.y}] = true
		}
	}

	return newPoints
}

type Point struct {
	x int
	y int
}

type Instruction struct {
	direction string
	amount    int
}

func parseInput(input []string) (map[Point]bool, []Instruction) {
	points := map[Point]bool{}
	folds := []Instruction{}
	foldInstructionIndex := 0

	for i, row := range input {
		if row == "" {
			foldInstructionIndex = i + 1
			break
		}

		bits := strings.Split(row, ",")
		x, _ := strconv.Atoi(bits[0])
		y, _ := strconv.Atoi(bits[1])
		points[Point{x, y}] = true
	}

	for i := foldInstructionIndex; i < len(input); i++ {
		val := input[i][11:len(input[i])]
		bits := strings.Split(val, "=")
		amount, _ := strconv.Atoi(bits[1])

		folds = append(folds, Instruction{bits[0], amount})
	}

	return points, folds
}

func day13b(input []string) {
	points, instructions := parseInput(input)

	for _, instruction := range instructions {
		if instruction.direction == "y" {
			points = foldUp(points, instruction)
		} else {
			points = foldLeft(points, instruction)
		}
	}

	printPaper(points)
}

func printPaper(points map[Point]bool) {
	minX := math.MaxInt
	minY := math.MaxInt
	maxX := -math.MaxInt
	maxY := -math.MaxInt

	for point, _ := range points {
		if point.x > maxX {
			maxX = point.x
		}
		if point.y > maxY {
			maxY = point.y
		}
		if point.x < minX {
			minX = point.x
		}
		if point.y < minY {
			minY = point.y
		}
	}

	for y := minY; y <= maxY; y++ {
		for x := minX; x <= maxX; x++ {
			if points[Point{x, y}] {
				fmt.Printf("#")
			} else {
				fmt.Printf(".")
			}
		}
		fmt.Println("")
	}
}
