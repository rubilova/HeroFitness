//
//  RoutineDetailView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/13/24.
//

import SwiftUI

struct RoutineDetailView: View {
    let routine: Routine
    @StateObject private var viewModel = ExercisesViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(routine.title).font(.title).foregroundColor(.blue)
                routineInfo()
                ForEach(viewModel.exercises) { exercise in
                    ExerciseRowView(exercise: exercise)
                }
            }.padding(10)
        }
    }
    
    private func routineInfo() -> some View {
        
        HStack {
            Text(routine.description)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            Image(systemName: "timer")
            Text(routine.time)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            NavigationLink(value: ExerciseFlow(id: routine.id, exercises: viewModel.exercises)) {
                startButton()
            }
        }
    }
    
    private func startButton() -> some View {
        Text("START")
        .font(.headline)
        .foregroundColor(.white)
        .padding(10)
        .background(Color.mint)
        .cornerRadius(10)
        .frame(width: 80, height: 40, alignment: .bottomTrailing)
    }
}

#Preview {
    RoutineDetailView(routine: Routine(id: "1", title: "Strength For Runners", thumbnail: "runners_strength", description: "Sets: 10", time: "30 minutes"))
}
