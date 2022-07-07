package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay13a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"6,10",
			"0,14",
			"9,10",
			"0,3",
			"10,4",
			"4,11",
			"6,0",
			"6,12",
			"4,1",
			"0,13",
			"10,12",
			"3,4",
			"3,0",
			"8,4",
			"1,10",
			"2,14",
			"8,10",
			"9,0",
			"",
			"fold along y=7",
			"fold along x=5",
		}
		assert.Equal(t, 17, day13a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 13a")
		t.Logf("%d", day13a(input))
		t.Logf("--------------------")
	})
}

func TestDay13b(t *testing.T) {
	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 13b")
		day13b(input)
		t.Logf("--------------------")
	})
}
