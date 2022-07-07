package year2021

import (
	"strconv"
	"strings"
)

func day06(input string, noOfDays int) int {
	fish := parseInput(input)

	for i := 0; i < noOfDays; i++ {
		newFish := map[int]int{}

		for age, count := range fish {
			if age == 0 {
				newFish[6] += count
				newFish[8] += count
			} else {
				newFish[age-1] += count
			}
			fish = newFish
		}
	}

	totalFish := 0
	for _, count := range fish {
		totalFish += count
	}
	return totalFish
}

func parseInput(input string) map[int]int {
	fish := map[int]int{}
	for _, val := range strings.Split(input, ",") {
		age, _ := strconv.Atoi(val)
		fish[age]++
	}
	return fish
}
