//
//  Sign.swift
//  RPS
//
//  Created by Sergio Alejandro Machaca Lamas on 24/9/21.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func findState(_ sign:Sign) -> GameState{
        switch self {
        case .rock:
            switch sign {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch sign {
            case .paper:
                return .draw
            case .scissors:
                return .lose
            case .rock:
                return .win
            }
        case .scissors:
            switch sign{
            case .scissors:
                return .draw
            case .rock:
                return .lose
            case .paper:
                return .win
            }
        }
    }
}

