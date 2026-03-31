{.warning[ImplicitDefaultValue]:off.}
from std/math import sqrt

type
  Vector2*[T: SomeNumber] = tuple
    x, y: T

  Vector3*[T: SomeNumber] = tuple
    x, y, z: T

  Vector4*[T: SomeNumber] = tuple
    x, y, z, w: T

  SomeVector*[T: SomeNumber] = Vector2[T] | Vector3[T] | Vector4[T]

# These are unnecessary bc tuple constructors will infer the type and be compatible with the generic procedures
func vec2*[T: SomeNumber](x, y = default(T)): Vector2[T] = 
  (x: x, y: y)

func vec3*[T: SomeNumber](x, y, z = default(T)): Vector3[T] = 
  (x: x, y: y)
  
func vec4*[T: SomeNumber](x, y, z, w = default(T)): Vector4[T] = 
  (x: x, y: y, z: z, w: w)


func `+`*[V: SomeVector](a, b: V): V =
  when V is Vector2:
    (x: a.x + b.x, y: a.y + b.y)
  elif V is Vector3:
    (x: a.x + b.x, y: a.y + b.y, z: a.z + b.z)
  else:
    (x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w)

func `-`*[V: SomeVector](a, b: V): V =
  when V is Vector2:
    (x: a.x - b.x, y: a.y - b.y)
  elif V is Vector3:
    (x: a.x - b.x, y: a.y - b.y, z: a.z - b.z)
  else:
    (x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w)

func `*`*[V: SomeVector](a, b: V): V =
  when V is Vector2:
    (x: a.x * b.x, y: a.y * b.y)
  elif V is Vector3:
    (x: a.x * b.x, y: a.y * b.y, z: a.z * b.z)
  else:
    (x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w)

func `/`*[V: SomeVector](a, b: V): V =
  when V is Vector2:
    (x: a.x / b.x, y: a.y / b.y)
  elif V is Vector3:
    (x: a.x / b.x, y: a.y / b.y, z: a.z / b.z)
  else:
    (x: a.x / b.x, y: a.y / b.y, z: a.z / b.z, w: a.w / b.w)


func dstSquared*[V: SomeVector](a, b: V): float64 = 
  for af, bf in fields(a, b):
    let dif = bf.float64 - af.float64
    result += dif * dif

func dst*[V: SomeVector](a, b: V): float64 = 
  sqrt a.dstSquared(b)

func negate*[V: SomeVector](vec: V): V =
  for rf, vf in fields(result, vec):
    rf = -vf    
