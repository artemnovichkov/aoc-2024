//
//  Created by Artem Novichkov on 04.12.2024.
//

import Foundation
import Algorithms

struct Day05: AdventDay {

  var data: String


  var input: (rules: [(Int, Int)], updates: [[Int]]) {
    var rules: [(Int, Int)] = []
    var updates: [[Int]] = []
    let parts = data.split(separator: "\n\n")
    rules = parts[0].split(separator: "\n").map { substring in
      let components = substring.components(separatedBy: "|").map { Int($0)! }
      return (components[0], components[1])
    }
    updates = parts[1].split(separator: "\n").map { substring in
      substring.components(separatedBy: ",").map { Int($0)! }
    }
    return (rules, updates)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var sum = 0
    var ruleMap: [Int: Set<Int>] = [:]
    for rule in input.rules {
      ruleMap[rule.0, default: Set<Int>()].insert(rule.1)
    }

    for update in input.updates {
      var valid = true
      var seenPages: Set<Int> = []

      for page in update {
        if let pagesToBeAfter = ruleMap[page] {
          if !pagesToBeAfter.isDisjoint(with: seenPages) {
            valid = false
            break
          }
        }
        seenPages.insert(page)
      }

      if valid {
        sum += update[update.count / 2]
      }
    }

    return sum
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    ""
  }
}
