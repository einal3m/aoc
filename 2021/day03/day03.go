package year2020

import (
	"math"
	"strconv"
)

func day03a(input []string) int {
	count := len(input)
	ones := countOnes(input)
	gamma := 0
	epsilon := 0
	noOfBits := len(input[0])

	for bit, bitCount := range ones {
		if bitCount > count/2 {
			gamma += int(math.Pow(2, float64(noOfBits-bit-1)))
		} else {
			epsilon += int(math.Pow(2, float64(noOfBits-bit-1)))
		}
	}

	return gamma * epsilon
}

func countOnes(input []string) map[int]int {
	ones := map[int]int{}
	for i, _ := range input[0] {
		ones[i] = 0
	}

	for _, diagnostic := range input {
		for i, bit := range diagnostic {
			if bit == '1' {
				ones[i]++
			}
		}
	}
	return ones
}

func day03b(input []string) int {
	list := make([]string, len(input))
	bit := 0
	copy(list, input)
	var oxygenGeneratorRating string
	for {
		count := len(list)
		ones := countOnes(list)
		var newList []string
		if ones[bit]*2 >= count {
			newList = reduceList(list, bit, '1')
		} else {
			newList = reduceList(list, bit, '0')
		}
		if len(newList) == 1 {
			oxygenGeneratorRating = newList[0]
			break
		}

		list = newList
		bit++
	}

	list = make([]string, len(input))
	bit = 0
	copy(list, input)
	var C02ScrubberRating string
	for {
		count := len(list)
		ones := countOnes(list)
		var newList []string
		if ones[bit]*2 < count {
			newList = reduceList(list, bit, '1')
		} else {
			newList = reduceList(list, bit, '0')
		}
		if len(newList) == 1 {
			C02ScrubberRating = newList[0]
			break
		}

		list = newList
		bit++
	}

	one, _ := strconv.ParseInt(oxygenGeneratorRating, 2, 64)
	two, _ := strconv.ParseInt(C02ScrubberRating, 2, 64)

	return int(one) * int(two)
}

func reduceList(list []string, i int, oneOrZero uint8) []string {
	newList := []string{}

	for _, entry := range list {
		if entry[i] == oneOrZero {
			newList = append(newList, entry)
		}
	}

	return newList
}
