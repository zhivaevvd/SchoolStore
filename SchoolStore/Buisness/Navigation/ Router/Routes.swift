//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public enum Route: Identifiable, Hashable {
    case auth
    case tabBar
    case productCard

    // MARK: Public

    public var id: String {
        switch self {
        case .auth:
            return "auth"
        case .tabBar:
            return "tabbar"
        case .productCard:
            return "productCard"
        }
    }
}
