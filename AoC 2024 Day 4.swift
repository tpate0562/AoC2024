//
//  main.swift
//  AoC 2024 Day 4
//
//  Created by Tejas Patel on 12/3/24.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 4/AoC 2024 Day 4/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content}catch{return nil}}
let fileContent = readInputFile(at: inputFilePath)
var theArray: [[Character]] = Array(repeating: Array(repeating: "0", count: 140), count: 140)
let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = Array(rowData) // Convert rowData (Substring) to [Character]
    for (j, value) in values.enumerated() {
        if i < 140 && j < 140 {
            theArray[i][j] = value
        }
    }
}
print(theArray)
var count = 0
func checkVertical() -> Void {
    for i in 0...139 {
        for j in 0...136{
            if theArray[i][j] == "X" {
                if theArray[i][j+1] == "M" {
                    if theArray[i][j+2] == "A" {
                        if theArray[i][j+3] == "S" {
                            count += 1
                        }
                    }
                }
            }
            if theArray[i][j] == "S" {
                if theArray[i][j+1] == "A" {
                    if theArray[i][j+2] == "M" {
                        if theArray[i][j+3] == "X" {
                            count += 1
                        }
                    }
                }
            }
        }
    }
}
func checkHorizontal() -> Void {
    for i in 0...136 {
        for j in 0...139{
            if theArray[i][j] == "X" {
                if theArray[i+1][j] == "M" {
                    if theArray[i+2][j] == "A" {
                        if theArray[i+3][j] == "S" {
                            count += 1
                        }
                    }
                }
            }
            if theArray[i][j] == "S" {
                if theArray[i+1][j] == "A" {
                    if theArray[i+2][j] == "M" {
                        if theArray[i+3][j] == "X" {
                            count += 1
                        }
                    }
                }
            }
        }
    }
}
func checkDiagonalLeft() -> Void {
    for i in 0...136{
        for j in 0...136{
            if theArray[i][j] == "X"{
                if theArray[i+1][j+1] == "M"{
                    if theArray[i+2][j+2] == "A"{
                        if theArray[i+3][j+3] == "S"{
                            count += 1
                        }
                    }
                }
            }
            if theArray[i][j] == "S"{
                if theArray[i+1][j+1] == "A"{
                    if theArray[i+2][j+2] == "M"{
                        if theArray[i+3][j+3] == "X"{
                            count += 1
                        }
                    }
                }
            }
        }
    }
}
func checkDiagonalRight() -> Void {
    for i in 3...139{
        for j in 0...136{
            if theArray[i][j] == "X"{
                if theArray[i-1][j+1] == "M"{
                    if theArray[i-2][j+2] == "A"{
                        if theArray[i-3][j+3] == "S"{
                            count += 1
                        }
                    }
                }
            }
            if theArray[i][j] == "S"{
                if theArray[i-1][j+1] == "A"{
                    if theArray[i-2][j+2] == "M"{
                        if theArray[i-3][j+3] == "X"{
                            count += 1
                        }
                    }
                }
            }
        }
    }
}
checkVertical()
checkHorizontal()
checkDiagonalLeft()
checkDiagonalRight()
print(count)
//Part 2
var count2 = 0
for i in 1...138{
    for j in 1...138{
        if theArray[i][j] == "A"{
            if (theArray[i-1][j-1] == "M" && theArray[i+1][j+1] == "S") || (theArray[i-1][j-1] == "S" && theArray[i+1][j+1] == "M") {
                if (theArray[i+1][j-1] == "M" && theArray[i-1][j+1] == "S") || (theArray[i+1][j-1] == "S" && theArray[i-1][j+1] == "M") {
                    count2 += 1
                }
            }
        }
    }
}
print(count2)
