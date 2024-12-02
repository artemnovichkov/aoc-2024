//
//  Created by Artem Novichkov on 02.12.2024.
//

import Algorithms

struct Day02: AdventDay {

  var data: String

  var reports: [[Int]] {
    var reports = [[Int]]()
    data.split(separator: "\n").forEach {
      let reportValues = $0.split(separator: " ").compactMap { Int($0) }
      reports.append(reportValues)
    }
    return reports
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    reports.count { report in
      isSafe(report)
    }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    reports.count { report in
       isSafeWithWrongLevel(report)
    }
  }

  func isSafe(_ report: [Int]) -> Bool {
    var value = report[0]
    let increase = report[1] - report[0] > 0
    for index in 1..<report.count {
      let reportValue = report[index]
      if value == reportValue {
        return false
      }
      let newIncrease = reportValue - value > 0
      if newIncrease != increase {
        return false
      }
      if abs(reportValue - value) > 3 {
        return false
      }
      value = reportValue
    }
    return true
  }

  func isSafeWithWrongLevel(_ report: [Int]) -> Bool {
    if isSafe(report) {
      return true
    }
    for index in 0..<report.count {
      var report = report
      report.remove(at: index)
      if isSafe(report) {
        return true
      }
    }
    return false
  }
}
