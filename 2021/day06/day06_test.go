package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay06a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := "3,4,3,1,2"
		assert.Equal(t, 26, day06(input, 18))
		assert.Equal(t, 5934, day06(input, 80))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 06a")
		t.Logf("%d", day06(input[0], 80))
		t.Logf("--------------------")
	})
}

func TestDay06b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := "3,4,3,1,2"
		assert.Equal(t, 26984457539, day06(input, 256))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 06b")
		t.Logf("%d", day06(input[0], 256))
		t.Logf("--------------------")
	})
}
