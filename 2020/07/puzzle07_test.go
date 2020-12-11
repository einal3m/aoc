package main

import (
    "io/ioutil"
    "strings"
    "testing"
)

func TestPuzzle07aTestInput(t *testing.T) {
    input := []string{
        "light red bags contain 1 bright white bag, 2 muted yellow bags.",
        "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
        "bright white bags contain 1 shiny gold bag.",
        "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
        "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
        "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
        "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
        "faded blue bags contain no other bags.",
        "dotted black bags contain no other bags.",
    }

    expectResult(t, Puzzle07a(input), 4)
}

func TestPuzzle07aRealInput(t *testing.T) {
   input := readFile("input.txt")
   t.Logf("")
   t.Logf("--------------------")
   t.Logf("Answer to Puzzle 07a")
   t.Logf("%d", Puzzle07a(input))
   t.Logf("--------------------")
}

func TestPuzzle07bTestInput1(t *testing.T) {
    input := []string{
        "light red bags contain 1 bright white bag, 2 muted yellow bags.",
        "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
        "bright white bags contain 1 shiny gold bag.",
        "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
        "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
        "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
        "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
        "faded blue bags contain no other bags.",
        "dotted black bags contain no other bags.",
    }
    expectResult(t, Puzzle07b(input), 32)
}

func TestPuzzle07bTestInput2(t *testing.T) {
    input := []string{
        "shiny gold bags contain 2 dark red bags.",
        "dark red bags contain 2 dark orange bags.",
        "dark orange bags contain 2 dark yellow bags.",
        "dark yellow bags contain 2 dark green bags.",
        "dark green bags contain 2 dark blue bags.",
        "dark blue bags contain 2 dark violet bags.",
        "dark violet bags contain no other bags.",
    }
    expectResult(t, Puzzle07b(input), 126)
}

func TestPuzzle07bRealInput(t *testing.T) {
   input := readFile("input.txt")
   t.Logf("")
   t.Logf("--------------------")
   t.Logf("Answer to Puzzle 07b")
   t.Logf("%d", Puzzle07b(input))
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
