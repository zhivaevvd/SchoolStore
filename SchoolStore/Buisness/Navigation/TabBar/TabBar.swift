//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - TabBar

public struct TabBar: View {
    // MARK: Lifecycle

    public init(router: Router, appState: AppState) {
        self.router = router
        self.appState = appState
    }

    // MARK: Public

    public var body: some View {
        TabView {
            NavigationBar(
                config: .init(
                    title: L10n.Catalog.title,
                    displayType: .largeTitle,
                    contentView:
                    CatalogView(vm: CatalogVM(router: router))
                )
            )
            .tabItem {
                Label(L10n.Catalog.title, systemImage: "cart")
            }

            NavigationBar(
                config: .init(
                    title: L10n.Profile.title,
                    displayType: .largeTitle,
                    contentView:
                    ProfileView()
                        .onTapGesture {
                            appState.accessToken = nil
                            router.setRoot(route: .auth, appState: appState)
                        }
                )
            )
            .tabItem {
                Label(L10n.Profile.title, systemImage: "person")
            }
        }
    }

    // MARK: Private

    private let router: Router
    private let appState: AppState
}

// MARK: - TabBar_Previews

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(router: Router(), appState: AppState())
    }
}
