//
//  FilterChip.swift
//  HeroFitness
//
//  Created by Elena Rubilova on 11/26/25.
//
import SwiftUI

struct FilterChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.footnote.weight(.medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ?
                    //LinearGradient(colors: [Color.pink, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                            Color.blue.opacity(0.1)
                    : Color.white.opacity(0.1)
                )
                .foregroundStyle(isSelected ? .white : .white.opacity(0.9))
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(
                            isSelected ? Color.white.opacity(0.5) : Color.white.opacity(0.15),
                            lineWidth: 1
                        )
                )
                .shadow(color: isSelected ? Color.purple.opacity(0.4) : .clear, radius: 5)
        }
        .buttonStyle(.plain)
    }
}
