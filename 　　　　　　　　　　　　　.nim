const 　* = ['\0']

proc 　　*(ary: openArray[char]): string = ary.substr

proc 　　　*[N: static int](ary: array[N, char]): array[N + 1, char] =
  for i in 0 ..< ary.len:
    result[i] = ary[i]

proc 　　　　*(msg: string) =
  echo msg

proc 　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 1)

proc 　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 2)

proc 　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 4)

proc 　　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 8)

proc 　　　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 16)

proc 　　　　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 32)

proc 　　　　　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 64)

proc 　　　　　　　　　　　　*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + 128)

