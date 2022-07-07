package array

import "math"

func Max(array []int) int {
	maxVal := -math.MaxInt

	for _, val := range array {
		if val > maxVal {
			maxVal = val
		}
	}

	return maxVal
}

func Min(array []int) int {
	minVal := math.MaxInt

	for _, val := range array {
		if val < minVal {
			minVal = val
		}
	}

	return minVal
}
