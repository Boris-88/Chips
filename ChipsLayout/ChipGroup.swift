//
//  ChipGroup.swift
//  ChipsLayout
//
//  Created by Зверик Борис Станиславович on 15.03.2025.
//

import SwiftUI

struct ChipGroup: Layout {
    var spacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize(width: proposal.width ?? 0, height: maxHeight(proposal: proposal, subviews: subviews))
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var origin = bounds.origin
        for subview in subviews {
            let size = subview.sizeThatFits(proposal)
            if (origin.x + size.width) > bounds.maxX {
                origin.x = bounds.minX
                origin.y += size.height + spacing
                subview.place(at: origin, proposal: proposal)
                origin.x += size.width + spacing
            } else {
                subview.place(at: origin, proposal: proposal)
                origin.x += size.width + spacing
            }
        }
    }
    
    private func maxHeight(proposal: ProposedViewSize, subviews: Subviews) -> CGFloat {
        var origin: CGPoint = .zero
        for subview in subviews {
            let size = subview.sizeThatFits(proposal)
            if (origin.x + size.width) > (proposal.width ?? 0) {
                origin.x = 0
                origin.y += size.height + spacing
                origin.x += size.width + spacing
            } else {
                origin.x += size.width + spacing
            }
            
            if subview == subviews.last {
                origin.y += size.height
            }
        }
        return origin.y
    }
}
