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

    let tags: [String: [String]]
    let tagsFlat: [String]

    static func mock(
        title: String,
        description: String,
        thumbnail: String,
        sport: [String] = [],
        equipment: [String] = [],
        level: [String] = [],
        functional: [String] = [],
        place: [String] = []
    ) -> Routine {

        let tags: [String: [String]] = [
            "sport": sport,
            "equipment": equipment,
            "level": level,
            "functional": functional,
            "place": place
        ]

        let flat = sport.map { "sport:\($0)" }
              + equipment.map { "equipment:\($0)" }
              + level.map { "level:\($0)" }
              + functional.map { "functional:\($0)" }
              + place.map { "place:\($0)" }

        return Routine(
            title: title,
            description: description,
            thumbnail: thumbnail,
            tags: tags,
            tagsFlat: flat
        )
    }
}

// MARK: - Mock Data
let mockRoutines: [Routine] = [
    .mock(
        title: "Outdoor Run",
        description: "A refreshing intermediate run focused on lower body endurance.",
        thumbnail: "run_thumbnail",
        sport: ["running"],
        equipment: ["bodyweight"],
        level: ["intermediate"],
        functional: ["lower_body"],
        place: ["outdoors"]
    ),
    .mock(
        title: "Core Strength",
        description: "Build stability and strength with this beginner core routine.",
        thumbnail: "core_thumbnail",
        sport: [],
        equipment: ["bodyweight"],
        level: ["beginner"],
        functional: ["core"],
        place: ["home"]
    ),
    .mock(
        title: "Upper Body Gym",
        description: "Advanced dumbbell workout focusing on upper body power.",
        thumbnail: "upper_thumbnail",
        sport: [],
        equipment: ["dumbbells"],
        level: ["advanced"],
        functional: ["upper_body"],
        place: ["gym"]
    ),

    // MARK: - More mock routines

    .mock(
        title: "Sunrise Park Run",
        description: "Easy outdoor jog to start your day feeling energized.",
        thumbnail: "sunrise_run",
        sport: ["running"],
        equipment: ["bodyweight"],
        level: ["beginner"],
        functional: ["lower_body"],
        place: ["outdoors"]
    ),
    .mock(
        title: "Track Intervals",
        description: "High-intensity running intervals to boost speed and VO2 max.",
        thumbnail: "track_intervals",
        sport: ["running"],
        equipment: ["bodyweight"],
        level: ["advanced"],
        functional: ["lower_body"],
        place: ["outdoors"]
    ),
    .mock(
        title: "Lower Body Dumbbell Blast",
        description: "Intense gym session focused on quads, glutes, and hamstrings.",
        thumbnail: "leg_day",
        sport: [],
        equipment: ["dumbbells"],
        level: ["intermediate"],
        functional: ["lower_body"],
        place: ["gym"]
    ),
    .mock(
        title: "Full Body Bands",
        description: "Resistance band workout you can do anywhere for full-body activation.",
        thumbnail: "bands_full_body",
        sport: [],
        equipment: ["bands"],
        level: ["intermediate"],
        functional: ["upper_body", "lower_body", "core"],
        place: ["home"]
    ),
    .mock(
        title: "Home Mobility Flow",
        description: "Gentle mobility and stretching for better flexibility and recovery.",
        thumbnail: "mobility_home",
        sport: [],
        equipment: ["bodyweight"],
        level: ["beginner"],
        functional: ["core", "lower_body"],
        place: ["home"]
    ),
    .mock(
        title: "Boxing Conditioning",
        description: "Shadowboxing and cardio intervals to build stamina and coordination.",
        thumbnail: "boxing_conditioning",
        sport: ["boxing"],
        equipment: ["bodyweight"],
        level: ["intermediate"],
        functional: ["upper_body", "core"],
        place: ["gym", "home"]
    ),
    .mock(
        title: "Cycling Power Legs",
        description: "Off-bike strength routine to support your cycling performance.",
        thumbnail: "cycling_strength",
        sport: ["cycling"],
        equipment: ["dumbbells"],
        level: ["intermediate"],
        functional: ["lower_body"],
        place: ["gym", "home"]
    ),
    .mock(
        title: "Outdoor Bodyweight Circuit",
        description: "No-equipment outdoor circuit for full-body strength and cardio.",
        thumbnail: "outdoor_circuit",
        sport: [],
        equipment: ["bodyweight"],
        level: ["intermediate"],
        functional: ["upper_body", "lower_body", "core"],
        place: ["outdoors"]
    ),
    .mock(
        title: "Gym Full-Body Strength",
        description: "Classic full-body split using dumbbells and benches at the gym.",
        thumbnail: "gym_full_body",
        sport: [],
        equipment: ["dumbbells"],
        level: ["intermediate"],
        functional: ["upper_body", "lower_body", "core"],
        place: ["gym"]
    ),
    .mock(
        title: "Home Beginner Starter",
        description: "Beginner-friendly routine for building basic strength at home.",
        thumbnail: "home_starter",
        sport: [],
        equipment: ["bodyweight"],
        level: ["beginner"],
        functional: ["upper_body", "lower_body", "core"],
        place: ["home"]
    ),
    .mock(
        title: "Advanced Core Shred",
        description: "High-intensity core workout for advanced athletes.",
        thumbnail: "core_shred",
        sport: [],
        equipment: ["bodyweight"],
        level: ["advanced"],
        functional: ["core"],
        place: ["home", "gym"]
    ),
    .mock(
        title: "Outdoor Hill Sprints",
        description: "Short, explosive hill sprints to develop power and speed.",
        thumbnail: "hill_sprints",
        sport: ["running"],
        equipment: ["bodyweight"],
        level: ["advanced"],
        functional: ["lower_body"],
        place: ["outdoors"]
    ),
    .mock(
        title: "Gym Upper Push Day",
        description: "Chest, shoulders, and triceps focus using dumbbells.",
        thumbnail: "upper_push",
        sport: [],
        equipment: ["dumbbells"],
        level: ["intermediate"],
        functional: ["upper_body"],
        place: ["gym"]
    )
]

