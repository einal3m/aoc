package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	fmt.Println("Puzzle14")
}

func Puzzle14a(input []string) int {
	instructions := parseInput(input)

	mem := map[int]int{}
	currentMask := instructions[0].mask
	for _, instruction := range instructions {
		switch instruction.cmd {
		case "mask" :
			currentMask = instruction.mask
		case "mem" :
			value := applyValueMask(currentMask, instruction.value)
			mem[instruction.address] = value
		}
	}

	return totalMemory(mem)
}

func Puzzle14b(input []string) int {
	instructions := parseInput(input)
	
	mem := map[int]int{}
	currentMask := instructions[0].mask
	for _, instruction := range instructions {
		switch instruction.cmd {
		case "mask" :
			currentMask = instruction.mask
		case "mem" :
			addresses := applyAddressMask(currentMask, instruction.address)
			for _, address := range addresses {
				mem[address] = instruction.value
			}
		}
	}

	return totalMemory(mem)
}

func setBit(n int, pos uint) int {
	n |= (1 << pos)
	return n
}

func clearBit(n int, pos uint) int {
	return n &^ (1 << pos)
}

func applyValueMask(mask map[int]string, value int) int {
	for i, bit := range mask {
		if bit == "1" {
			value = setBit(value, uint(i))
		} else if bit == "0" {
			value = clearBit(value, uint(i))
		}
	}
	return value
}

func applyAddressMask(mask map[int]string, address int) []int {
	addresses := []int{address}
	for i, bit := range mask {
		if bit == "1" || bit == "X" {
			newAddresses := []int{}
			for _, address := range addresses {
				newAddresses = append(newAddresses, setBit(address, uint(i)))
				if bit == "X" {
					newAddresses = append(newAddresses, clearBit(address, uint(i)))
				}
			}
			addresses = newAddresses
		}
	}
	return addresses
}

func totalMemory(mem map[int]int) int {
	totalMemory := 0
	for _, value := range mem {
		totalMemory += value
	}
	return totalMemory
}

type Instruction struct {
	cmd string
	mask map[int]string
	address int
	value int
}

func parseInput(input []string) []Instruction {
	instructions := []Instruction{}

	for _, line := range input {
		if line[:4] == "mask" {
			mask := line[6:]
			bitmask := map[int]string{}
			for i, bit := range strings.Split(mask, "") {
				bitmask[36-i] = bit
			}
			instructions = append(instructions, Instruction{
				cmd: "mask",
				mask: bitmask,
			})
		} else {
			one := strings.SplitAfter(line, "[")[1]
			address, _ := strconv.Atoi(strings.Split(one, "]")[0])
			value, _ := strconv.Atoi(strings.SplitAfter(line, "= ")[1])
			instructions = append(instructions, Instruction{
				cmd: "mem",
				address: address,
				value: value,
			})
		}
	}

	return instructions
}
