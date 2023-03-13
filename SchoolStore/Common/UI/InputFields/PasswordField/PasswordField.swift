//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - PasswordField

public struct PasswordField: View {
    // MARK: Lifecycle

    public init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }

    // MARK: Public

    public var body: some View {
        GeometryReader { proxy in
            let buttonXOffset: CGFloat = proxy.frame(in: .local).minX + 16
            ZStack(alignment: .trailing) {
                if isSecured {
                    SecureField(isSecureFocused ? "" : placeholder, text: $text)
                        .font(.system(size: 16))
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .focused($isSecureFocused)
                        .offset(x: 16, y: (isSecureFocused || !text.isEmpty) ? 6 : 0)
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
                                .opacity((isSecureFocused || !text.isEmpty) ? 1 : 0)
                        }
                } else {
                    EmailFieldView(placeholder: placeholder, text: $text)
                        .focused($isPlainFocused)
                }

                Button {
                    isSecured.toggle()
                    if !isSecured { isPlainFocused = true } else { isSecureFocused = true }
                } label: {
                    isSecured ? Asset.fieldEye.swiftUIImage : Asset.fieldEyeBackslash.swiftUIImage
                }
                .offset(x: -buttonXOffset)
            }
        }
    }

    // MARK: Private

    private var placeholder: String
    @Binding private var text: String
    @State private var isSecured: Bool = true
    @FocusState private var isSecureFocused: Bool
    @FocusState private var isPlainFocused: Bool
}

// MARK: - PasswordField_Previews

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(placeholder: "Password", text: .constant("password"))
    }
}
