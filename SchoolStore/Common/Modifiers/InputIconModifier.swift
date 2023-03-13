//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - InputIconModifier

struct InputIconModifier: ViewModifier {
    var icon: Image
    var alignment: Alignment
    var onIconTap: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .overlay(
                icon
                    .foregroundStyle(.secondary)
                    .frame(width: 36, height: 36)
                    .frame(maxWidth: .infinity, alignment: alignment)
                    .padding(8)
                    .offset(x: -16)
            )
            .onTapGesture {
                onIconTap?()
            }
    }
}

extension View {
    func withIcon(_ icon: Image, alignment: Alignment, onIconTap: (() -> Void)? = nil) -> some View {
        modifier(InputIconModifier(icon: icon, alignment: alignment, onIconTap: onIconTap))
    }
}
