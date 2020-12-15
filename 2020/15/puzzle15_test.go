package main

import (
	"testing"

	"einalem/helpers"
)

func TestPuzzle15aTestInput(t *testing.T) {
	helpers.ExpectResultInt(t, Puzzle15a([]int{0,3,6}, 2020), 436)
	helpers.ExpectResultInt(t, Puzzle15a([]int{1,3,2}, 2020), 1)
	helpers.ExpectResultInt(t, Puzzle15a([]int{2,1,3}, 2020), 10)
	helpers.ExpectResultInt(t, Puzzle15a([]int{1,2,3}, 2020), 27)
	helpers.ExpectResultInt(t, Puzzle15a([]int{2,3,1}, 2020), 78)
	helpers.ExpectResultInt(t, Puzzle15a([]int{3,2,1}, 2020), 438)
	helpers.ExpectResultInt(t, Puzzle15a([]int{3,1,2}, 2020), 1836)
}

func TestPuzzle15aRealInput(t *testing.T) {
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 15a")
	t.Logf("%d", Puzzle15a([]int{16,12,1,0,15,7,11}, 2020))
	t.Logf("--------------------")
}

func TestPuzzle15bTestInput(t *testing.T) {
	helpers.ExpectResultInt(t, Puzzle15a([]int{0,3,6}, 30000000), 175594)
	helpers.ExpectResultInt(t, Puzzle15a([]int{1,3,2}, 30000000), 2578)
	helpers.ExpectResultInt(t, Puzzle15a([]int{2,1,3}, 30000000), 3544142)
	helpers.ExpectResultInt(t, Puzzle15a([]int{1,2,3}, 30000000), 261214)
	helpers.ExpectResultInt(t, Puzzle15a([]int{2,3,1}, 30000000), 6895259)
	helpers.ExpectResultInt(t, Puzzle15a([]int{3,2,1}, 30000000), 18)
	helpers.ExpectResultInt(t, Puzzle15a([]int{3,1,2}, 30000000), 362)
}

func TestPuzzle15bRealInput(t *testing.T) {
	t.Logf("")
	t.Logf("--------------------")
	t.Logf("Answer to Puzzle 15b")
	t.Logf("%d", Puzzle15a([]int{16,12,1,0,15,7,11}, 30000000))
	t.Logf("--------------------")
}
