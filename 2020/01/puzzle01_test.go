package main

import (
    "io/ioutil"
    "strconv"
    "strings"
    "testing"
)

func TestPuzzle01aTestInput(t *testing.T) {
    input := []int{1721, 979, 366, 299, 675, 1456}
    result := Puzzle01a(input)
    if result != 514579 {
        t.Fatalf(`Result: %d != 514579`, result)
    }
}

func TestPuzzle01aRealInput(t *testing.T) {
    input := readFile("input.txt")
    t.Logf(	"")
    t.Logf( "--------------------")
    t.Logf( "Answer to Puzzle 01a")
    t.Logf( "%d", Puzzle01a(input))
    t.Logf( "--------------------")
}

func TestPuzzle01bTestInput(t *testing.T) {
    input := []int{1721, 979, 366, 299, 675, 1456}
    result := Puzzle01b(input)
    if result != 241861950 {
        t.Fatalf(`Result: %d != 241861950`, result)
    }
}

func TestPuzzle01bRealInput(t *testing.T) {
    input := readFile("input.txt")
    t.Logf(	"")
    t.Logf( "--------------------")
    t.Logf( "Answer to Puzzle 01b")
    t.Logf( "%d", Puzzle01b(input))
    t.Logf( "--------------------")
}

func readFile(filename string) []int{
    content, _ := ioutil.ReadFile(filename)
    lines := strings.Split(string(content), "\n")

    var result = []int{}
    for _, i := range lines {
        j, _ := strconv.Atoi(i)
        result = append(result, j)
    }
    return result
}
