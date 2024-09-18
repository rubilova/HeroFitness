//
//  ExercisesViewModel.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/16/24.
//

import Foundation

class ExercisesViewModel: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    
    init() {
        getExercises()
    }
    
    func getExercises() {
        let exercisesList = [
            Exercise(title: "Squats", description: "Squats are a great exercise for strengthening your lower body, including your quads, hamstrings, glutes, and calves.", steps: "Some steps here..",
                     thumbnail: "https://cdn.pixabay.com/photo/2016/02/16/19/26/exercise-1203896_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10"),
            Exercise(title: "Plank", description: "Planks strengthen your core muscles, can help improve your posture, reduce back pain, and prevent injury.", steps: "Some steps here..",
                     thumbnail: "https://cdn.pixabay.com/photo/2016/02/16/19/28/burpee-1203903_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10"),
            Exercise(title: "Multiplanar Lunges", description: "Multiplanar lunges are a great way to challenge your balance, coordination, and lower body strength by moving in multiple directions.", steps: "Some steps here..",
                     thumbnail: "https://cdn.pixabay.com/photo/2016/11/21/14/39/exercise-1845759_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10")]
        
        exercises.append(contentsOf: exercisesList)
    }
}
