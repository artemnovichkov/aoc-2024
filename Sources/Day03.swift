//
//  Day01 2.swift
//  AdventOfCode
//
//  Created by Artem Novichkov on 03.12.2024.
//


//
//  Created by Artem Novichkov on 01.12.2024.
//

import Foundation
import Algorithms

struct Day03: AdventDay {

  var data: String
  let mulPattern = #"mul\((\d+),(\d+)\)"#
  let doPattern = #"do"#
  let dontPattern = #"don't"#

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var sum = 0
    do {
      let regex = try NSRegularExpression(pattern: mulPattern)
      let matches = regex.matches(in: data, range: NSRange(data.startIndex..., in: data))

      for match in matches {
        if let range1 = Range(match.range(at: 1), in: data),
           let range2 = Range(match.range(at: 2), in: data) {
          let number1 = data[range1]
          let number2 = data[range2]
          sum += Int(number1)! * Int(number2)!
        }
      }
    } catch {
      print("Invalid regex: \(error.localizedDescription)")
    }
    return sum
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var sum = 0
    do {
      let mulRegex = try NSRegularExpression(pattern: mulPattern)
      let doRegex = try NSRegularExpression(pattern: doPattern)
      let dontRegex = try NSRegularExpression(pattern: dontPattern)
      let mulMatches = mulRegex.matches(in: data, range: NSRange(data.startIndex..., in: data))
      let doMatches = doRegex.matches(in: data, range: NSRange(data.startIndex..., in: data))
      let dontMatches = dontRegex.matches(in: data, range: NSRange(data.startIndex..., in: data))

      let allMatches = [mulMatches, doMatches, dontMatches]
        .flatMap { $0 }
        .sorted { $0.range.location < $1.range.location }
      var ignoreMuls = false
      for match in allMatches {
        let range = Range(match.range, in: data)!
        let string = data[range]
        if string == "do" {
          ignoreMuls = false
        } else if string == "don't" {
          ignoreMuls = true
        } else if !ignoreMuls {
          if let range1 = Range(match.range(at: 1), in: data),
             let range2 = Range(match.range(at: 2), in: data) {
            let number1 = data[range1]
            let number2 = data[range2]
            sum += Int(number1)! * Int(number2)!
          }
        }
      }
    } catch {
      print("Invalid regex: \(error.localizedDescription)")
    }
    return sum
  }
}
