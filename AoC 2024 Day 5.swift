//
//  main.swift
//  AoC 2024 Day 5
//
//  Created by Tejas Patel on 12/4/24.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 5/AoC 2024 Day 5/input.txt"
let inputFile2Path = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 5/AoC 2024 Day 5/input2.txt"
func readInputFile(at path: String) -> String? {
    do {let content = try String(contentsOfFile: path); return content} catch {return nil}}
var fileContent = readInputFile(at: inputFilePath), cols = 100, rows = 100, count = 0, count2=0, fileContent2 = readInputFile(at: inputFile2Path)
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows), file2Content = readInputFile(at: inputFile2Path), arr2 = [[Int]]()
let lines = fileContent!.split(separator: "\n"), lines2 = file2Content!.split(separator: "\n")
for line in lines {
    let parts = line.split(separator: "|")
    if let rowIndex = Int(parts[0]), let value = Int(parts[1]) {
        while array.count <= rowIndex {array.append([])}
        array[rowIndex].append(value)
}}
for line in lines2 {
    let row = line.split(separator: ",").compactMap { Int($0) }
    breakloop: for i in 0...row.count-1 {
        for j in 0...i{
            if array[Int(exactly: row[i])!].contains(Int(exactly: row[j])!)  {
                partTwo(row: row)
                break breakloop
            }
            if i == row.count-1 && j==i {count += Int(exactly: row[row.count / 2])!}
}}}
print("Part 1:", count)
func partTwo(row: [Int]) -> Void{
    var rows = row
    for i in 0...row.count-1{
        var value = 0
        for j in 0...i{
            if array[Int(exactly: rows[i])!].contains(Int(exactly: rows[j])!){
                value = Int(exactly: rows[i])!
                rows.remove(at: i)
                rows.insert(value, at: j)
}}}
    count2 += Int(exactly: rows[rows.count / 2])!
}
print("Part 2:", count2)
