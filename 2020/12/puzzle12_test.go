package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle12aTestInput(t *testing.T) {
	input := []string{
		"F10",
		"N3",
		"F7",
		"R90",
		"F11",
	}
	helpers.ExpectResultInt(t, Puzzle12a(input), 25)
}

func TestPuzzle12aRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 12a")
	t.Logf("%d", Puzzle12a(input))
	t.Logf("--------------------")
}

func TestPuzzle12bTestInput(t *testing.T) {
	input := []string{
		"F10",
		"N3",
		"F7",
		"R90",
		"F11",
	}
	helpers.ExpectResultInt(t, Puzzle12b(input), 286)
}

func TestPuzzle12bRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 12b")
	t.Logf("%d", Puzzle12b(input))
	t.Logf("--------------------")
}
