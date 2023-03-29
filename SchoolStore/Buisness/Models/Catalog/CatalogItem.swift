//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public struct CatalogItem: Hashable {
    // MARK: Lifecycle

    public init(imageUrl: String, name: String, city: String, cost: String, id: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.city = city
        self.cost = cost
        self.id = id
    }

    // MARK: Public

    public let imageUrl: String
    public let name: String
    public let city: String
    public let cost: String
    public let id: String
}
