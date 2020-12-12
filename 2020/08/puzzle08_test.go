package main

import (
	"io/ioutil"
	"strings"
	"testing"
)

func TestPuzzle08aTestInput(t *testing.T) {
	input := []string{
		"nop +0",
		"acc +1",
		"jmp +4",
		"acc +3",
		"jmp -3",
		"acc -99",
		"acc +1",
		"jmp -4",
		"acc +6",
	}

	expectResult(t, Puzzle08a(input), 5)
}

func TestPuzzle08aRealInput(t *testing.T) {
	input := readFile("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 08a")
	t.Logf("%d", Puzzle08a(input))
	t.Logf("--------------------")
}

func TestPuzzle08bTestInput(t *testing.T) {
	input := []string{
		"nop +0",
		"acc +1",
		"jmp +4",
		"acc +3",
		"jmp -3",
		"acc -99",
		"acc +1",
		"jmp -4",
		"acc +6",
	}

	expectResult(t, Puzzle08b(input), 8)
}

func TestPuzzle08bRealInput(t *testing.T) {
	input := readFile("input.txt")
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 08b")
	t.Logf("%d", Puzzle08b(input))
	t.Logf("--------------------")
}

func readFile(filename string) []string{
	content, _ := ioutil.ReadFile(filename)
	return strings.Split(string(content), "\n")
}

func expectResult(t *testing.T, result int, expectedResult int) {
	if result != expectedResult {
		t.Fatalf(`Result: %d, expectedResult: %d`, result, expectedResult)
	}
}