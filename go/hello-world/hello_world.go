//Package hello
package hello

import "fmt"

// testVersion identifies the version of the test program that you are
// writing your code to. If the test program changes in the future --
// after you have posted this code to the Exercism site -- nitpickers
// will see that your code can't necessarily be expected to pass the
// current test suite because it was written to an earlier test version.
const testVersion = 2

func HelloWorld(name string) {
	// Write some code here to pass the test suite.
	if name == "" {
		fmt.Printf("Hello, World!")
	} else {
		fmt.Printf("Hello, %v!", name)
	}
}
