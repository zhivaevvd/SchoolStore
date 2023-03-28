//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public struct NavigationBarConfig {
    // MARK: Lifecycle

    public init(title: String, displayType: DisplayType, contentView: any View, backAction: (() -> Void)? = nil) {
        self.title = title
        self.displayType = displayType
        self.contentView = contentView
        self.backAction = backAction
    }

    // MARK: Public

    public enum DisplayType: Equatable {
        case inline
        case largeTitle
    }

    public let title: String
    public let displayType: DisplayType
    public let contentView: any View
    public let backAction: (() -> Void)?
}
