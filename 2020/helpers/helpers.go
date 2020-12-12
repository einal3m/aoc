package helpers

import (
	"io/ioutil"
	"strconv"
	"strings"
	"testing"
)

func Tester() string {
	return "this is a test"
}

func ReadFileInt(filename string) []int{
	content, _ := ioutil.ReadFile(filename)
	lines := strings.Split(string(content), "\n")

	var result = []int{}
	for _, i := range lines {
		j, _ := strconv.Atoi(i)
		result = append(result, j)
	}
	return result
}

func ReadFileString(filename string) []string{
	content, _ := ioutil.ReadFile(filename)
	return strings.Split(string(content), "\n")
}

func ExpectResultInt(t *testing.T, result int, expectedResult int) {
	if result != expectedResult {
		t.Fatalf(`Result: %d, expectedResult: %d`, result, expectedResult)
	}
}