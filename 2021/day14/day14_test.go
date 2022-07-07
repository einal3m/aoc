package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay14a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"NNCB",
			"",
			"CH -> B",
			"HH -> N",
			"CB -> H",
			"NH -> C",
			"HB -> C",
			"HC -> B",
			"HN -> C",
			"NN -> C",
			"BH -> H",
			"NC -> B",
			"NB -> B",
			"BN -> B",
			"BB -> N",
			"BC -> B",
			"CC -> N",
			"CN -> C",
		}
		assert.Equal(t, 1588, day14(input, 10))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 14a")
		t.Logf("%d", day14(input, 10))
		t.Logf("--------------------")
	})
}

func TestDay14b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"NNCB",
			"",
			"CH -> B",
			"HH -> N",
			"CB -> H",
			"NH -> C",
			"HB -> C",
			"HC -> B",
			"HN -> C",
			"NN -> C",
			"BH -> H",
			"NC -> B",
			"NB -> B",
			"BN -> B",
			"BB -> N",
			"BC -> B",
			"CC -> N",
			"CN -> C",
		}
		assert.Equal(t, 2188189693529, day14(input, 40))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 14b")
		t.Logf("%d", day14(input, 40))
		t.Logf("--------------------")
	})
}
