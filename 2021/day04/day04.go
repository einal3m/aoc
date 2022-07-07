package year2020

import (
	"strconv"
	"strings"
)

func day04a(input []string) int {
	numbers, boards := parseInput(input)
	winningNumber, winningBoard := playBingo(numbers, boards)

	return score(winningNumber, winningBoard)
}

func score(winningNumber string, winningBoard Board) int {
	value, _ := strconv.Atoi(winningNumber)
	sum := 0

	for _, tile := range winningBoard.Grid {
		if !tile.marked {
			tileValue, _ := strconv.Atoi(tile.value)
			sum += tileValue
		}
	}

	return value * sum
}

func playBingo(numbers []string, boards []Board) (string, Board) {
	for _, number := range numbers {
		for _, board := range boards {
			bingo := board.mark(number)
			if bingo {
				return number, board
			}
		}
	}
	return "", Board{}
}

func playLosingBingo(numbers []string, boards []Board) (string, Board) {
	losingList := make([]Board, len(boards))
	copy(losingList, boards)

	for _, number := range numbers {
		newLosingList := []Board{}
		for _, board := range losingList {
			bingo := board.mark(number)
			if !bingo {
				newLosingList = append(newLosingList, board)
			}
		}
		if len(newLosingList) == 0 {
			return number, losingList[0]
		}
		losingList = newLosingList
	}
	return "", Board{}
}

type Board struct {
	Grid map[string]Tile
}

type Tile struct {
	x      int
	y      int
	value  string
	marked bool
}

func (b *Board) mark(number string) bool {
	tile, ok := b.Grid[number]
	if ok {
		tile.mark()
		b.Grid[number] = tile
	} else {
		return false
	}

	return b.bingo(tile)
}

func (b *Board) bingo(markedTile Tile) bool {
	countX := 0
	countY := 0
	for _, tile := range b.Grid {
		if tile.marked && (tile.x == markedTile.x) {
			countX++
		}
		if tile.marked && (tile.y == markedTile.y) {
			countY++
		}
	}
	if (countX == 5) || (countY == 5) {
		return true
	}
	return false
}

func (t *Tile) mark() {
	t.marked = true
}

func parseInput(input []string) ([]string, []Board) {
	numbers := strings.Split(input[0], ",")
	boards := []Board{}

	for i := 2; i < len(input); i += 6 {
		grid := map[string]Tile{}
		for y := 0; y < 5; y++ {
			values := strings.Fields(input[i+y])
			for x, value := range values {
				grid[value] = Tile{x: x, y: y, value: value, marked: false}
			}
		}
		boards = append(boards, Board{Grid: grid})
	}
	return numbers, boards
}

func day04b(input []string) int {
	numbers, boards := parseInput(input)
	losingNumber, losingBoard := playLosingBingo(numbers, boards)

	return score(losingNumber, losingBoard)
}
