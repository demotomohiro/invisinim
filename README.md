# invisinim

I tried to write Nim code only with white space characters.

## Requirements

- Nim 2.0
- Text editor that correctly display '　'.

## How to compile and run

```console
$ git clone https://github.com/demotomohiro/invisinim.git
$ cd invisinim
$ nim c -r mycode.nim
```

## Code that generated mycode.nim and 　　　　　　　　　　　　　.nim

Save following code to any .nim file and compile and run with `nim c -r foo.nim`.

```nim
import std/[strutils, strformat]

const ZS = "　"
var zsn = 0

proc genZSName(): string =
  inc zsn
  ZS.repeat(zsn)

let
  ZeroAry = genZSName()
  toString = genZSName()
  add0 = genZSName()
  echoStr = genZSName()

var modpart = &"""
const {ZeroAry}* = ['\0']

proc {toString}*(ary: openArray[char]): string = ary.substr

proc {add0}*[N: static int](ary: array[N, char]): array[N + 1, char] =
  for i in 0 ..< ary.len:
    result[i] = ary[i]

proc {echoStr}*(msg: string) =
  echo msg

"""

var addToLast: array[8, string]

for i in 0..7:
  addToLast[i] = genZSName()
  modpart.add &"""
proc {addToLast[i]}*[I](ary: array[I, char]): array[I, char] =
  result = ary
  result[^1] = char(result[^1].int + {1 shl i})

"""

let invisibleMod = genZSName()
writeFile invisibleMod & ".nim", modpart

proc charToBits(c: char): string =
  for i in 0 .. 7:
    if ((c.int shr i) and 1) == 1:
      result.add addToLast[i] & " "

var code = &"""
import {invisibleMod}

{echoStr} {toString} """

const cmd = "Nim is a statically typed compiled systems programming language. It combines successful concepts from mature languages like Python, Ada and Modula. You can write invisible code."

for i in countDown(cmd.high, 0):
  code.add charToBits(cmd[i]) & " "
  if i != 0:
    code.add &"{add0} "

code.add ZeroAry

writeFile "mycode.nim", code
```
