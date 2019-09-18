/*Package space provides Age/2 function.*/
package space

import "fmt"

type Planet string

//Age returns someone's age given spent second and the planet of local Planet type.
func Age(seconds float64, planet Planet) (age float64) {
	age = seconds / orbitalPeriod(planet)
	return
}

//orbitalPeriod returns earth years given planet name.
func orbitalPeriod(planet Planet) (period float64) {
	switch planet {
	case "Earth":
		period = 31557600
	case "Mercury":
		period = 7600543.81992
	case "Venus":
		period = 19414149.052176
	case "Mars":
		period = 59354032.690079994
	case "Jupiter":
		period = 374355659.124
	case "Saturn":
		period = 929292362.8848
	case "Uranus":
		period = 2651370019.3296
	case "Neptune":
		period = 5200418560.032001
	default:
		panic(fmt.Sprintf("wrong planet: %s", planet))
	}
	return
}
