/*Package twofer provides ShareWith/1 method.*/
package twofer

import "fmt"

//ShareWith  returns customised sharing sentence based on paramemtes.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
