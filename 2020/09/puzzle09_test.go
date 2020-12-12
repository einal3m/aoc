package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle09aTestInput(t *testing.T) {
	input := []int{
		35,
		20,
		15,
		25,
		47,
		40,
		62,
		55,
		65,
		95,
		102,
		117,
		150,
		182,
		127,
		219,
		299,
		277,
		309,
		576,
	}
	helpers.ExpectResultInt(t, Puzzle09a(input, 5), 127)
}

func TestPuzzle09aRealInput(t *testing.T) {
	input := helpers.ReadFileInt("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 09a")
	t.Logf("%d", Puzzle09a(input, 25))
	t.Logf("--------------------")
}

func TestPuzzle09bTestInput(t *testing.T) {
	input := []int{
		35,
		20,
		15,
		25,
		47,
		40,
		62,
		55,
		65,
		95,
		102,
		117,
		150,
		182,
		127,
		219,
		299,
		277,
		309,
		576,
	}
	helpers.ExpectResultInt(t, Puzzle09b(input, 5), 62)
}

func TestPuzzle09bRealInput(t *testing.T) {
	input := helpers.ReadFileInt("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 09b")
	t.Logf("%d", Puzzle09b(input, 25))
	t.Logf("--------------------")
}
