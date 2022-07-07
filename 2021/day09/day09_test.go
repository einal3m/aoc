package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay09a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"2199943210",
			"3987894921",
			"9856789892",
			"8767896789",
			"9899965678",
		}
		assert.Equal(t, 15, day09a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 09a")
		t.Logf("%d", day09a(input))
		t.Logf("--------------------")
	})
}

func TestDay09b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"2199943210",
			"3987894921",
			"9856789892",
			"8767896789",
			"9899965678",
		}
		assert.Equal(t, 1134, day09b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 09b")
		t.Logf("%d", day09b(input))
		t.Logf("--------------------")
	})
}
