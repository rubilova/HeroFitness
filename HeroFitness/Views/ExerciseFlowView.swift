//
//  ExerciseView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import SwiftUI

struct ExerciseFlowView: View {
    
    var exercises: [Exercise]
    @State private var exerciseIndex: Int
    @State private var url: String
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
        let initExerciseIndex = 0
        self.exerciseIndex = initExerciseIndex
        self.url = exercises[initExerciseIndex].thumbnail
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                header()
                HStack {
                    prevButton()
                    nextButton()
                }.multilineTextAlignment(.leading)
                exerciseInfo()
                imageView()
            }.padding(30)
        }
    }
    
    private func header() -> some View {
        HStack {
            Text("Workout step:")
            Text(exercises[exerciseIndex].title)
                .foregroundColor(.purple)
        }.font(.title)
    }
    
    private func prevButton() -> some View {
        HStack {
            Image(systemName: "backward.circle")
            Text("Prev")
        }.font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .background(exerciseIndex == 0 ? Color.gray:Color.mint)
            .cornerRadius(10)
            .onTapGesture {
                if (exerciseIndex > 0) {
                    exerciseIndex -= 1
                    //progress -= Int(100/exercises.count)
                    url = exercises[exerciseIndex].thumbnail
                }
                
        }
    }
    
    private func nextButton() -> some View {
        HStack {
            Text("Next")
            Image(systemName: "forward.circle")
                
        }.font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .background(
                exerciseIndex == exercises.count-1 ? Color.gray:Color.mint)
            .cornerRadius(10)
            .onTapGesture {
                if (exerciseIndex < exercises.count - 1) {
                    exerciseIndex += 1
                    url = exercises[exerciseIndex].thumbnail
                }
                
            }
    }
    
    private func exerciseInfo() -> some View {
        HStack {
            Image(systemName: "figure.strengthtraining.functional")
            Text(exercises[exerciseIndex].workoutType)
                .fontWeight(.semibold)
            Image(systemName: "figure.strengthtraining.traditional")
            Text(exercises[exerciseIndex].equipment)
                .fontWeight(.semibold)
            Text("Reps:").fontWeight(.semibold)
            Text(exercises[exerciseIndex].reps)
                .fontWeight(.semibold)
        }
    }
    
    private func imageView() -> some View {
        AsyncImage(url: URL(string: url), content: { returnedImage in
            returnedImage
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 220)
                .cornerRadius(10)
        }, placeholder: {
            ProgressView()
        })
    }
}


#Preview {
    ExerciseFlowView(exercises: [Exercise(title: "Squats", description: "description", steps: "Some steps here",
                                       thumbnail: "https://cdn.pixabay.com/photo/2022/10/22/12/31/woman-7539138_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10")])
                     
}

                            
