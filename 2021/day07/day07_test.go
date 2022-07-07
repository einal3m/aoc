package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay07a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := "16,1,2,0,4,2,7,1,2,14"
		assert.Equal(t, 37, day07a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 07a")
		t.Logf("%d", day07a(input[0]))
		t.Logf("--------------------")
	})
}

func TestDay07b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := "16,1,2,0,4,2,7,1,2,14"
		assert.Equal(t, 168, day07b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 07b")
		t.Logf("%d", day07b(input[0]))
		t.Logf("--------------------")
	})
}
