//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - EmailFieldView

public struct EmailFieldView: View {
    // MARK: Lifecycle

    public init(placeholder: String, text: Binding<String>, error: Binding<String?>) {
        self.placeholder = placeholder
        _error = error
        _text = text
    }

    // MARK: Public

    public var body: some View {
        VStack(spacing: 0) {
            TextField(isFocused ? "" : placeholder, text: $text)
                .font(.system(size: 16))
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .focused($isFocused)
                .offset(x: 16, y: (isFocused || !text.isEmpty) ? 6 : 0)
                .frame(height: 54)
                .background(
                    RoundedCorners(tl: 8, tr: 8)
                )
                .overlay(alignment: .topLeading) {
                    Text(placeholder)
                        .font(.system(size: 12))
                        .foregroundColor(Asset.textSecondary.swiftUIColor)
                        .offset(x: 16, y: 6)
                        .opacity((isFocused || !text.isEmpty) ? 1 : 0)
                }

            if error != nil {
                errorView
            }
        }
    }

    // MARK: Private

    private var placeholder: String
    @Binding private var text: String
    @Binding private var error: String?

    @FocusState private var isFocused: Bool

    private var errorView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Asset.fieldError.swiftUIColor)

            Text(error ?? "")
                .font(.caption)
                .foregroundColor(Asset.fieldError.swiftUIColor)
                .padding(.leading, 16)
        }
    }
}

// MARK: - EmailFieldView_Previews

struct EmailFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailFieldView(placeholder: "text", text: .constant("Text"), error: .constant("uncorrect"))
    }
}
