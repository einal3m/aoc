package main

import (
	"fmt"
)

func main() {
	fmt.Println("Puzzle15")
}

func Puzzle15a(input []int, limit int) int {
	ages := map[int][]int{}

	lastNum := 0
	lastNumNew := true
	for i := 1; i <= limit; i++ {
		if i <= len(input) {
			ages[input[i-1]] = []int{-1, i}
			lastNum = input[i-1]
			lastNumNew = true
		} else if lastNumNew {
			if spokenAt, ok := ages[0]; ok {
				ages[0] = []int{spokenAt[1], i}
				lastNumNew = false
			} else {
				ages[0] = []int{-1, i}
				lastNumNew = true
			}
			lastNum = 0
		} else {
			newNum := ages[lastNum][1] - ages[lastNum][0]
			if spokenAt, ok := ages[newNum]; ok {
				ages[newNum] = []int{spokenAt[1], i}
				lastNumNew = false
			} else {
				ages[newNum] = []int{-1, i}
				lastNumNew = true
			}
			lastNum = newNum
		}
	}

	return lastNum
}
