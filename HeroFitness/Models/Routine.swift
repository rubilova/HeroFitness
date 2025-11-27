//
//  Routine.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 9/12/24.
//

import Foundation

// MARK: - Routine Model

struct Routine: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let thumbnail: String      // image name or remote URL

    let tags: [String]

    static func mock(
        title: String,
        description: String,
        thumbnail: String,
        tags: [String]
    ) -> Routine {

        return Routine(
            title: title,
            description: description,
            thumbnail: thumbnail,
            tags: tags
        )
    }
}

// MARK: - Mock Data
let mockRoutines: [Routine] = [
    Routine(
        title: "Outdoor Run",
        description: "A refreshing intermediate run focused on lower body endurance.",
        thumbnail: "run_thumbnail",
        tags: ["running", "outdoors", "intermediate", "lower body", "bodyweight"]
    ),
    Routine(
        title: "Core Strength",
        description: "Build stability and strength with this beginner core routine.",
        thumbnail: "core_thumbnail",
        tags: ["core", "home", "beginner", "bodyweight"]
    ),
    Routine(
        title: "Upper Body Gym",
        description: "Advanced dumbbell workout focusing on upper body power.",
        thumbnail: "upper_thumbnail",
        tags: ["upper body", "gym", "advanced", "dumbbells"]
    ),
    Routine(
        title: "Outdoor Circuit",
        description: "Full-body outdoor circuit with no equipment.",
        thumbnail: "outdoor_circuit",
        tags: ["full body", "outdoors", "intermediate", "bodyweight"]
    ),
    Routine(
        title: "Bands Full Body",
        description: "Resistance band workout you can do anywhere.",
        thumbnail: "bands_full_body",
        tags: ["full body", "home", "intermediate", "bands"]
    ),
    Routine(
        title: "Hill Sprints",
        description: "Short, explosive hill sprints for speed and power.",
        thumbnail: "hill_sprints",
        tags: ["running", "outdoors", "advanced", "lower body"]
    )
]


