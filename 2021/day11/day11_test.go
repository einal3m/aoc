package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay11a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"5483143223",
			"2745854711",
			"5264556173",
			"6141336146",
			"6357385478",
			"4167524645",
			"2176841721",
			"6882881134",
			"4846848554",
			"5283751526",
		}
		assert.Equal(t, 1656, day11a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 11a")
		t.Logf("%d", day11a(input))
		t.Logf("--------------------")
	})
}

func TestDay11b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"5483143223",
			"2745854711",
			"5264556173",
			"6141336146",
			"6357385478",
			"4167524645",
			"2176841721",
			"6882881134",
			"4846848554",
			"5283751526",
		}
		assert.Equal(t, 195, day11b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 11b")
		t.Logf("%d", day11b(input))
		t.Logf("--------------------")
	})
}
