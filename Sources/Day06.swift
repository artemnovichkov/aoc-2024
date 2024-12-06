//
//  Created by Artem Novichkov on 04.12.2024.
//

import Foundation
import Algorithms

struct Day06: AdventDay {

  var data: String


  var input: (map: [[String]], position: Position) {
    let lines = data.split(separator: "\n")
    var position: Position!
    let map = lines.enumerated().map { lineIndex, substring in
      substring.enumerated().map { columnIndex, char in
        if char == "^" {
          position = .init(x: lineIndex, y: columnIndex)
        }
        return String(char)
      }
    }
    return (map, position)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let map = input.map
    var currentPosition = input.position
    var set = Set<Position>()
    var currentDirection: Direction = .top
    var reachEnd = false
    while(!reachEnd) {
      set.insert(currentPosition)
      let newPosition = Position(x: currentPosition.x + currentDirection.offset.0,
                                 y: currentPosition.y + currentDirection.offset.1)
      if newPosition.x < 0 || newPosition.x == map.count {
        reachEnd = true
        break
      }
      if newPosition.x < 0 || newPosition.y == map[newPosition.x].count {
        reachEnd = true
        break
      }
      if map[newPosition.x][newPosition.y] == "#" {
        currentDirection = Direction(rawValue: (currentDirection.rawValue + 1) % 4)!
      } else {
        currentPosition = newPosition
      }
    }
    return set.count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    ""
  }
}

struct Position: Hashable {
  let x: Int
  let y: Int
}

enum Direction: Int, CaseIterable {
  case top
  case right
  case bottom
  case left

  var offset: (Int, Int) {
    switch self {
    case .top: (-1, 0)
    case .bottom: (1, 0)
    case .left: (0, -1)
    case .right: (0, 1)
    }
  }
}
