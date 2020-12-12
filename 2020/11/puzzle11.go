package main

import (
	"fmt"
	"strings"
)

func main() {
	fmt.Println("Puzzle11")
}

func Puzzle11a(input []string) int {
	seats, width, height := parseInput(input)

	anyChanges := false
	for true {
		seats, anyChanges = processSeats(seats, width, height, true, 4)

		if !anyChanges {
			break
		}
	}

	return countSeats(seats, width, height)
}

func Puzzle11b(input []string) int {
	seats, width, height := parseInput(input)

	anyChanges := false
	for true {
		seats, anyChanges = processSeats(seats, width, height, false, 5)
		if !anyChanges {
			break
		}
	}

	return countSeats(seats, width, height)
}

func processSeats(seats [][]string, width int, height int, close bool, number int) ([][]string, bool) {
	anyChanges := false
	newSeats := [][]string{}

	for i := 0; i < width; i++ {
		newRow := make([]string, width)
		for j := 0; j < height; j++ {
			if (seats[i][j] == ".") {
				newRow[j] = "."
				continue
			}
			count := countAdjacentSeats(seats, i, j, width, height, close)
			if (seats[i][j] == "L" && count == 0) {
				newRow[j] = "#"
				anyChanges = true
			} else if (seats[i][j] == "#" && count >= number) {
				newRow[j] = "L"
				anyChanges = true
			} else {
				newRow[j] = seats[i][j]
			}
		}
		newSeats = append(newSeats, newRow)
	}
	return newSeats, anyChanges
}

func countAdjacentSeats(seats [][]string, row int, col int, width int, height int, close bool) int {
	count := 0
	const UP int = -1
	const DOWN int = 1
	const RIGHT int = 1
	const LEFT int = -1
	const NONE int = 0

	count += countInDirection(seats, row, col, width, height, UP, LEFT, close)
	count += countInDirection(seats, row, col, width, height, UP, NONE, close)
	count += countInDirection(seats, row, col, width, height, UP, RIGHT, close)
	count += countInDirection(seats, row, col, width, height, NONE, RIGHT, close)
	count += countInDirection(seats, row, col, width, height, DOWN, RIGHT, close)
	count += countInDirection(seats, row, col, width, height, DOWN, NONE, close)
	count += countInDirection(seats, row, col, width, height, DOWN, LEFT, close)
	count += countInDirection(seats, row, col, width, height, NONE, LEFT, close)

	return count
}

func countInDirection(seats [][]string, row int, col int, width int, height int, vert int, horiz int, close bool) int {
	if (row + vert >= 0) && (row + vert < height) && (col + horiz >= 0) && (col + horiz < width) {
		if seats[row+vert][col+horiz] == "#" {
			return 1
		} else if seats[row+vert][col+horiz] == "L" {
			return 0
		} else if !close {
			return countInDirection(seats, row+vert, col+horiz, width, height, vert, horiz, close)
		}
	}
	return 0
}

func countSeats(seats [][]string, width int, height int) int {
	count := 0

	for i := 0; i < width; i++ {
		for j := 0; j < height; j++ {
			if seats[i][j] == "#" {
				count++
			}
		}
	}

	return count
}

func parseInput(input []string) ([][]string, int, int) {
	plan := [][]string{}

	for _, line := range input {
		seats := strings.Split(line, "")
		plan = append(plan, seats)
	}

	return plan, len(plan), len(plan[0])
}

func printSeats(seats [][]string) {
	fmt.Println("")
	fmt.Println("")
	for _, row := range seats {
		fmt.Printf("%s\n", strings.Join(row[:], ""))
	}
}
