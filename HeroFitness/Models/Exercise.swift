//
//  Exercise.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//
import Foundation

struct Exercise: Identifiable, Codable, Hashable {
    
    let id: String
    let title: String
    let description: String
    let steps: String
    let thumbnail: String
    let workoutType: String
    let equipment: String
    let reps: String
    
    init(id:String = UUID().uuidString, title: String, description: String, steps: String, thumbnail: String, workoutType: String, equipment: String, reps: String) {
        self.id = id
        self.title = title
        self.description = description
        self.steps = steps
        self.thumbnail = thumbnail
        self.workoutType = workoutType
        self.equipment = equipment
        self.reps = reps
    }
}
