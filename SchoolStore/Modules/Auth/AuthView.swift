//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - AuthView

public struct AuthView: View {
    // MARK: Lifecycle

    public init(vm: AuthVM) {
        self.vm = vm
    }

    // MARK: Public

    public var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text(L10n.Auth.action)
                .font(.largeTitle)
                .onTapGesture {
                    vm.authDidTap()
                }

            emailField
            passwordField

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 108)
        .background(
            Rectangle()
                .fill(Asset.white.swiftUIColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    focusedField = nil
                }
        )
    }

    // MARK: Private

    private enum Field: Hashable {
        case email
        case password
    }

    @ObservedObject private var vm: AuthVM
    @FocusState private var focusedField: Field?

    private var emailField: some View {
        EmailFieldView(placeholder: L10n.Auth.login, text: $vm.login)
            .focused($focusedField, equals: .email)
    }

    private var passwordField: some View {
        PasswordField(placeholder: L10n.Auth.password, text: $vm.password)
            .focused($focusedField, equals: .password)
    }
}

// MARK: - AuthView_Previews

public struct AuthView_Previews: PreviewProvider {
    public static var previews: some View {
        AuthView(vm: AuthVM(router: Router(), appState: AppState()))
    }
}
