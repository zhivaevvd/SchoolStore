//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - TabBar

struct TabBar: View {
    // MARK: Internal

    var body: some View {
        Text("title")
            .onTapGesture {
                appState.accessToken = nil
                router.setRoot(route: .auth, appState: appState)
            }
    }

    // MARK: Private

    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
}

// MARK: - TabBar_Previews

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
