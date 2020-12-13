package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle13aTestInput(t *testing.T) {
	input := []string{
		"939",
		"7,13,x,x,59,x,31,19",
	}
	helpers.ExpectResultInt(t, Puzzle13a(input), 295)
}

func TestPuzzle13aRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 13a")
	t.Logf("%d", Puzzle13a(input))
	t.Logf("--------------------")
}

func TestPuzzle13bTestInput(t *testing.T) {
	input1 := []string{
		"939",
		"17,x,13,19",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input1), 3417)

	input2 := []string{
		"939",
		"67,7,59,61",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input2), 754018)

	input3 := []string{
		"939",
		"67,x,7,59,61",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input3), 779210)

	input4 := []string{
		"939",
		"67,7,x,59,61",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input4), 1261476)

	input5 := []string{
		"939",
		"1789,37,47,1889",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input5), 1202161486)

	input6 := []string{
		"939",
		"7,13,x,x,59,x,31,19",
	}
	helpers.ExpectResultInt(t, Puzzle13b(input6), 1068781)
}

func TestPuzzle13bRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 13b")
	t.Logf("%d", Puzzle13b(input))
	t.Logf("--------------------")
}
