package year2021

import (
	"strings"
	"unicode"
)

func day12a(input []string) int {
	caves := parseInput(input)
	paths := pathsFrom("start", "start", caves)
	return len(paths)
}

func pathsFrom(currentLocation string, pathToHere string, caves map[string][]string) []string {
	nextPaths := []string{}
	for _, next := range caves[currentLocation] {
		beenHere := strings.Contains(pathToHere, next)
		isLower := next >= "a"
		atEnd := next == "end"
		atStart := next == "start"
		newPathToHere := pathToHere + "-" + next

		if atEnd {
			nextPaths = append(nextPaths, newPathToHere)
		} else if atStart {
			// do nothing
		} else if isLower && beenHere {
			// do nothing
		} else {
			nextPaths = append(nextPaths, pathsFrom(next, newPathToHere, caves)...)
		}
	}

	return nextPaths
}

func parseInput(input []string) map[string][]string {
	caves := map[string][]string{}

	// ab-HN
	for _, segment := range input {
		codes := strings.Split(segment, "-")
		caves[codes[0]] = append(caves[codes[0]], codes[1])
		caves[codes[1]] = append(caves[codes[1]], codes[0])
	}

	return caves
}

func day12b(input []string) int {
	caves := parseInput(input)
	paths := pathsFromPart2("start", "start", caves)
	return len(paths)
}

func pathsFromPart2(currentLocation string, pathToHere string, caves map[string][]string) []string {
	nextPaths := []string{}
	for _, next := range caves[currentLocation] {
		beenHere := strings.Contains(pathToHere, next)
		isLower := next >= "a"
		atEnd := next == "end"
		atStart := next == "start"
		newPathToHere := pathToHere + "-" + next

		if atEnd {
			nextPaths = append(nextPaths, newPathToHere)
		} else if atStart {
			// do nothing
		} else if isLower && beenHere {
			anyCount2 := false
			currentPaths := strings.Split(pathToHere, "-")
			for _, path := range currentPaths {
				if (strings.Count(pathToHere, path) == 2) && (unicode.IsLower(rune(path[0]))) {
					anyCount2 = true
					break
				}
			}

			if !anyCount2 {
				nextPaths = append(nextPaths, pathsFromPart2(next, newPathToHere, caves)...)
			}
		} else {
			nextPaths = append(nextPaths, pathsFromPart2(next, newPathToHere, caves)...)
		}
	}

	return nextPaths
}
