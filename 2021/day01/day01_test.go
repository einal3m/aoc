package year2020

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay01a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []int{199, 200, 208, 210, 200, 207, 240, 269, 260, 263}

		assert.Equal(t, 7, day01a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputInts("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 01a")
		t.Logf("%d", day01a(input))
		t.Logf("--------------------")

	})
}
func TestDay01b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []int{199, 200, 208, 210, 200, 207, 240, 269, 260, 263}

		assert.Equal(t, 5, day01b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputInts("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 01b")
		t.Logf("%d", day01b(input))
		t.Logf("--------------------")

	})
}
