//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - RouterView

struct RouterView: View {
    // MARK: Internal

    var body: some View {
        NavigationStack(path: $router.path) {
            router.build(route: appState.accessToken == nil ? .auth : .tabBar, appState: appState)
                .navigationDestination(for: Route.self) { route in
                    router.build(route: route, appState: appState)
                }
                .sheet(item: $router.sheet) { sheet in
                    router.build(route: sheet, appState: appState)
                }
                .fullScreenCover(item: $router.fullScreenSheet) { fullScreenSheet in
                    router.build(route: fullScreenSheet, appState: appState)
                }
        }
    }

    // MARK: Private

    @StateObject private var router = Router()
    private var appState = AppState()
}

// MARK: - RouterView_Previews

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
