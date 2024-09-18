//
//  ExerciseRowView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/16/24.
//

import SwiftUI

struct ExerciseRowView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack {
            HStack {
                Text(exercise.title).font(.title)
                Spacer()
            }
            HStack {
                Text("Sets: 3").bold()
                Text("Reps: 10").bold()
                Spacer()
            }
            HStack {
                AsyncImage(url: URL(string: exercise.thumbnail)) {result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
                VStack {
                    Text(exercise.description)
                    Spacer()
                }
                Spacer()
            }
            
        }.font(.body)
            .padding(8)
    }
}

#Preview {
    ExerciseRowView(exercise: Exercise(title: "Squats", description: "description", steps: "Some steps here..",
                                       thumbnail: "https://cdn.pixabay.com/photo/2022/10/22/12/31/woman-7539138_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10"))
}
