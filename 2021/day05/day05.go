package year2021

import (
	"strconv"
	"strings"
)

func day05a(input []string) int {
	segments := parseInput(input)
	field := map[Point]int{}

	for _, s := range segments {
		if s.x1 == s.x2 {
			if s.y1 > s.y2 {
				for y := s.y2; y <= s.y1; y++ {
					field[Point{s.x1, y}]++
				}
			} else {
				for y := s.y1; y <= s.y2; y++ {
					field[Point{s.x1, y}]++
				}
			}
		} else if s.y1 == s.y2 {
			if s.x1 > s.x2 {
				for x := s.x2; x <= s.x1; x++ {
					field[Point{x, s.y1}]++
				}
			} else {
				for x := s.x1; x <= s.x2; x++ {
					field[Point{x, s.y1}]++
				}
			}
		}
	}
	return countMultiple(field)
}

type Point struct {
	x int
	y int
}

type Segment struct {
	x1 int
	y1 int
	x2 int
	y2 int
}

func countMultiple(field map[Point]int) int {
	totalCount := 0
	for _, count := range field {
		if count > 1 {
			totalCount++
		}
	}
	return totalCount
}

// 576,67 -> 801,67
func parseInput(input []string) []Segment {
	segments := []Segment{}
	for _, line := range input {
		points := strings.Split(line, " -> ")
		point1 := strings.Split(points[0], ",")
		x1, _ := strconv.Atoi(point1[0])
		y1, _ := strconv.Atoi(point1[1])
		point2 := strings.Split(points[1], ",")
		x2, _ := strconv.Atoi(point2[0])
		y2, _ := strconv.Atoi(point2[1])
		segments = append(segments, Segment{x1: x1, x2: x2, y1: y1, y2: y2})
	}
	return segments
}

func day05b(input []string) int {
	segments := parseInput(input)
	field := map[Point]int{}

	for _, s := range segments {
		xIncrement := 0
		if s.x1 > s.x2 {
			xIncrement = -1
		} else if s.x2 > s.x1 {
			xIncrement = 1
		}
		yIncrement := 0
		if s.y1 > s.y2 {
			yIncrement = -1
		} else if s.y1 < s.y2 {
			yIncrement = 1
		}

		for x, y := s.x1, s.y1; ((s.x1 == s.x2) || (s.x2 > s.x1 && x <= s.x2) || (s.x1 > s.x2 && x >= s.x2)) && ((s.y1 == s.y2) || (s.y2 > s.y1 && y <= s.y2) || (s.y1 > s.y2 && y >= s.y2)); x, y = x+xIncrement, y+yIncrement {
			field[Point{x, y}]++
		}
	}

	return countMultiple(field)
}
