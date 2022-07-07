package year2021

import (
	"sort"
)

func day10a(input []string) int {
	score := 0
	for _, line := range input {
		stack := []rune{}
		for _, char := range line {
			if openingBracket(char) {
				stack = append(stack, char)
			} else {
				if closing(stack[len(stack)-1], char) {
					stack = stack[:len(stack)-1]
				} else {
					score += corruptBracketScore(char)
					break
				}
			}
		}
	}
	return score
}

func corruptBracketScore(char rune) int {
	scores := map[rune]int{')': 3, ']': 57, '}': 1197, '>': 25137}
	return scores[char]
}

func openingBracket(char rune) bool {
	return char == '{' || char == '[' || char == '<' || char == '('
}

func closing(start rune, end rune) bool {
	return start == '(' && end == ')' || start == '[' && end == ']' || start == '<' && end == '>' || start == '{' && end == '}'
}

func day10b(input []string) int {
	scores := []int{}
	for _, line := range input {
		stack := []rune{}
		corrupt := false
		for _, char := range line {
			if openingBracket(char) {
				stack = append(stack, char)
			} else {
				if closing(stack[len(stack)-1], char) {
					stack = stack[:len(stack)-1]
				} else {
					corrupt = true
					break
				}
			}
		}
		if !corrupt {
			scores = append(scores, incompleteBrackScore(stack))
		}
	}

	sort.Ints(scores)
	return scores[len(scores)/2]
}

func incompleteBrackScore(stack []rune) int {
	scores := map[rune]int{'(': 1, '[': 2, '{': 3, '<': 4}
	score := 0

	for i := len(stack) - 1; i >= 0; i-- {
		score = score*5 + scores[stack[i]]
	}

	return score
}
