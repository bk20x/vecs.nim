# vecs.nim
### (I am adding more math operations)
### This is really nothing special. Id say the best part is the use of tuples allowing automatic inference of generic params and destructuring like so:
```nim
import vecs

let v1 = (x: 5.0, y: 10.0)
assert v1 is Vector2[float]

let v2 = v1 * v1
let (x, y) = v2
```
