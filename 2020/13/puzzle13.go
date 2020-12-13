package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	fmt.Println("Puzzle13")
}

func Puzzle13a(input []string) int {
	time, buses := parseInput(input)

	minDepartureTime := time * 2
	minBus := 0
	for _, bus := range buses {
		departureTime := (int(float64(time) / float64(bus.id)) + 1) * bus.id
		if departureTime < minDepartureTime {
			minDepartureTime = departureTime
			minBus = bus.id
		}
	}

	return (minDepartureTime - time) * minBus
}

func Puzzle13b(input []string) int {
	_, buses := parseInput(input)

	time := 0
	timeStep := 1
	busIndex := 0
	occurence1 := -1
	occurence2 := -1

	for true {
		sequenceFound := true

		for i, bus := range buses {
			if (time + bus.index) % bus.id != 0 {
				sequenceFound = false
				break
			} else {
				if busIndex == i && occurence1 != -1 {
					occurence2 = time
					timeStep = occurence2 - occurence1
					busIndex++
					occurence1 = -1
					occurence2 = -2
				} else if busIndex == i && occurence1 == -1 {
					occurence1 = time
				}
			}
		}

		if sequenceFound {
			break
		}

		time += timeStep
	}

	return time
}

type Bus struct {
	id int
	index int
}

func parseInput(input []string) (int, []Bus) {
	time, _ := strconv.Atoi(input[0])
	all_buses := strings.Split(string(input[1]), ",")

	buses := []Bus{}
	for i, bus := range all_buses {
		bus_time, err := strconv.Atoi(bus)

		if err == nil {
			buses = append(buses, Bus{bus_time, i})
		}
	}

	return time, buses
}
