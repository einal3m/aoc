package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle11aTestInput(t *testing.T) {
	input := []string{
		"L.LL.LL.LL",
		"LLLLLLL.LL",
		"L.L.L..L..",
		"LLLL.LL.LL",
		"L.LL.LL.LL",
		"L.LLLLL.LL",
		"..L.L.....",
		"LLLLLLLLLL",
		"L.LLLLLL.L",
		"L.LLLLL.LL",
	}
	helpers.ExpectResultInt(t, Puzzle11a(input), 37)
}

func TestPuzzle11aRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 11a")
	t.Logf("%d", Puzzle11a(input))
	t.Logf("--------------------")
}

func TestPuzzle11bTestInput(t *testing.T) {
	input := []string{
		"L.LL.LL.LL",
		"LLLLLLL.LL",
		"L.L.L..L..",
		"LLLL.LL.LL",
		"L.LL.LL.LL",
		"L.LLLLL.LL",
		"..L.L.....",
		"LLLLLLLLLL",
		"L.LLLLLL.L",
		"L.LLLLL.LL",
	}
	helpers.ExpectResultInt(t, Puzzle11b(input), 26)
}

func TestPuzzle11bRealInput(t *testing.T) {
	input := helpers.ReadFileString("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 11b")
	t.Logf("%d", Puzzle11b(input))
	t.Logf("--------------------")
}
