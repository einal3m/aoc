package year2020

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay03a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{"00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"}

		assert.Equal(t, 198, day03a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 03a")
		t.Logf("%d", day03a(input))
		t.Logf("--------------------")
	})
}

func TestDay03b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{"00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"}

		assert.Equal(t, 230, day03b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 03b")
		t.Logf("%d", day03b(input))
		t.Logf("--------------------")
	})
}
