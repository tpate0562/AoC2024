//
//  main.swift
//  AoC 2024 Day 3
//
//  Created by Tejas Patel on 12/3/24.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2024 Day 3/AoC 2024 Day 3/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var sum = 0
let pattern = #"mul\((\d+),(\d+)\)"#
func partOne() -> Void {
    do {
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: fileContent!, range: NSRange(fileContent!.startIndex..., in: fileContent!))
        var results: [(Int, Int)] = []
        for match in matches {
            if let firstRange = Range(match.range(at: 1), in: fileContent!),
               let secondRange = Range(match.range(at: 2), in: fileContent!) {
                let firstInt = Int(fileContent![firstRange])!
                let secondInt = Int(fileContent![secondRange])!
                results.append((firstInt, secondInt))}}
        for result in results {
            sum += result.0 * result.1
}}catch{}}
print(sum)
func removeBetweenDontAndDo(from text: String) -> String {
    var result = text
    let dontPattern = #"don't\(\)"#
    let doPattern = #"do\(\)"#
    do {
        let dontRegex = try NSRegularExpression(pattern: dontPattern)
        let doRegex = try NSRegularExpression(pattern: doPattern)
        while let dontMatch = dontRegex.firstMatch(in: result, range: NSRange(result.startIndex..., in: result)) {
            let dontEnd = result.index(result.startIndex, offsetBy: dontMatch.range.upperBound)
            if let doMatch = doRegex.firstMatch(in: result, range: NSRange(dontEnd..., in: result)) {
                let doEnd = result.index(result.startIndex, offsetBy: doMatch.range.upperBound)
                let rangeToRemove = result.index(result.startIndex, offsetBy: dontMatch.range.lowerBound)..<doEnd
                result.removeSubrange(rangeToRemove)
            } else {
                result.removeSubrange(dontEnd...)
                break
}}} catch{};return result}

//Part 1
partOne()
print(sum);sum=0
//Part 2
let cleanedText = removeBetweenDontAndDo(from: fileContent!)
fileContent = cleanedText
partOne()
print(sum)
