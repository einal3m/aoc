package year2021

import (
	file "advent-of-code/common"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestDay12a(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"start-A",
			"start-b",
			"A-c",
			"A-b",
			"b-d",
			"A-end",
			"b-end",
		}
		assert.Equal(t, 10, day12a(input))

		input = []string{
			"dc-end",
			"HN-start",
			"start-kj",
			"dc-start",
			"dc-HN",
			"LN-dc",
			"HN-end",
			"kj-sa",
			"kj-HN",
			"kj-dc",
		}
		assert.Equal(t, 19, day12a(input))

		input = []string{
			"fs-end",
			"he-DX",
			"fs-he",
			"start-DX",
			"pj-DX",
			"end-zg",
			"zg-sl",
			"zg-pj",
			"pj-he",
			"RW-he",
			"fs-DX",
			"pj-RW",
			"zg-RW",
			"start-pj",
			"he-WI",
			"zg-he",
			"pj-fs",
			"start-RW",
		}
		assert.Equal(t, 226, day12a(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 12a")
		t.Logf("%d", day12a(input))
		t.Logf("--------------------")
	})
}

func TestDay12b(t *testing.T) {
	t.Run("TestInput", func(t *testing.T) {
		input := []string{
			"start-A",
			"start-b",
			"A-c",
			"A-b",
			"b-d",
			"A-end",
			"b-end",
		}
		assert.Equal(t, 36, day12b(input))

		input = []string{
			"dc-end",
			"HN-start",
			"start-kj",
			"dc-start",
			"dc-HN",
			"LN-dc",
			"HN-end",
			"kj-sa",
			"kj-HN",
			"kj-dc",
		}
		assert.Equal(t, 103, day12b(input))

		input = []string{
			"fs-end",
			"he-DX",
			"fs-he",
			"start-DX",
			"pj-DX",
			"end-zg",
			"zg-sl",
			"zg-pj",
			"pj-he",
			"RW-he",
			"fs-DX",
			"pj-RW",
			"zg-RW",
			"start-pj",
			"he-WI",
			"zg-he",
			"pj-fs",
			"start-RW",
		}
		assert.Equal(t, 3509, day12b(input))
	})

	t.Run("RealInput", func(t *testing.T) {
		input := file.ReadPuzzleInputStrings("\n")
		t.Logf("")
		t.Logf("--------------------")
		t.Logf("Answer to Puzzle 12b")
		t.Logf("%d", day12b(input))
		t.Logf("--------------------")
	})
}
