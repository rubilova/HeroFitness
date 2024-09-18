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
        let routinesList = [
            // running strength
            Routine(id: "1", title: "Strength For Runners", thumbnail: "https://cdn.pixabay.com/photo/2016/11/19/12/21/man-1838991_1280.jpg", description: "Sets: 10", time: "30 minutes"),
            Routine(id: "2", title: "Daily Mobility", thumbnail: "https://cdn.pixabay.com/photo/2022/10/11/10/06/woman-7513943_1280.jpg", description: "Sets: 8", time: "20 minutes"),
            Routine(id: "3", title: "Dynamic Stretching", thumbnail: "https://cdn.pixabay.com/photo/2015/06/18/23/02/stretching-814227_1280.jpg", description: "Sets: 5", time: "10 minutes")
        ]
        routines = routinesList
    }
}
