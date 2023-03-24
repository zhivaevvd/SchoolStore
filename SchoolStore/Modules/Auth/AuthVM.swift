//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Combine
import Foundation

// MARK: - AuthVM

public final class AuthVM: ObservableObject {
    // MARK: Lifecycle
    
    public init(router: Router, appState: AppState) {
        self.router = router
        self.appState = appState
    }
    
    // MARK: Public
    
    @Published public var login: String = ""
    
    @Published public var password: String = ""
    
    @Published public var isAuthButtonActive: Bool = false
    
    @Published public var isLoading: Bool = false
    
    @Published public var loginError: String?
    
    @Published public var passwordError: String?
    
    @Published public var showSnackBar: Bool = false
    
    public var snackText: String = ""
    
    public func authDidTap() {
        guard validateFields() else { return }
        auth { [weak self] in
            self?.appState.person = Person.mock
            self?.appState.accessToken = "accessToken"
            self?.router.push(.tabBar)
        }
    }
    
    // MARK: Private
    
    private let router: Router
    
    private let appState: AppState
    
    private var subscriptions = Set<AnyCancellable>()
    
    private func validateFields() -> Bool {
        let isFieldsValid = !login.isEmpty && !password.isEmpty && password.count > 5
        
        loginError = login.isEmpty ? L10n.FieldError.empty : nil
        
        if password.isEmpty {
            passwordError = L10n.FieldError.empty
        } else if password.count < 5 {
            passwordError = L10n.FieldError.count
        } else {
            passwordError = nil
        }
        
        return isFieldsValid
    }
    
    private func auth(_ completion: (() -> Void)? = nil) {
        if login == AuthData.mock.login, password == AuthData.mock.password {
            passwordError = nil
            hideSnackBar()
            completion?()
        } else {
            passwordError = L10n.FieldError.wrongLoginOrPassword
            showSnackBar(text: L10n.Auth.uncorrectLoginOrPassword)
        }
    }
    
    private func showSnackBar(text: String) {
        showSnackBar = true
        snackText = text
    }
    
    private func hideSnackBar() {
        showSnackBar = false
        snackText = ""
    }
}
