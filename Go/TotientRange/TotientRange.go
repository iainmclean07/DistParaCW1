// totientRange.go - Sequential Euler Totient Function (Go Version)
// compile: go build
// run:     totientRange lower_num upper_num

// Phil Trinder    30/8/2018

// This program calculates the sum of the totients between a lower and an
// upper limit
//
// Each function has an executable Haskell specification
//
// It is based on earlier work by: Greg Michaelson, Patrick Maier, Phil Trinder,
// Nathan Charles, Hans-Wolfgang Loidl and Colin Runciman

package main

import (
	"fmt"
	"os"
	"runtime"
	"strconv"
	"time"
)

// Compute the Highest Common Factor, hcf of two numbers x and y
//
// hcf x 0 = x
// hcf x y = hcf y (rem x y)

func hcf(x, y int64) int64 {
	var t int64
	for y != 0 {
		t = x % y
		x = y
		y = t
	}
	return x
}

// relprime determines whether two numbers x and y are relatively prime
//
// relprime x y = hcf x y == 1

func relprime(x, y int64) bool {
	return hcf(x, y) == 1
}

// euler(n) computes the Euler totient function, i.e. counts the number of
// positive integers up to n that are relatively prime to n
//
// euler n = length (filter (relprime n) [1 .. n-1])

func euler(n int64) int64 {
	var length, i int64

	length = 0
	for i = 1; i < n; i++ {
		if relprime(n, i) {
			length++
		}
	}
	return length
}

// sumTotient lower upper sums the Euler totient values for all numbers
// between "lower" and "upper".
//
// sumTotient lower upper = sum (map euler [lower, lower+1 .. upper])

func sumTotient(lower, upper int64, c chan int64) {
	var sum, i int64

	sum = 0
	for i = lower; i <= upper; i++ {
		sum = sum + euler(i)
	}
	c <- sum
}

func scheduling(lower, upper int64) int64 {

	var chunkSize, step, sum, i int64

	chunkSize = 32
	step = lower
	sum = 0

	c := make(chan int64)

	for step <= upper {
		if (step + chunkSize) > upper {
			go sumTotient(step, upper, c)
			i++
			break
		}
		go sumTotient(step, step+chunkSize, c)
		step = step + chunkSize + 1
		i++
	}

	for i != 0 {
		sum += <-c
		i--
	}

	return sum

}

func main() {
	var lower, upper int64
	var threads int
	var err error
	// Read and validate lower and upper arguments
	if len(os.Args) < 4 {
		panic(fmt.Sprintf("Usage: must provide lower and upper range limits and number of threads as arguments"))
	}

	if lower, err = strconv.ParseInt(os.Args[1], 10, 64); err != nil {
		panic(fmt.Sprintf("Can't parse first argument"))
	}
	if upper, err = strconv.ParseInt(os.Args[2], 10, 64); err != nil {
		panic(fmt.Sprintf("Can't parse second argument"))
	}
	if threads, err = strconv.Atoi(os.Args[3]); err != nil {
		panic(fmt.Sprintf("Can't parse third argument"))
	}

	runtime.GOMAXPROCS(threads)

	// Record start time
	start := time.Now()
	// Compute and output sum of totients
	fmt.Println("Sum of Totients between", lower, "and", upper, "is", scheduling(lower, upper))
	// Record the elapsed time
	t := time.Now()
	elapsed := t.Sub(start)
	fmt.Println("Elapsed time", elapsed)
}
