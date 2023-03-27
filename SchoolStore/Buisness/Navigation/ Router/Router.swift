//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public final class Router: ObservableObject {
    @Published public var path = NavigationPath()
    @Published public var route: Route?
    @Published public var sheet: Route?
    @Published public var fullScreenSheet: Route?

    public func push(_ route: Route) {
        path.append(route)
    }

    public func presentSheet(_ route: Route, fullScreen: Bool = false) {
        if fullScreen {
            fullScreenSheet = route
        } else {
            sheet = route
        }
    }

    public func pop() {
        path.removeLast()
    }

    public func popToRoot() {
        path.removeLast(path.count)
    }

    public func dissmiss(fullScreen: Bool = false) {
        if fullScreen {
            sheet = nil
        } else {
            fullScreenSheet = nil
        }
    }

    public func setRoot(route: Route, appState: AppState) {
        path = NavigationPath()
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first(where: { $0.isKeyWindow })
        window?.rootViewController = UIHostingController(rootView: build(route: route, appState: appState))
        window?.makeKeyAndVisible()
    }

    @ViewBuilder
    public func build(route: Route, appState: AppState) -> some View {
        switch route {
        case .auth:
            let vm = AuthVM(router: self, appState: appState)
            AuthView(vm: vm)
        case .tabBar:
            TabBar()
        }
    }
}
