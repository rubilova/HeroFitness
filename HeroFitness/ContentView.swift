//
//  ContentView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                
                MyRoutinesView().tabItem {
                    Image(systemName: "figure.run")
                    Text("My Routines")
                }
                ScheduleView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                ExploreView()
                    .tabItem {
                        Image(systemName: "figure.run.square.stack")
                        Text("Explore")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
