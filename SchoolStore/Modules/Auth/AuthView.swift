//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI
import AlertMessage

// MARK: - AuthView

public struct AuthView: View {
    // MARK: Lifecycle

    public init(vm: AuthVM) {
        self.vm = vm
    }

    // MARK: Public

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                Text(L10n.Auth.action)
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.authDidTap()
                    }

                emailField
                passwordField
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

            authButton
        }
        .alertMessage(isPresented: $vm.showSnackBar, type: .banner, autoHideIn: 3.0, dragToDismiss: true) {
            HStack {
                Text(vm.snackText)
                     .foregroundColor(.white)
                     .padding(16)
                        
                Spacer()
             }
              .background(Color.red)
        }
    }

    // MARK: Private

    private enum Field: Hashable {
        case email
        case password
    }

    @ObservedObject private var vm: AuthVM
    @FocusState private var focusedField: Field?

    private var emailField: some View {
        EmailFieldView(placeholder: L10n.Auth.login, text: $vm.login, error: $vm.loginError)
            .focused($focusedField, equals: .email)
    }

    private var passwordField: some View {
        PasswordField(placeholder: L10n.Auth.password, text: $vm.password, error: $vm.passwordError)
            .focused($focusedField, equals: .password)
    }

    private var authButton: some View {
        Button {
            vm.authDidTap()
        } label: {
            Text(L10n.Auth.action.uppercased())
                .font(.title3.bold())
                .foregroundColor(Asset.white.swiftUIColor)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .foregroundColor(Asset.navBlue.swiftUIColor)
                        .frame(width: 328, height: 48)
                )
        }
        .padding(.bottom, 24)
    }
}

// MARK: - AuthView_Previews

public struct AuthView_Previews: PreviewProvider {
    public static var previews: some View {
        AuthView(vm: AuthVM(router: Router(), appState: AppState()))
    }
}
