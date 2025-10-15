//
//  ChipsLayout.swift
//  ChipsLayout
//
//  Created by Зверик Борис Станиславович on 15.03.2025.
//
import SwiftUI

struct ChipsLayout<Content: View, Tag: Equatable>: View where Tag: Hashable {
    var tags: [Tag]
    @ViewBuilder var content: (Tag, Bool) -> Content
    var spacing: CGFloat = 10
    var didChangeSelection: ([Tag]) -> ()
    @State var selectedTags: [Tag] = []

    var body: some View {
        ChipGroup(spacing: spacing) {
            ForEach(tags, id: \.self) { tag in
                content(tag, selectedTags.contains(tag))
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            if selectedTags.contains(tag) {
                                selectedTags.removeAll(where: { $0 == tag })
                            } else {
                                selectedTags.append(tag)
                            }
                        }
                        didChangeSelection(selectedTags)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
