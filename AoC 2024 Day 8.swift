//
//  main.swift
//  AoC 2024 Day 8
//
//  Created by Tejas Patel on 12/7/24.
//


import Foundation
let numsize = 50
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 8/AoC 2024 Day 8/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content}catch{return nil}}
let fileContent = readInputFile(at: inputFilePath)
var theArray: [[Character]] = Array(repeating: Array(repeating: "0", count: numsize), count: numsize), count = 0, duplicates = 0
var spotsTaken: [[Character]] = Array(repeating: Array(repeating: "0", count: numsize), count: numsize)
let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = Array(rowData) 
    for (j, value) in values.enumerated() {
        if i < numsize && j < numsize {
            theArray[i][j] = value
}}}
print(theArray)
func solveSpaces() -> Void{
    for i in 0...indicesArray.count-1{
        for j in i...indicesArray.count-1{
            let xcoord1 = indicesArray[i][0]    //12
            let ycoord1 = indicesArray[i][1]    //30
            let xcoord2 = indicesArray[j][0]    //13
            let ycoord2 = indicesArray[j][1]    //28
            /*uncomment this for part 2
             for i in 0...numsize{
                let spotx = (xcoord1-xcoord2)*i     //-1
                let spoty = (ycoord1-ycoord2)*i     //2*/
            let spotx = (xcoord1-xcoord2) //comment out for part 2
            let spoty = (ycoord1-ycoord2) //comment out for part 2
            if (xcoord1+spotx < numsize) && (ycoord1+spoty < numsize) && (xcoord1+spotx >= 0) && (ycoord1+spoty >= 0) && ((xcoord1 != xcoord2) && (ycoord1 != ycoord2))
            {
                spotsTaken[xcoord1+spotx][ycoord1+spoty] = "1"
                print("Added", xcoord1+spotx, ycoord1+spoty)
            }
            if (xcoord2-spotx < numsize) && (ycoord2-spoty < numsize) && (xcoord2-spotx >= 0) && (ycoord2-spoty >= 0) && ((xcoord1 != xcoord2) && (ycoord1 != ycoord2))
            {
                spotsTaken[xcoord2-spotx][ycoord2-spoty] = "1"
                print("Added", xcoord2-spotx, ycoord2-spoty)
            }
            //uncomment this brace for part 2 }
}}
    indicesArray = []
}
let charTypes = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "K", "L", "M", "N", "O", "Q", "R", "T", "U", "V", "W", "X", "Z", "b", "c", "d", "f", "k", "l", "m", "n", "o", "q", "r", "t", "u", "v", "w", "x", "z"]
//let charTypes = ["0", "A"]
var indicesArray: [[Int]] = []
var cumulativeIndicesArray: [[Int]] = []
var cumulativeIndicesArrayTaken: [[Int]] = []
for char in charTypes {
    for i in 0...numsize-1{
        for j in 0...numsize-1{
            if theArray[i][j] == Character(char) {
                indicesArray.append([i, j])
                cumulativeIndicesArray.append([i, j])
}}}
    print(indicesArray)
    count += indicesArray.count
    solveSpaces()
}
let countOfOnes = spotsTaken.flatMap {$0}.filter {$0 == "1"}.count
print(countOfOnes)
print(count)
print(duplicates)
print(countOfOnes - count + duplicates)
