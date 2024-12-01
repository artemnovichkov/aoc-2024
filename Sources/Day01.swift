//
//  Created by Artem Novichkov on 01.12.2024.
//

import Algorithms

struct Day01: AdventDay {

  var data: String

  var entities: ([Int], [Int]) {
    var first = [Int]()
    var second = [Int]()
    data.split(separator: "\n").forEach {
      let values = $0.split(separator: "   ")
      first.append(Int(values[0])!)
      second.append(Int(values[1])!)
    }
    return (first, second)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let firstSorted = entities.0.sorted(by: <)
    let secondSorted = entities.1.sorted(by: <)
    let result = zip(firstSorted, secondSorted).reduce(into: 0) { partialResult, value in
      partialResult += (abs(value.0 - value.1))
    }
    return result
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let first = entities.0
    let secondSorted = entities.1
    var result = 0
    first.forEach { firstValue in
      let count = secondSorted.count { secondValue in
        firstValue == secondValue
      }
      result += firstValue * count
    }
    return result
  }
}
