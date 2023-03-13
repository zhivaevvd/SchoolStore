//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public final class AppState: ObservableObject {
    @Published public var accessToken: String?
    @Published public var person: Person?
}
