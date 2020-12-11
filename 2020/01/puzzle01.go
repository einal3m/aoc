package main

import (
    "fmt"
)

func main() {
    fmt.Println("Puzzle01")
}

func Puzzle01a(input []int) int {
    for i, num1 := range input {
        for j, num2 := range input {
            if j > i && num1 + num2 == 2020 {
                return num1 * num2
            }
        }
    }
    return 0
}

func Puzzle01b(input []int) int {
    for i, num1 := range input {
        for j, num2 := range input {
            for k, num3 := range input {
                if (j > i) && (k > j) && num1 + num2 + num3 == 2020 {
                    return num1 * num2 *num3
                }
            }
        }
    }
    return 0
}
