//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - SimpleInputField

public struct SimpleInputField: View {
    // MARK: Public

    public var style: SimpleInputFieldStyle

    public var body: some View {
        switch style.type {
        case .password:
            secureField
        default:
            field
        }
    }

    // MARK: Private

    @FocusState private var isFocused
    @State private var isSecure: Bool = false

    private var field: some View {
        TextField(isFocused ? "" : style.placeholder, text: style.$text)
            .font(.system(size: 16))
            .textContentType(style.type == .email ? .emailAddress : nil)
            .keyboardType(style.type == .email ? .emailAddress : .default)
            .autocorrectionDisabled()
            .focused($isFocused)
            .offset(x: 16)
            .frame(height: 54)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Asset.fieldBacground.swiftUIColor)
            )
            .overlay(alignment: .topLeading) {
                Text(style.placeholder)
                    .font(.system(size: 12))
                    .foregroundColor(Asset.textSecondary.swiftUIColor)
                    .offset(x: 16, y: 4)
                    .opacity((isFocused || !style.text.isEmpty) ? 1 : 0)
            }
    }

    private var secureField: some View {
        SecureField(isFocused ? "" : style.placeholder, text: style.$text)
            .withIcon(
                isSecure ? Asset.fieldEye.swiftUIImage : Asset.fieldEyeBackslash.swiftUIImage,
                alignment: .trailing,
                onIconTap: {
                    isSecure.toggle()
                }
            )
            .font(.system(size: 16))
            .textContentType(.password)
            .autocorrectionDisabled()
            .focused($isFocused)
            .offset(x: 16)
            .frame(height: 54)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Asset.fieldBacground.swiftUIColor)
            )
            .overlay(alignment: .topLeading) {
                Text(style.placeholder)
                    .font(.system(size: 12))
                    .foregroundColor(Asset.textSecondary.swiftUIColor)
                    .offset(x: 16, y: 4)
                    .opacity((isFocused || !style.text.isEmpty) ? 1 : 0)
            }
    }
}

// MARK: - SimpleInputField_Previews

struct SimpleInputField_Previews: PreviewProvider {
    static var previews: some View {
        SimpleInputField(style: .init(type: .email, placeholder: "Login", icon: nil, text: .constant("sss")))
    }
}
