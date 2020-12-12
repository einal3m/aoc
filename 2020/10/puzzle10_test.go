package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle10aTestInput1(t *testing.T) {
	input := []int{
		16,
		10,
		15,
		5,
		1,
		11,
		7,
		19,
		6,
		12,
		4,
	}
	helpers.ExpectResultInt(t, Puzzle10a(input), 35)
}

func TestPuzzle10aTestInput2(t *testing.T) {
	input := []int{
		28,
		33,
		18,
		42,
		31,
		14,
		46,
		20,
		48,
		47,
		24,
		23,
		49,
		45,
		19,
		38,
		39,
		11,
		1,
		32,
		25,
		35,
		8,
		17,
		7,
		9,
		4,
		2,
		34,
		10,
		3,
	}
	helpers.ExpectResultInt(t, Puzzle10a(input), 220)
}

func TestPuzzle10aRealInput(t *testing.T) {
	input := helpers.ReadFileInt("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 10a")
	t.Logf("%d", Puzzle10a(input))
	t.Logf("--------------------")
}

func TestPuzzle10bTestInput1(t *testing.T) {
	input := []int{
		16,
		10,
		15,
		5,
		1,
		11,
		7,
		19,
		6,
		12,
		4,
	}
	helpers.ExpectResultInt(t, Puzzle10b(input), 8)
}

func TestPuzzle10bTestInput2(t *testing.T) {
	input := []int{
		28,
		33,
		18,
		42,
		31,
		14,
		46,
		20,
		48,
		47,
		24,
		23,
		49,
		45,
		19,
		38,
		39,
		11,
		1,
		32,
		25,
		35,
		8,
		17,
		7,
		9,
		4,
		2,
		34,
		10,
		3,
	}
	helpers.ExpectResultInt(t, Puzzle10b(input), 19208)
}

func TestPuzzle10bRealInput(t *testing.T) {
	input := helpers.ReadFileInt("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 10b")
	t.Logf("%d", Puzzle10b(input))
	t.Logf("--------------------")
}
