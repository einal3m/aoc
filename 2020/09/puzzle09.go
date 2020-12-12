package main

import (
	"fmt"
)

func main() {
	fmt.Println("Puzzle09")
}

func Puzzle09a(input []int, spread int) int {
	for i, num := range input {
		if i < spread {
			continue
		}
		if (testNum(input, spread, i, num) == false) {
			return num
		}
	}
	return 0
}

func Puzzle09b(input []int, spread int) int {
	sum := Puzzle09a(input, spread)
	i_start, i_end := findGroup(input, sum)

	min := 999966189107160059
	max := 0
	for i:= i_start; i <= i_end; i++ {
		if input[i] > max {
			max = input[i]
		}

		if input[i] < min {
			min = input[i]
		}
	}

	return min + max
}

func testNum(input []int, spread int, index int, num int) bool {
	for i := index-spread; i < index; i++ {
		for j := index-(spread-1); j < index; j++ {
			if j > i && input[i] != input[j] && input[i] + input[j] == num {
				return true
			}
		}
	}
	return false
}

func findGroup(input []int, sum int) (int, int) {
	for i := 0; i < len(input); i++ {
		group_sum := 0
		for j := i; j < len(input); j++ {
			group_sum += input[j]
			if group_sum == sum {
				return i, j
			}
		}
	}
	return 0,0
}
