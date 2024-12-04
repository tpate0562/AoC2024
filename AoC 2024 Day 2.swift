//
//  main.swift
//  AoC 2024 Day 2
//
//  Created by Tejas Patel on 12/2/24.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 2/AoC 2024 Day 2/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 8, rows = 1000, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)

let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = rowData.split(separator: " ").compactMap { Int($0) }
    for (j, value) in values.enumerated() {
        if i < rows && j < cols {array[i][j] = value}
}}
var valid: [Int] = Array(repeating: 0, count: 1000)
var arr2 = array
//Part 1
for i in 0...999 {
    for j in 0...7 {
        if(array[i][j] == 0) {
            if (array[i][j-2] > array[i][j-1]){array[i][j] = array[i][j-1] - 1}
            if (array[i][j-2] < array[i][j-1]){array[i][j] = array[i][j-1] + 1}
}}
    for k in 0...6 {
        if (abs(Int(array[i][k]) - Int(array[i][k+1])) > 3 || abs(Int(array[i][k]) - Int(array[i][k+1])) < 1){array[i][1] = 1; array[i][2] = 1;}
    }
    if (((array[i][0]) < (array[i][1]) && (array[i][1]) < (array[i][2])) && (array[i][2]) < (array[i][3]) && (array[i][3]) < (array[i][4]) && (array[i][4]) < (array[i][5]) && (array[i][5]) < (array[i][6]) && (array[i][6]) < (array[i][7])) {count += 1;valid[i]=1}
    else if (((array[i][0]) > (array[i][1]) && (array[i][1]) > (array[i][2])) && (array[i][2]) > (array[i][3]) && (array[i][3]) > (array[i][4]) && (array[i][4]) > (array[i][5]) && (array[i][5]) > (array[i][6]) && (array[i][6]) > (array[i][7])) {count += 1;valid[i]=1}
}
print("Part 1:", count)
//Part 2 restart bc 3d arrays were not the move
//Ripple delete and just rerun the evaluation
for i in 0...6{
    var arr3 = arr2
    for j in 0...999 {arr3[j].remove(at: i);arr3[j].append(0)}
    for p in 0...999 {
        for j in 0...7 {
            if(arr3[p][j] == 0) {
                if (arr3[p][j-2] > arr3[p][j-1]){arr3[p][j] = arr3[p][j-1] - 1}
                if (arr3[p][j-2] < arr3[p][j-1]){arr3[p][j] = arr3[p][j-1] + 1}
}}
        for k in 0...6 {
            if (abs(Int(arr3[p][k]) - Int(arr3[p][k+1])) > 3 || abs(Int(arr3[p][k]) - Int(arr3[p][k+1])) < 1){arr3[p][1] = 1; arr3[p][2] = 1;}
        }
        if (((arr3[p][0]) < (arr3[p][1]) && (arr3[p][1]) < (arr3[p][2])) && (arr3[p][2]) < (arr3[p][3]) && (arr3[p][3]) < (arr3[p][4]) && (arr3[p][4]) < (arr3[p][5]) && (arr3[p][5]) < (arr3[p][6]) && (arr3[p][6]) < (arr3[p][7])) {valid[p] = 1}
        else if (((arr3[p][0]) > (arr3[p][1]) && (arr3[p][1]) > (arr3[p][2])) && (arr3[p][2]) > (arr3[p][3]) && (arr3[p][3]) > (arr3[p][4]) && (arr3[p][4]) > (arr3[p][5]) && (arr3[p][5]) > (arr3[p][6]) && (arr3[p][6]) > (arr3[p][7])) {valid[p] = 1}
}}
var arr3 = arr2
for j in 0...999 {
    arr3[j].remove(at: 7)
    
}
for p in 0...999 {
    for j in 0...6 {
        if(arr3[p][j] == 0) {
            if (arr3[p][j-2] > arr3[p][j-1]){arr3[p][j] = arr3[p][j-1] - 1}
            if (arr3[p][j-2] < arr3[p][j-1]){
                arr3[p][j] = arr3[p][j-1] + 1}
}}
    for k in 0...5 {
        if (abs(Int(arr3[p][k]) - Int(arr3[p][k+1])) > 3 || abs(Int(arr3[p][k]) - Int(arr3[p][k+1])) < 1){arr3[p][1] = 1; arr3[p][2] = 1;}
    }
    if (((arr3[p][0]) < (arr3[p][1]) && (arr3[p][1]) < (arr3[p][2])) && (arr3[p][2]) < (arr3[p][3]) && (arr3[p][3]) < (arr3[p][4]) && (arr3[p][4]) < (arr3[p][5]) && (arr3[p][5]) < (arr3[p][6])) {valid[p] = 1}
    else if (((arr3[p][0]) > (arr3[p][1]) && (arr3[p][1]) > (arr3[p][2])) && (arr3[p][2]) > (arr3[p][3]) && (arr3[p][3]) >
             (arr3[p][4]) && (arr3[p][4]) > (arr3[p][5]) && (arr3[p][5]) > (arr3[p][6])) {valid[p] = 1}
}
print("Part 2:", valid.filter{ $0 == 1 }.count)


