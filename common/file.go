package file

import (
	"io/ioutil"
	"strconv"
	"strings"
)

func ReadPuzzleInputInts(delimiter string) []int {
	content, _ := ioutil.ReadFile("input.txt")
	lines := strings.Split(string(content), delimiter)

	var puzzleInput = []int{}
	for _, value := range lines {
		intValue, _ := strconv.Atoi(value)
		puzzleInput = append(puzzleInput, intValue)
	}

	return puzzleInput
}

func ReadPuzzleInputStrings(delimiter string) []string {
	content, _ := ioutil.ReadFile("input.txt")
	lines := strings.Split(string(content), delimiter)

	return lines
}
