package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle14aTestInput(t *testing.T) {
	input := []string{
		"mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X",
		"mem[8] = 11",
		"mem[7] = 101",
		"mem[8] = 0",
	}
	helpers.ExpectResultInt(t, Puzzle14a(input), 165)
}

func TestPuzzle14aRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 14a")
	t.Logf("%d", Puzzle14a(input))
	t.Logf("--------------------")
}

func TestPuzzle14bTestInput(t *testing.T) {
	input2 := []string{
		"mask = 000000000000000000000000000000X1001X",
		"mem[42] = 100",
		"mask = 00000000000000000000000000000000X0XX",
		"mem[26] = 1",
	}
	helpers.ExpectResultInt(t, Puzzle14b(input2), 208)
}

func TestPuzzle14bRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 14b")
	t.Logf("%d", Puzzle14b(input))
	t.Logf("--------------------")
}
