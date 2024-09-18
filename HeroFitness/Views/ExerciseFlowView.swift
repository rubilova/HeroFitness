//
//  ExerciseView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import SwiftUI

struct ExerciseFlowView: View {
    
    var exercises: [Exercise]
    @State private var exerciseIndex: Int = 0
    @State private var url: String = ""
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
        self.url = exercises[exerciseIndex].thumbnail
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                HStack {
                    Text("Workout step:")
                    Text(exercises[exerciseIndex].title)
                        .foregroundColor(.purple)
                }.font(.title)
                HStack {
                    //Prev Button
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
                            print("Prev pressed")
                    }
                    //Next Button
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
                            print("Next tapped")
                        }
                }.multilineTextAlignment(.leading)
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
                AsyncImage(url: URL(string: url), content: { returnedImage in
                    returnedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 220)
                        .cornerRadius(10)
                }, placeholder: {
                    ProgressView()
                })
            }.padding(30)
        }
    }
}


#Preview {
    ExerciseFlowView(exercises: [Exercise(title: "Squats", description: "description", steps: "Some steps here",
                                       thumbnail: "https://cdn.pixabay.com/photo/2022/10/22/12/31/woman-7539138_1280.jpg", workoutType: "Mobility",  equipment: "Body Weight", reps: "3x10")])
}

                            
