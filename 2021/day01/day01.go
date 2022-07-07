package year2020

func day01a(input []int) int {
	count := 0

	for i := 1; i < len(input); i++ {
		if input[i] > input[i-1] {
			count++
		}
	}

	return count
}

func day01b(input []int) int {
	count := 0

	for i := 1; i < len(input)-2; i++ {
		if (input[i] + input[i+1] + input[i+2]) > (input[i-1] + input[i] + input[i+1]) {
			count++
		}
	}

	return count
}
