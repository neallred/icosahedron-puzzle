# Icosahedron puzzle
Assume a regular icosahedron (20 sided polyhedron with triangle faces).

Assume 5 colors, Pink, Green, Blue, Orange, Yellow, that are each to be used 5 times as colors to edges of the shape.

Given the shape and colors, is it to make each vertex contain exactly one of each color?

## Example Diagram (unsuccessful attempt)

Each number to the left is a vertex
Each set to its right are its neighbor vertices
P G B O Y are colors Pink, Green, Blue, Orange, Yellow
Each pairing describes an edge, or a connection between vertices

This manual guesswork fails because it makes vertex eleven contain two Green points.

```
         P  G  B  O  Y
   01 { 02 03 04 05 06 }

         P  B  O  Y  G
   02 { 01 03 06 07 11 }

         G  B  O  P  Y
   03 { 01 02 04 07 08 }

         B  O  Y  P  G
   04 { 01 03 05 08 09 }

         O  Y  P  B  G
   05 { 01 04 06 09 10 }

         Y  O  P  B  G
   06 { 01 02 05 10 11 }

         Y  P
   07 { 02 03 08 11 12 }

         Y  P
   08 { 03 04 07 09 12 }

         G  B
   09 { 04 05 08 10 12 }

         G  B
   10 { 05 06 09 11 12 }

         G  G
   11 { 02 06 07 10 12 }


   12 { 07 08 09 10 11 }
```


## Purpose

This repo tries to "brute force" solve the puzzle.
It uses Elm as the implementation language.

## Example manual guesses

### After Blue
B 
taken
V_01
V_02
V_03
V_04
V_05
V_06
V_07
V_08
V_09
V_10
V_11
V_12
need


```
    [ EV_01 V_01 V_02 B
    , EV_02 V_01 V_03
    , EV_03 V_01 V_04
    , EV_04 V_01 V_05
    , EV_05 V_01 V_06
    , EV_06 V_02 V_03
    , EV_07 V_02 V_06
    , EV_08 V_02 V_07
    , EV_09 V_02 V_11
    , EV_10 V_03 V_04 B
    , EV_11 V_03 V_07
    , EV_12 V_03 V_08
    , EV_13 V_04 V_05
    , EV_14 V_04 V_08
    , EV_15 V_04 V_09
    , EV_16 V_05 V_06 B
    , EV_17 V_05 V_09
    , EV_18 V_05 V_10
    , EV_19 V_06 V_10
    , EV_20 V_06 V_11
    , EV_21 V_07 V_08 B
    , EV_22 V_07 V_11
    , EV_23 V_07 V_12
    , EV_24 V_08 V_09
    , EV_25 V_08 V_12
    , EV_26 V_09 V_10 B
    , EV_27 V_09 V_12
    , EV_28 V_10 V_11
    , EV_29 V_10 V_12
    , EV_30 V_11 V_12 B
    ]
```

### After Blue, Yellow
Y 
taken
V_01
V_03
V_02
V_06
V_04
V_05
V_10
V_12
V_08
V_09
V_07
V_11
need


```
    [ EV_01 V_01 V_02 B
    , EV_02 V_01 V_03 Y
    , EV_03 V_01 V_04
    , EV_04 V_01 V_05
    , EV_05 V_01 V_06
    , EV_06 V_02 V_03
    , EV_07 V_02 V_06 Y
    , EV_08 V_02 V_07
    , EV_09 V_02 V_11
    , EV_10 V_03 V_04 B
    , EV_11 V_03 V_07
    , EV_12 V_03 V_08
    , EV_13 V_04 V_05 Y
    , EV_14 V_04 V_08
    , EV_15 V_04 V_09
    , EV_16 V_05 V_06 B
    , EV_17 V_05 V_09
    , EV_18 V_05 V_10
    , EV_19 V_06 V_10
    , EV_20 V_06 V_11
    , EV_21 V_07 V_08 B
    , EV_22 V_07 V_11 Y
    , EV_23 V_07 V_12
    , EV_24 V_08 V_09 Y
    , EV_25 V_08 V_12
    , EV_26 V_09 V_10 B
    , EV_27 V_09 V_12
    , EV_28 V_10 V_11
    , EV_29 V_10 V_12 Y
    , EV_30 V_11 V_12 B
    ]
```

### After Blue, Yellow
O 
taken
V_01
V_02
V_03
V_04
V_05
V_09
need

V_10
V_11

V_06
V_07
V_08
V_12
cant
06 10


```
    [ EV_01 V_01 V_02 B
    , EV_02 V_01 V_03 Y
    , EV_03 V_01 V_04 O
    , EV_04 V_01 V_05
    , EV_05 V_01 V_06
    , EV_06 V_02 V_03 O
    , EV_07 V_02 V_06 Y
    , EV_08 V_02 V_07
    , EV_09 V_02 V_11
    , EV_10 V_03 V_04 B
    , EV_11 V_03 V_07
    , EV_12 V_03 V_08
    , EV_13 V_04 V_05 Y
    , EV_14 V_04 V_08
    , EV_15 V_04 V_09
    , EV_16 V_05 V_06 B
    , EV_17 V_05 V_09 O
    , EV_18 V_05 V_10
    , EV_19 V_06 V_10
    , EV_20 V_06 V_11
    , EV_21 V_07 V_08 B
    , EV_22 V_07 V_11 Y
    , EV_23 V_07 V_12
    , EV_24 V_08 V_09 Y
    , EV_25 V_08 V_12
    , EV_26 V_09 V_10 B
    , EV_27 V_09 V_12
    , EV_28 V_10 V_11
    , EV_29 V_10 V_12 Y
    , EV_30 V_11 V_12 B
    ]
```
