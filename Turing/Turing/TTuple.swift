//
//  TTuple.swift
//  Turing
//
//  Created by Joshua Shen on 3/6/18.
//  Copyright © 2018 Joshua Shen. All rights reserved.
//

import Foundation

//TTUPLE STRUCT
import Foundation

enum Direction {
    case left, right
}

struct TTuple: CustomStringConvertible {
    let currentState: Int
    let inputChar: Character
    let newState: Int
    let outputChar: Character
    let direction: Direction
    static var key = " "
    
    static func makeKey(state: Int, inputChar: Character)-> String {
        key = "\(state) \(inputChar)"
        return key
    }
    
    func getKey()-> String {
        return TTuple.key
    }
    
    init(currentState: Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction) {
        self.currentState = currentState
        self.inputChar = inputChar
        self.newState = newState
        self.outputChar = outputChar
        self.direction = direction
    }
    
    var description: String {
        return "cs: \(currentState) ic: \(inputChar) ns: \(newState) oc: \(outputChar) di: \(direction)"
    }
    
    func nakedTuple()-> String {
        return "\(currentState)  \(inputChar)  \(newState)  \(outputChar)  \(direction)"
    }
}
