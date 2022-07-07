package year2020

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay02a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{"forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"}

		assert.Equal(t, 150, day02a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 02a")
		t.Logf("%d", day02a(input))
		t.Logf("--------------------")
	})
}
func TestDay02b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{"forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"}

		assert.Equal(t, 900, day02b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 02b")
		t.Logf("%d", day02b(input))
		t.Logf("--------------------")
	})
}
