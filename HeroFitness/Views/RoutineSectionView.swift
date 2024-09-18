//
//  RoutineSectionView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import SwiftUI

struct RoutineSectionView: View {
    let routine: Routine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(value: routine) {
                Text(routine.title).font(.title)
            }
            HStack { //description
                Text(routine.description)
                    .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                Image(systemName: "timer")
                Text(routine.time)
                    .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            }
            ZStack {
                //preview image
                AsyncImage(url: URL(string: routine.thumbnail)) {result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 220)
                        .cornerRadius(10)
                }
                //startButton
                NavigationLink(value: routine) {
                    Text("START")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.mint)
                    .cornerRadius(10)
                    .frame(width: 300,height: 180, alignment: .bottomTrailing)
                }
            }
        }
        .padding(6)
    }
}

#Preview {
    RoutineSectionView(routine: Routine(id: "1", title: "Strength For Runners", thumbnail: "https://cdn.pixabay.com/photo/2016/11/19/12/21/man-1838991_1280.jpg", description: "Sets: 10", time: "30 minutes"))
}
