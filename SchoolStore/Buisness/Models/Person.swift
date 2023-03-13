//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public struct Person {
    // MARK: Lifecycle

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    // MARK: Public

    public static let mock = Person(id: "123", name: "Oleg Petrov")

    public let id: String
    public let name: String
}
