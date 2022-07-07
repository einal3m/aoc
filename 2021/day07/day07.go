package year2021

import (
	"advent-of-code/common/array"
	"math"
	"strconv"
	"strings"
)

func day07a(input string) int {
	crabs := parseInput(input)
	maxCrab := array.Max(crabs)
	minCrab := array.Min(crabs)
	minCost := math.MaxInt

	for i := minCrab; i <= maxCrab; i++ {
		fuelCost := linearCost(crabs, i)
		if fuelCost < minCost {
			minCost = fuelCost
		}
	}

	return minCost
}

func parseInput(input string) []int {
	positions := []int{}
	for _, val := range strings.Split(input, ",") {
		pos, _ := strconv.Atoi(val)
		positions = append(positions, pos)
	}
	return positions
}

func linearCost(crabs []int, target int) int {
	fuel := 0
	for _, crabPos := range crabs {
		fuel += int(math.Abs(float64(target - crabPos)))
	}
	return fuel
}

func day07b(input string) int {
	crabs := parseInput(input)
	maxCrab := array.Max(crabs)
	minCrab := array.Min(crabs)
	minCost := math.MaxInt

	for i := minCrab; i <= maxCrab; i++ {
		fuelCost := nonLinearCost(crabs, i)
		if fuelCost < minCost {
			minCost = fuelCost
		}
	}

	return minCost
}

func nonLinearCost(crabs []int, target int) int {
	fuel := 0

	for _, crabPos := range crabs {
		diff := int(math.Abs(float64(target - crabPos)))
		fuel += ((1 + diff) * diff) / 2
	}

	return fuel
}
