# Icosahedron puzzle
Assume a regular icosahedron (20 sided polyhedron with triangle faces).

Assume 5 colors, Pink, Green, Blue, Orange, Yellow, that are each to be used 5 times as colors to edges of the shape.

Given the shape and colors, is it to make each vertex contain exactly one of each color?

## Example Diagram (unsuccessful attempt)

Each number to the left is a vertex
Each set to its right are its neighbor vertices
P G B O Y are colors Pink, Green, Blue, Orange, Yellow
Each pairing describes an edge, or a connection between vertices

This manual guesswork fails because is made vertex eleven contain two Green points.

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
