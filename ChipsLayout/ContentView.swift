//
//  ContentView.swift
//  ChipsLayout
//
//  Created by Зверик Борис Станиславович on 15.03.2025.
//

import SwiftUI

struct ContentView: View {
    let tags: [String] = ["iOS 14","SwiftUI", "iOS 16",  "macOS", "Xcode", "MacCatalyst", "UIKit", "AppKit", "Objective-C", "XcodeProject", "Foundation", "SwiftData", "Sonoma", "Apple", "iWatch", "Macbook", "iPad", "AppleTV", "airPods", "airPort"]
    var body: some View {
        NavigationStack {
            ChipsLayout(tags: tags) { (tag, isSelected) in
                ChipView(tag: tag, isSelected: isSelected)
            } didChangeSelection: { tags in
                print(tags)
            }
            .padding(10)
            .background(.secondary.opacity(0.1), in: .rect(cornerRadius: 20))
        }
        .padding()
        .navigationBarTitle("Chip Selection")
    }
}

#Preview {
    ContentView()
}
