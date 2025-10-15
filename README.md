# SwiftUI Chip Selection Layout

A beautiful, customizable chip/tag selection component built with SwiftUI's custom Layout protocol. Features automatic wrapping, selection handling, and smooth animations.

![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0+-blue.svg)
![iOS](https://img.shields.io/badge/iOS-14.0+-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## ✨ Features

- **Custom Layout Protocol** - Built using SwiftUI's modern `Layout` protocol
- **Automatic Wrapping** - Chips automatically wrap to next line based on available width
- **Smooth Animations** - Elegant selection/deselection animations
- **Flexible & Reusable** - Generic implementation works with any `Equatable` type
- **Customizable Styling** - Easy to customize appearance and spacing
- **Selection Handling** - Built-in multi-selection support with callbacks

## 🎯 Preview

<img src="https://via.placeholder.com/300x600?text=Chip+Selection+Demo" width="300">

## 🚀 Installation

### Swift Package Manager

Add this repository to your Xcode project:
1. File → Add Package Dependencies
2. Enter URL: `https://github.com/Boris-88/MovieHD.git`
3. Select "ChipsLayout" package

### Manual Installation

Copy these files to your project:
- `ChipGroup.swift`
- `ChipsLayout.swift` 
- `ChipView.swift`

## 💻 Usage

### Basic Implementation

```swift
import SwiftUI

struct ContentView: View {
    let tags = ["SwiftUI", "iOS", "macOS", "Xcode", "UIKit"]
    
    var body: some View {
        ChipsLayout(tags: tags) { tag, isSelected in
            ChipView(tag: tag, isSelected: isSelected)
        } didChangeSelection: { selectedTags in
            print("Selected tags: \(selectedTags)")
        }
        .padding()
    }
}
```
