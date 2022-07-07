package year2021

import (
	"strconv"
)

func day11a(input []string) int {
	grid := parseInput(input)
	flashCount := 0

	noOfSteps := 100
	for i := 1; i <= noOfSteps; i++ {
		grid = addOneToAll(grid)
		grid, flashCount = processFlashes(grid, flashCount)
	}

	return flashCount
}

func addOneToAll(grid map[Point]int) map[Point]int {
	for point, _ := range grid {
		grid[point]++
	}
	return grid
}

func processFlashes(grid map[Point]int, flashCount int) (map[Point]int, int) {
	for {
		anyFlashes := false

		for point, val := range grid {
			if val > 9 {
				grid[point] = 0
				grid = addOneToAllNeighbours(point, grid)
				flashCount++
				anyFlashes = true
			}
		}

		if !anyFlashes {
			return grid, flashCount
		}
	}
}

func addOneToAllNeighbours(point Point, grid map[Point]int) map[Point]int {
	neighbours := []Point{
		Point{point.x - 1, point.y - 1},
		Point{point.x, point.y - 1},
		Point{point.x + 1, point.y - 1},
		Point{point.x - 1, point.y},
		Point{point.x + 1, point.y},
		Point{point.x - 1, point.y + 1},
		Point{point.x, point.y + 1},
		Point{point.x + 1, point.y + 1},
	}

	for _, neighbour := range neighbours {
		if grid[neighbour] != 0 {
			grid[neighbour]++
		}
	}

	return grid
}

type Point struct {
	x int
	y int
}

func parseInput(input []string) map[Point]int {
	grid := map[Point]int{}

	for y, line := range input {
		for x, char := range line {
			val, _ := strconv.Atoi(string(char))
			grid[Point{x: x, y: y}] = val
		}
	}

	return grid
}

func day11b(input []string) int {
	grid := parseInput(input)
	height := len(input)
	width := len(input[0])

	i := 1
	for {
		flashCount := 0
		grid = addOneToAll(grid)
		grid, flashCount = processFlashes(grid, flashCount)

		if flashCount == height*width {
			return i
		}
		i++
	}

	return i
}
