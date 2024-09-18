//
//  Routine.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import Foundation

struct Routine: Identifiable, Codable, Hashable {
    
    let id: String
    let title: String
    var thumbnail: String
    let description: String
    let time: String
    var exercises: [String] = []
    
    init(id:String = UUID().uuidString, title: String, thumbnail: String, description: String, time: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
        self.time = time
    }
}
