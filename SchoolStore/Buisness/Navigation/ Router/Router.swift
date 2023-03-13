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
    @Published public var root: Route?

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
