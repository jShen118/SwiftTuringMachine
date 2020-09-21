//
//  main.swift
//  Turing
//
//  Created by Joshua Shen on 3/6/18.
//  Copyright © 2018 Joshua Shen. All rights reserved.
//

import Foundation

func simpleTuringRun() {
    var tupleString = "0 _ 0 _ r\n"
    tupleString += "0 0 1 1 r\n"
    tupleString += "0 1 1 0 r\n"
    tupleString += "1 1 1 0 r\n"
    tupleString += "1 0 1 1 r\n"
    
    let tuplesArray = readTuples(tuplesAsString: tupleString)
    let tvm = TuringVM(ttuplesArray: tuplesArray)
    let result = tvm.runTuring(initialTape: "_111000_", initialState: 0, initialHead: 0)
    print("Tuples:\n")
    print(tvm.nakedTupleReport())
    print("Initial String: \"_111000\" Initial State: 0 Initial Head Position: 0")
    print("\n*Running Turing*\n")
    print("Number Steps In Run: \(result.numberSteps)")
    print("Final Tape: \(result.finalTape)")
    print("\nTrace:")
    for line in result.trace{print("" + line)}
}
simpleTuringRun()

