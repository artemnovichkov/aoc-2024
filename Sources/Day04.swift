//
//  Created by Artem Novichkov on 04.12.2024.
//

import Foundation
import Algorithms

struct Day04: AdventDay {

  var data: String

  var lines: [[Character]] {
    data.split(separator: "\n").map { Array($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let grid = lines
    let wordChars = Array("XMAS")
    let wordLength = wordChars.count
    var count = 0

    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            for (rowDelta, colDelta) in directions {
                var found = true
                for i in 0..<wordLength {
                    let currentRow = row + i * rowDelta
                    let currentCol = col + i * colDelta
                    if grid.characterAt(row: currentRow, col: currentCol) != wordChars[i] {
                        found = false
                        break
                    }
                }
                if found {
                    count += 1
                }
            }
        }
    }

    return count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    ""
  }
}

let directions = [
    (0, 1),
    (0, -1),
    (1, 0),
    (-1, 0),
    (1, 1),
    (1, -1),
    (-1, 1),
    (-1, -1)
]

extension Array where Element == [Character] {

    func characterAt(row: Int, col: Int) -> Character? {
        guard row >= 0, row < count, col >= 0, col < self[row].count else {
            return nil
        }
        return self[row][col]
    }
}
