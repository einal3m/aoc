package year2021

import (
	"sort"
	"strconv"
)

func day09a(input []string) int {
	grid := parseInput(input)

	risk := 0
	for point, location := range grid {
		if lowest(grid, point, location.value) {
			risk += location.value + 1
		}
	}

	return risk
}

type Point struct {
	x int
	y int
}

type Location struct {
	value int
	basin int
}

func parseInput(input []string) map[Point]Location {
	grid := map[Point]Location{}

	for y, line := range input {
		for x, char := range line {
			val, _ := strconv.Atoi(string(char))
			grid[Point{x: x, y: y}] = Location{value: val, basin: -1}
		}
	}

	return grid
}

func lowest(grid map[Point]Location, point Point, value int) bool {
	if neighbour, ok := grid[Point{x: point.x, y: point.y + 1}]; ok {
		if neighbour.value <= value {
			return false
		}
	}
	if neighbour, ok := grid[Point{x: point.x, y: point.y - 1}]; ok {
		if neighbour.value <= value {
			return false
		}
	}
	if neighbour, ok := grid[Point{x: point.x + 1, y: point.y}]; ok {
		if neighbour.value <= value {
			return false
		}
	}
	if neighbour, ok := grid[Point{x: point.x - 1, y: point.y}]; ok {
		if neighbour.value <= value {
			return false
		}
	}
	return true
}

func day09b(input []string) int {
	grid := parseInput(input)

	basinId := 1
	for point, location := range grid {
		if lowest(grid, point, location.value) {
			grid[point] = Location{value: location.value, basin: basinId}
			basinId++
		}
	}

	grid = processBasin(grid)
	grid = processBasin(grid)
	grid = processBasin(grid)
	grid = processBasin(grid)
	grid = processBasin(grid)
	grid = processBasin(grid)
	grid = processBasin(grid)

	return countBasins(grid)
}

func processBasin(grid map[Point]Location) map[Point]Location {
	for point, location := range grid {
		if location.value == 9 {
			continue
		}
		if location.basin > 0 {
			continue
		}

		neighbourBasinId := checkNeighbours(grid, point)
		if neighbourBasinId > 0 {
			grid[point] = Location{value: location.value, basin: neighbourBasinId}
		}
	}
	return grid
}

func checkNeighbours(grid map[Point]Location, point Point) int {
	if neighbour, ok := grid[Point{x: point.x, y: point.y + 1}]; ok {
		if neighbour.basin > 0 {
			return neighbour.basin
		}
	}
	if neighbour, ok := grid[Point{x: point.x, y: point.y - 1}]; ok {
		if neighbour.basin > 0 {
			return neighbour.basin
		}
	}
	if neighbour, ok := grid[Point{x: point.x + 1, y: point.y}]; ok {
		if neighbour.basin > 0 {
			return neighbour.basin
		}
	}
	if neighbour, ok := grid[Point{x: point.x - 1, y: point.y}]; ok {
		if neighbour.basin > 0 {
			return neighbour.basin
		}
	}
	return -1
}

func countMissingBasins(grid map[Point]Location) int {
	count := 0

	for _, location := range grid {
		if location.value != 9 && location.basin == -1 {
			count++
		}
	}

	return count
}

func countBasins(grid map[Point]Location) int {
	basinCounts := map[int]int{}

	for _, location := range grid {
		if location.basin > 0 {
			basinCounts[location.basin]++
		}
	}

	countList := []int{}
	for _, count := range basinCounts {
		countList = append(countList, count)
	}
	sort.Ints(countList)

	return countList[len(countList)-1] * countList[len(countList)-2] * countList[len(countList)-3]
}
