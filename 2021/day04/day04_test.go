package year2020

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay04a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
			"",
			"22 13 17 11  0",
			"8  2 23  4 24",
			"21  9 14 16  7",
			"6 10  3 18  5",
			"1 12 20 15 19",
			"",
			"3 15  0  2 22",
			"9 18 13 17  5",
			"19  8  7 25 23",
			"20 11 10 24  4",
			"14 21 16 12  6",
			"",
			"14 21 17 24  4",
			"10 16 15  9 19",
			"18  8 23 26 20",
			"22 11 13  6  5",
			"2  0 12  3  7",
		}

		assert.Equal(t, 4512, day04a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 04a")
		t.Logf("%d", day04a(input))
		t.Logf("--------------------")
	})
}

func TestDay04b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
			"",
			"22 13 17 11  0",
			"8  2 23  4 24",
			"21  9 14 16  7",
			"6 10  3 18  5",
			"1 12 20 15 19",
			"",
			"3 15  0  2 22",
			"9 18 13 17  5",
			"19  8  7 25 23",
			"20 11 10 24  4",
			"14 21 16 12  6",
			"",
			"14 21 17 24  4",
			"10 16 15  9 19",
			"18  8 23 26 20",
			"22 11 13  6  5",
			"2  0 12  3  7",
		}
		assert.Equal(t, 1924, day04b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 04b")
		t.Logf("%d", day04b(input))
		t.Logf("--------------------")
	})
}
