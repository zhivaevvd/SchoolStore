//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - EmailFieldView

public struct EmailFieldView: View {
    // MARK: Lifecycle

    public init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }

    // MARK: Public

    public var body: some View {
        TextField(isFocused ? "" : placeholder, text: $text)
            .font(.system(size: 16))
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .focused($isFocused)
            .offset(x: 16, y: (isFocused || !text.isEmpty) ? 6 : 0)
            .frame(height: 54)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Asset.fieldBacground.swiftUIColor)
            )
            .overlay(alignment: .topLeading) {
                Text(placeholder)
                    .font(.system(size: 12))
                    .foregroundColor(Asset.textSecondary.swiftUIColor)
                    .offset(x: 16, y: 6)
                    .opacity((isFocused || !text.isEmpty) ? 1 : 0)
            }
    }

    // MARK: Private

    private var placeholder: String
    @Binding private var text: String

    @FocusState private var isFocused: Bool
}

// MARK: - EmailFieldView_Previews

struct EmailFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailFieldView(placeholder: "text", text: .constant("Text"))
    }
}
