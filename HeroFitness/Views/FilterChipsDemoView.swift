//
//  FilterChipsDemoView.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 11/26/25.
//
import SwiftUI

struct FilterChipsDemoView: View {
    @State private var selectedTags: Set<String> = []

    // All unique tags from mock data
    var allTags: [String] {
        let set = Set(mockRoutines.flatMap { $0.tags })
        return Array(set).sorted { $0.lowercased() < $1.lowercased() }
    }

    // Filter logic: routine must contain ALL selected tags
    var filteredRoutines: [Routine] {
        guard !selectedTags.isEmpty else { return mockRoutines }

        return mockRoutines.filter { routine in
            let routineTagSet = Set(routine.tags)
            return !routineTagSet.isDisjoint(with: selectedTags)
        }
    }

    var body: some View {
        VStack(spacing: 0) {

            // TAGS AREA
            ScrollView(.vertical, showsIndicators: false) {
                TagFlowLayout(spacing: 8, rowSpacing: 8) {
                    ForEach(allTags, id: \.self) { tag in
                        FilterChip(
                            label: tagDisplay(tag),
                            isSelected: selectedTags.contains(tag)
                        ) {
                            toggle(tag: tag)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .background(Color.blue.opacity(0.95))

            Divider().opacity(0.2)

            // ROUTINE LIST
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

                        Text(routine.tags.joined(separator: " • "))
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.black.opacity(0.1))
            }
        }
        //.navigationTitle("Explore")
        .background(Color.blue.opacity(0.95))
    }

    // MARK: - Helpers

    func tagDisplay(_ tag: String) -> String {
        tag.capitalized
    }

    func toggle(tag: String) {
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
}


struct TagFlowLayout: Layout {
    var spacing: CGFloat = 8
    var rowSpacing: CGFloat = 8

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let maxWidth = proposal.width ?? .infinity

        guard maxWidth < .infinity else {
            let totalWidth = subviews.reduce(0) { $0 + $1.sizeThatFits(.unspecified).width + spacing }
            let maxHeight = subviews.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0
            return CGSize(width: totalWidth, height: maxHeight)
        }

        var currentRowWidth: CGFloat = 0
        var totalHeight: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentRowWidth + size.width > maxWidth {
                totalHeight += rowHeight + rowSpacing
                currentRowWidth = 0
                rowHeight = 0
            }
            currentRowWidth += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }

        totalHeight += rowHeight
        return CGSize(width: maxWidth, height: totalHeight)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += rowHeight + rowSpacing
                rowHeight = 0
            }

            subview.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(width: size.width, height: size.height)
            )

            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}

