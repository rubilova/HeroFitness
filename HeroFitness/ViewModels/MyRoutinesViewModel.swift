//
//  MyRoutinesViewModel.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/13/24.
//

import Foundation

class MyRoutinesViewModel: ObservableObject {
    
    @Published var routines: [Routine] = []
    
    init() {
        if routines.isEmpty {
            getRoutines()
        }
    }
    
    func getRoutines() {
        let routinesList = mockRoutines
        routines = routinesList
    }
}
