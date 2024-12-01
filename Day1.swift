//
//  main.swift
//  AoC 2024 Day 1
//
//  Created by Tejas Patel on 11/30/24.
//

import Foundation
var result: [[String]] = [[], []]
func loadTSV(filePath: String) -> [[String]]? {
    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let rows = content.components(separatedBy: .newlines).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        let filteredRows = rows.filter { !$0.isEmpty }
        for (index, row) in filteredRows.enumerated() {
            let columns = row.components(separatedBy: "   ")
            if columns.count == 2 {
                result[0].append(columns[0])
                result[1].append(columns[1])
            } else {
            }
        }
        return result
    } catch {
        return nil
    }
}
// Usage example
let filePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 1/AoC 2024 Day 1/input.txt"
if let array = loadTSV(filePath: filePath) {
    
} else {
    print("")
}
var sum = 0
result[0] = result[0].sorted()
result[1] = result[1].sorted()
//Part 1
for i in 0...999{
    sum += abs((Int(result[0][i]) ?? 0) - (Int(result[1][i]) ?? 0))
}
print(sum)
//Part 2
var productSum = 0
var theArray: [[Int]] = Array(repeating: Array(repeating: 0, count: 100000), count: 3)
for i in 0..<100000{
    theArray[0][i] = i
}
for i in 0...999{
    theArray[2][Int(result[0][i])!]+=1
}
for i in 0...999{
    let numberNeeded = Int(result[1][i]);
    theArray[1][numberNeeded!]+=1
}
for i in 0...99999{
    productSum += theArray[1][i] * theArray[0][i] * theArray[2][i]
}
print(productSum)
