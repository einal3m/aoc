package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	fmt.Println("Puzzle16")
}

func Puzzle16a(input []string) int {
	validValues, _, _, nearbyTickets := parseInput(input)

	errorRate := 0
	for _, ticket := range nearbyTickets {
		for _, value := range ticket {
			if validValues[value] != true {
				errorRate += value
			}
		}
	}

	return errorRate
}

func Puzzle16b(input []string) int {
	validValues, validValuesByField, myTicket, nearbyTickets := parseInput(input)
	fieldCount := len(myTicket)

	validTickets := findValidTickets(nearbyTickets, validValues)
	validTickets = append(validTickets, myTicket)
	for fieldName, _ := range validValuesByField {
		for i := 0; i < fieldCount; i++ {
			validField := true
			for _, ticket := range validTickets {
				if validValuesByField[fieldName][ticket[i]] != true {
					validField = false
					break
				}
			}
			if validField {
				fmt.Printf("%s,%d\n", fieldName, i)
			}
		}
	}

	return 0
}

func findValidTickets(nearbyTickets [][]int, validValues map[int]bool) [][]int {
	validTickets := [][]int{}
	for _, ticket := range nearbyTickets {
		invalidTicket := false
		for _, value := range ticket {
			if validValues[value] != true {
				invalidTicket = true
				break
			}
		}
		if invalidTicket == false {
			validTickets = append(validTickets, ticket)
		}
	}
	return validTickets
}

func parseInput(input []string) (map[int]bool, map[string]map[int]bool, []int, [][]int)  {
	fieldsProcessed := false
	yourTicketProcessed := false
	myTickets := []int{}
	nearbyTickets := [][]int{}
	validValues := map[int]bool{}
	validValuesByField := map[string]map[int]bool{}

	for _, line := range input {
		if line == "your ticket:" || line == "nearby tickets:" {
			continue
		}

		if fieldsProcessed == false && line != "" {
			parseRange(line, validValues, validValuesByField)
		} else if fieldsProcessed == false && line == "" {
			fieldsProcessed = true
		} else if yourTicketProcessed == false && line != "" {
			myTickets = parseTickets(line)
		} else if yourTicketProcessed == false && line == "" {
			yourTicketProcessed = true
		} else {
			nearbyTickets = append(nearbyTickets, parseTickets(line))
		}
	}

	return validValues, validValuesByField, myTickets, nearbyTickets
}

func parseRange(line string, validValues map[int]bool, validValuesByField map[string]map[int]bool) {
	data := strings.Split(line, ": ")
	fieldRanges := strings.Split(data[1], " or ")
	validValuesByField[data[0]] = map[int]bool{}

	for _, fieldRange := range fieldRanges {
		digits := strings.Split(fieldRange, "-")
		start, _ := strconv.Atoi(digits[0])
		end, _ := strconv.Atoi(digits[1])

		for i := start; i <= end; i++ {
			validValues[i] = true
			validValuesByField[data[0]][i] = true
		}
	}
}

func parseTickets(line string) []int {
	tickets := strings.Split(line, ",")
	var result = []int{}
	for _, num := range tickets {
		j, _ := strconv.Atoi(num)
		result = append(result, j)
	}
	return result
}
