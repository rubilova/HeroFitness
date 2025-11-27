//
//  FilterChipsDemoView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 11/26/25.
//
import SwiftUI

import SwiftUI

struct FilterChipsDemoView: View {
    // category -> set of selected values (e.g., "sport" -> ["running", "cycling"])
    @State private var selectedFilters: [String: Set<String>] = [
        "sport": [],
        "equipment": [],
        "level": [],
        "functional": [],
        "place": []
    ]

    // All possible filters, grouped by category
    let allTags: [String: [String]] = [
        "sport": ["running", "cycling", "boxing", "baseball", "swimming", "rock climbing"],
        "equipment": ["bodyweight", "dumbbells", "bands"],
        //"level": ["beginner", "intermediate", "advanced"],
        "functional": ["upper_body", "lower_body", "core"],
        "place": ["home", "gym", "outdoors"]
    ]

    // Filter routines based on selected filters:
    // AND across categories, OR within a category
    var filteredRoutines: [Routine] {
        let activeCategories = selectedFilters.filter { !$0.value.isEmpty }
        if activeCategories.isEmpty { return mockRoutines }

        return mockRoutines.filter { routine in
            for (category, values) in activeCategories {
                // Build keys like "sport:running"
                let requiredKeys = values.map { "\(category):\($0)" }

                // At least one value in this category must match
                let hasMatchInCategory = routine.tagsFlat.contains { requiredKeys.contains($0) }

                if !hasMatchInCategory {
                    return false // this routine fails this category
                }
            }
            return true
        }
    }

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Grouped Filters
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(allTags.keys.sorted(), id: \.self) { categoryKey in
                        if let values = allTags[categoryKey] {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(categoryTitle(for: categoryKey))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 8) {
                                        ForEach(values, id: \.self) { value in
                                            FilterChip(
                                                label: chipLabel(value),
                                                isSelected: isSelected(category: categoryKey, value: value)
                                            ) {
                                                toggle(category: categoryKey, value: value)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
            .background(Color.blue.opacity(0.95))

            Divider().opacity(0.2)

            // MARK: - Routine List
            List(filteredRoutines) { routine in
                HStack(spacing: 12) {
                    Image(routine.thumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.15), lineWidth: 1)
                        )

                    VStack(alignment: .leading, spacing: 4) {
                        Text(routine.title)
                            .font(.headline)

                        Text(routine.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)

                        Text(routine.tagsFlat.joined(separator: ", "))
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.black.opacity(0.1))
            }
        }
        //.navigationTitle("Explore")
        .background(Color.black.opacity(0.95))
    }

    // MARK: - Helpers

    func categoryTitle(for key: String) -> String {
        switch key {
        case "sport": return "Sport"
        case "equipment": return "Equipment"
        case "level": return "Level"
        case "functional": return "Functional Focus"
        case "place": return "Place"
        default: return key.capitalized
        }
    }

    func chipLabel(_ raw: String) -> String {
        raw.replacingOccurrences(of: "_", with: " ").capitalized
    }

    func isSelected(category: String, value: String) -> Bool {
        selectedFilters[category, default: []].contains(value)
    }

    func toggle(category: String, value: String) {
        var set = selectedFilters[category, default: []]
        if set.contains(value) {
            set.remove(value)
        } else {
            set.insert(value)
        }
        selectedFilters[category] = set
    }
}

