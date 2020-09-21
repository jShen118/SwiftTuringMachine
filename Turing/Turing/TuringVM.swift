//
//  TuringVM.swift
//  Turing
//
//  Created by Joshua Shen on 3/6/18.
//  Copyright © 2018 Joshua Shen. All rights reserved.
//

import Foundation

class TuringVM {
    var ttuplesArray: [TTuple]
    var tapeAsString = " "
    var numSteps = 0
    var key = [String: TTuple]()
    
    init(ttuplesArray: [TTuple]) {
        self.ttuplesArray = ttuplesArray
        for t in ttuplesArray {
            let csic = "\(t.currentState) \(t.inputChar)"
            key[csic] = t
        }
    }
    
    func nakedTupleReport()-> String {
        var result = "cs ic ns oc di"
        for t in ttuplesArray {
            result += "\n\(t.nakedTuple())"
        }
        return result
    }
    
    func tapeAsString(_ tape: [String])-> String {
        var result = ""
        for s in tape {result += s}
        return result
    }

    func runTuring(initialTape: String, initialState: Int, initialHead: Int)-> (numberSteps: Int, finalTape: String, trace: [String]) {
        self.tapeAsString = initialTape
        var tapeAsStrings = tapeAsString.map{String($0)}
        var head = initialHead
        var state = initialState
        var csic = "\(state) \(tapeAsStrings[head])"
        var trace = [String]()
        var step = " "
        
        while key[csic] != nil || head > tapeAsStrings.count {
            numSteps += 1
            let tuple = key[csic]!
            
            step = "\(numSteps): {cs: \(tuple.currentState), ic: \(tuple.inputChar),ns: \(tuple.newState),oc: \(tuple.outputChar),di: \(tuple.direction)} "
            
            tapeAsStrings[head] = String(tuple.outputChar)
            state = tuple.newState
            if tuple.direction == Direction.right {head += 1} else {head += -1}
            
            var tapeCopy = tapeAsStrings
            tapeCopy[head] = "[\(tapeCopy[head])]"
            step += "\(tapeAsString(tapeCopy))"
            trace.append(step)
            tapeCopy[head] = "\(tapeAsStrings[head])"
            
            csic = "\(state) \(tapeAsStrings[head])"
        }
        return (numSteps, tapeAsString(tapeAsStrings), trace)
    }
}








