package year2021

import (
	"sort"
	"strings"
)

func day08a(input []string) int {
	entries := parseInput(input)
	count := 0

	for _, entry := range entries {
		for _, digit := range entry.output {
			if len(digit) == 2 || len(digit) == 4 || len(digit) == 3 || len(digit) == 7 {
				count++
			}
		}
	}

	return count
}

type Entry struct {
	digits []string
	output []string
}

func parseInput(input []string) []Entry {
	entries := []Entry{}

	for _, line := range input {
		parts := strings.Split(line, " | ")
		digits := strings.Fields(parts[0])
		code := strings.Fields(parts[1])

		entries = append(entries, Entry{digits: digits, output: code})
	}

	return entries
}

func day08b(input []string) int {
	entries := parseInput(input)

	sum := 0
	for _, entry := range entries {
		sum += decode(entry)
	}

	return sum
}

func decode(entry Entry) int {
	sortedDigits := sortDigits(entry.digits)

	one := sortedDigits[2][0]
	seven := sortedDigits[3][0]
	four := sortedDigits[4][0]
	eight := sortedDigits[7][0]
	three := includesAll(one, sortedDigits[5])
	nine := includesAll(four, sortedDigits[6])
	bb := diff(nine, three)[0]
	five := includes(bb, sortedDigits[5])
	two := diffArray(sortedDigits[5], []string{five, three})
	cc := diff(nine, five)[0]
	six := notIncludes(cc, sortedDigits[6])
	zero := diffArray(sortedDigits[6], []string{six, nine})

	vals := map[string]int{}
	vals[sortString(zero)] = 0
	vals[sortString(one)] = 1
	vals[sortString(two)] = 2
	vals[sortString(three)] = 3
	vals[sortString(four)] = 4
	vals[sortString(five)] = 5
	vals[sortString(six)] = 6
	vals[sortString(seven)] = 7
	vals[sortString(eight)] = 8
	vals[sortString(nine)] = 9

	code := entry.output
	return vals[sortString(code[0])]*1000 + vals[sortString(code[1])]*100 + vals[sortString(code[2])]*10 + vals[sortString(code[3])]
}

func sortDigits(digits []string) map[int][]string {
	sorted := map[int][]string{}

	for _, digit := range digits {
		sorted[len(digit)] = append(sorted[len(digit)], digit)
	}

	return sorted
}

func diff(large, small string) []rune {
	diffs := []rune{}

	for _, char := range large {
		if !strings.ContainsRune(small, char) {
			diffs = append(diffs, char)
		}
	}

	return diffs
}

func diffArray(large, small []string) string {
	for _, largeElement := range large {
		found := false
		for _, smallElement := range small {
			if smallElement == largeElement {
				found = true
			}
		}
		if !found {
			return largeElement
		}
	}
	return ""
}

func includesAll(digit string, set []string) string {
	for _, element := range set {
		count := 0
		for _, char := range digit {
			if strings.ContainsRune(element, char) {
				count++
			}
		}
		if count == len(digit) {
			return element
		}
	}
	return ""
}

func includes(char rune, set []string) string {
	for _, element := range set {
		if strings.ContainsRune(element, char) {
			return element
		}
	}
	return ""
}

func notIncludes(char rune, set []string) string {
	for _, element := range set {
		if !strings.ContainsRune(element, char) {
			return element
		}
	}
	return ""
}

func sortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}
