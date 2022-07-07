package year2021

import (
	"math"
	"strings"
)

func day14(input []string, steps int) int {
	polymer, rules := parseInput(input)

	for i := 0; i < steps; i++ {
		newPolymer := map[Rule]int{}
		for rule, char := range rules {
			count := polymer[rule]
			newPolymer[Rule{rule.leftElement, char}] += count
			newPolymer[Rule{char, rule.rightElement}] += count
		}
		polymer = newPolymer
	}

	counts := map[rune]int{}
	for rule, count := range polymer {
		counts[rule.rightElement] += count
	}
	counts[rune(input[0][0])]++

	maxCount := 0
	minCount := math.MaxInt

	for _, val := range counts {
		if val > maxCount {
			maxCount = val
		} else if val < minCount {
			minCount = val
		}
	}

	return maxCount - minCount
}

type Rule struct {
	leftElement  rune
	rightElement rune
}

func parseInput(input []string) (map[Rule]int, map[Rule]rune) {
	polymer := map[Rule]int{}
	for i := 0; i < len(input[0])-1; i++ {
		pair := input[0][i : i+2]
		polymer[Rule{rune(pair[0]), rune(pair[1])}]++
	}

	rules := map[Rule]rune{}
	for i := 2; i < len(input); i++ {
		bits := strings.Split(input[i], " -> ")
		rules[Rule{rune(bits[0][0]), rune(bits[0][1])}] = rune(bits[1][0])
	}

	return polymer, rules
}
