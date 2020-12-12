package main

import (
	"fmt"
	"sort"
)

func main() {
	fmt.Println("Puzzle10")
}

func Puzzle10a(input []int) int {
	sort.Ints(input)

	diffs_1 := 0
	diffs_3 := 0

	if input[0] == 1 {
		diffs_1++
	}
	if input[0] == 3 {
		diffs_3++
	}

	for i := 0; i < len(input) -1; i++ {
		diff := input[i+1] - input[i]
		if diff == 1 {
			diffs_1++
		}
		if diff == 3 {
			diffs_3++
		}
	}
	return diffs_1 * (diffs_3 + 1)
}

func Puzzle10b(input []int) int {
	sort.Ints(input)
	input = append([]int{0}, input...)
	sums := make(map[int]int)

	for i := len(input)-1; i >= 0; i-- {
		if i == len(input)-1 {
			sums[input[i]] = 1
		} else {
			for j := i + 1; j < len(input); j++ {
				if (input[j] - input[i] <= 3) {
					sums[input[i]] += sums[input[j]]
				}
			}
		}
	}

	return sums[0]
}
