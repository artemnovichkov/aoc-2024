//
//  Created by Artem Novichkov on 04.12.2024.
//

import Foundation

struct Day07: AdventDay {

  var data: String

  var input: [(Int, [Int])] {
    data
      .split(separator: "\n")
      .map { line in
        let parts = line.split(separator: ":")
        let testValue = Int(parts[0])!
        let numbers = parts[1]
          .split(separator: " ")
          .map { Int($0)! }
        return (testValue, numbers)
      }
  }

  func part1() -> Any {
    input
      .filter(evaluateExpressions)
      .map(\.0)
      .reduce(0, +)
  }

  func evaluateExpressions(_ value: (testValue: Int, numbers: [Int])) -> Bool {
    func generateOperatorCombinations(count: Int) -> [[String]] {
      if count == 0 { return [[]] }
      let smallerCombinations = generateOperatorCombinations(count: count - 1)
      var result = [[String]]()
      for combination in smallerCombinations {
        result.append(combination + ["+"])
        result.append(combination + ["*"])
      }
      return result
    }

    func evaluate(_ nums: [Int], _ ops: [String]) -> Int {
      var result = nums[0]
      for (i, op) in ops.enumerated() {
        switch op {
        case "+":
          result += nums[i + 1]
        case "*":
          result *= nums[i + 1]
        default:
          break
        }
      }
      return result
    }

    let operatorCombinations = generateOperatorCombinations(count: value.numbers.count - 1)

    for ops in operatorCombinations {
      if evaluate(value.numbers, ops) == value.testValue {
        return true
      }
    }
    return false
  }

  func part2() -> Any {
    ""
  }
}
