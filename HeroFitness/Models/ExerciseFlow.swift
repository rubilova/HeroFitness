//
//  ExerciseFlow.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import Foundation

struct ExerciseFlow: Identifiable, Codable, Hashable {
    let id: String
    let exercises: [Exercise]
    
    init(id:String = UUID().uuidString, exercises: [Exercise]){
        self.id = id
        self.exercises = exercises
    }
}

