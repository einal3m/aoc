package main

import (
	"fmt"
	"strconv"
	"math"
)

func main() {
	fmt.Println("Puzzle12")
}

func Puzzle12a(input []string) int {
	instructions := parseInput(input)

	posX := 0
	posY := 0
	direction := 0 // East

	//  Action N means to move north by the given value.
	//	Action S means to move south by the given value.
	//	Action E means to move east by the given value.
	//	Action W means to move west by the given value.
	//	Action L means to turn left the given number of degrees.
	//	Action R means to turn right the given number of degrees.
	//	Action F means to move forward by the given value in the direction the ship is currently facing.
	for _, instruction := range instructions {
		switch instruction.action {
		case "N" :
			posY += instruction.value
		case "S" :
			posY -= instruction.value
		case "E" :
			posX += instruction.value
		case "W" :
			posX -= instruction.value
		case "L" :
			direction = (direction + instruction.value) % 360
		case "R" :
			direction = (direction - instruction.value + 360) % 360
		case "F" :
			switch direction {
			case 0 :
				posX += instruction.value //East
			case 90 :
				posY += instruction.value //North
			case 180 :
				posX -= instruction.value //West
			case 270 :
				posY -= instruction.value //South
			}
		}
	}

	return int(math.Abs(float64(posY)) + math.Abs(float64(posX)))
}

func Puzzle12b(input []string) int {
	instructions := parseInput(input)

	posX := 0
	posY := 0
	wayX := 10
	wayY := 1

	// Action N means to move the waypoint north by the given value.
	// Action S means to move the waypoint south by the given value.
	// Action E means to move the waypoint east by the given value.
	// Action W means to move the waypoint west by the given value.
	// Action L means to rotate the waypoint around the ship left (counter-clockwise) the given number of degrees.
	// Action R means to rotate the waypoint around the ship right (clockwise) the given number of degrees.
	// Action F means to move forward to the waypoint a number of times equal to the given value.
	for _, instruction := range instructions {
		switch instruction.action {
		case "N" :
			wayY += instruction.value
		case "S" :
			wayY -= instruction.value
		case "E" :
			wayX += instruction.value
		case "W" :
			wayX -= instruction.value
		case "L" :
			switch instruction.value % 360 {
			case 90 :
				newWayX := - wayY
				wayY = wayX
				wayX = newWayX
			case 180 :
				wayY = - wayY
				wayX = - wayX
			case 270 :
				newWayX := wayY
				wayY = - wayX
				wayX = newWayX
			}
		case "R" :
			switch instruction.value % 360 {
			case 90 :
				newWayX := wayY
				wayY = - wayX
				wayX = newWayX
			case 180 :
				wayY = - wayY
				wayX = - wayX
			case 270 :
				newWayX := - wayY
				wayY = wayX
				wayX = newWayX
			}
		case "F" :
			for i := 0; i < instruction.value; i++ {
				posX += wayX
				posY += wayY
			}
		}
	}

	return int(math.Abs(float64(posY)) + math.Abs(float64(posX)))
}

type Instruction struct {
	action string
	value int
}

func parseInput(input []string) []Instruction {
	instructions := []Instruction{}

	for _, line := range input {
		action := string(line[0])
		value, _ := strconv.Atoi(line[1:])

		instructions = append(instructions, Instruction{action, value})
	}

	return instructions
}
