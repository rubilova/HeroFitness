//
//  MyRoutinesView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import SwiftUI

struct MyRoutinesView: View {
    
    @StateObject private var viewModel = MyRoutinesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.routines, id:\.self) {routine in
                        RoutineSectionView(routine: routine)
                    }
                }
            }
            .task {
                viewModel.getRoutines()
            }
            .navigationTitle("My Routines")
            .navigationDestination(for: Routine.self) {routine in
                RoutineDetailView(routine: routine)
            }
            .navigationDestination(for: ExerciseFlow.self) {flow in
                ExerciseFlowView(exercises: flow.exercises)
            }
        }
    }
}

#Preview {
    MyRoutinesView()
}
