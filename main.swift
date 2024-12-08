//
//  main.swift
//  AoC 2024 Day 7
//
//  Created by Tejas Patel on 12/6/24.
//

import Foundation

let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 7/AoC 2024 Day 7/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 13, rows = 850, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = rowData.split(separator: " ").compactMap { Int($0) }
    for (j, value) in values.enumerated() {
        if i < rows && j < cols {array[i][j] = value}
}}
for (i, _) in array.enumerated() {
    for (j, value) in array[i].enumerated().reversed() {
        if value == 0 {
            array[i].remove(at: j)
}}}
var numCombinations = 62
var binaryString = String(numCombinations, radix: 2)
let operationOrder = Array(binaryString.split(separator: ""))
for i in 0...849 {
    let exponent = array[i].count - 2
    let numIterations = Int(pow(3.0, Double(exponent)))
    rowLoop: for j in 0...numIterations {
        var currentCount = array[i][1]
        var binaryString = String(j, radix: 3)
        while binaryString.count < exponent {
            binaryString = "0" + binaryString
        }
        let operationOrder = Array(binaryString.split(separator: ""))
        for k in 2...array[i].count - 1{
            if operationOrder[k-2] == "0" {currentCount += array[i][k]}
            if operationOrder[k-2] == "1" {currentCount *= array[i][k]}
            if operationOrder[k-2] == "2" {currentCount = Int(String(currentCount) + String(array[i][k]))!}
        }
        if currentCount == array[i][0] {
            count += currentCount
            break rowLoop
}}}
print("Part 2:", count)
