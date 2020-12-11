package main

import (
    "fmt"
    "regexp"
    "strconv"
    "strings"
)

func main() {
    fmt.Println("Puzzle07")
}

func Puzzle07a(input []string) int {
    bags := loadBags(input)
    count := 0

    for bag, _ := range bags {
        found := containsShinyGoldBag(bag, bags)
        if found == true {
            count = count + 1
        }
    }

    return count
}

func Puzzle07b(input []string) int {
    bags := loadBags(input)
    numberOfBags := countBags("shiny gold", bags) - 1
    return numberOfBags
}

func countBags(current_bag string, bags map[string][]Bag) int {
    if len(bags[current_bag]) == 0 {
        return 1
    }

    count := 0
    for _, bag := range bags[current_bag] {
        bag_count := countBags(bag.colour, bags)
        count = count + bag.count * bag_count
    }

    return count + 1
}

func containsShinyGoldBag(current_bag string, bags map[string][]Bag) bool {
    for _, bag := range bags[current_bag] {
        if bag.colour == "shiny gold" {
            return true
        }
    }

    for _, bag := range bags[current_bag] {
        if containsShinyGoldBag(bag.colour, bags) == true {
            return true
        }
    }

    return false
}

type Bag struct {
    count int
    colour string
}

func loadBags(input []string) map[string][]Bag {
    result := make(map[string][]Bag)
    r, _ := regexp.Compile("\\d (\\w+ \\w+) bag")

    for _, line := range input {
        splits := strings.Split(string(line), " bags contain ")
        bag_colour := splits[0]
        contents := splits[1]
        bags := r.FindAllString(contents, -1)

        var content_colours = []Bag{}
        for _, bag := range bags {
            count, _ := strconv.Atoi(string(bag[0]))
            colour := bag[2:len(bag)-4]
            content_colours = append(content_colours, Bag{count, colour})
        }
        result[bag_colour] = content_colours
    }

    return result
}
