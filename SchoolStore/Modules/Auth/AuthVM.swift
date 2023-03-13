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
        validateFields()
    }

    // MARK: Public

    @Published public var login: String = ""

    @Published public var password: String = ""

    @Published public var isAuthButtonActive: Bool = false

    @Published public var isLoading: Bool = false

    public func authDidTap() {
        router.push(.tabBar)
    }

    // MARK: Private

    private let router: Router

    private let appState: AppState

    private var subscriptions = Set<AnyCancellable>()

    private func validateFields() {
        Publishers.CombineLatest($login, $password).map { login, password in
            login.isEmpty && password.isEmpty
        }.sink { [weak self] isEmpty in
            self?.isAuthButtonActive = !isEmpty
        }.store(in: &subscriptions)
    }
}
