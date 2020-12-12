package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	fmt.Println("Puzzle08")
}

func Puzzle08a(input []string) int {
	instructions := loadProgram(input)
	_, acc := runProgram(instructions)
	return acc
}

func Puzzle08b(input []string) int {
	instructions := loadProgram(input)

	for i, instruction := range instructions {
		switch(instruction.cmd){
		case "acc" :
			break
		case "jmp" :
			instructions[i] = switchInstruction(instruction)
		case "nop" :
			instructions[i] = switchInstruction(instruction)
		}

		infinite, acc := runProgram(instructions)
		if infinite == false {
			return acc
		}

		instructions[i] = instruction
		instructions = resetInstructions(instructions)
	}

	return 0
}

type Instruction struct {
	cmd string
	amt int
	run bool
}

func runProgram(instructions []Instruction) (bool, int) {
	i := 0
	acc := 0
	infinite := false
	for true  {
		instruction := instructions[i]
		if instruction.run == true {
			infinite = true
			break;
		}
		instructions[i] = runInstruction(instruction, true)

		switch(instruction.cmd){
		case "acc" :
			acc = acc + instruction.amt
			i = i + 1
		case "jmp" :
			i = i + instruction.amt
		case "nop" :
			i = i + 1
		}

		if i == len(instructions) {
			break;
		}
	}

	return infinite, acc
}

func runInstruction(instruction Instruction, run bool) Instruction {
	return Instruction{instruction.cmd, instruction.amt, run}
}

func switchInstruction(instruction Instruction) Instruction {
	if instruction.cmd == "jmp" {
		return Instruction{"nop", instruction.amt, instruction.run}
	}
	return Instruction{"jmp", instruction.amt, instruction.run}
}

func resetInstructions(instructions []Instruction) []Instruction {
	for i, instruction := range instructions {
		instructions[i] =runInstruction(instruction, false)
	}
	return instructions
}

func loadProgram(input []string) []Instruction {
	instructions := []Instruction{}
	for _, instruction := range input {
		data := strings.Split(string(instruction), " ")
		j, _ := strconv.Atoi(data[1])
		instructions = append(instructions, Instruction{data[0], j, false})
	}
	return instructions
}