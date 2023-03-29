//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public struct PlaceholderConfig: Equatable {
    // MARK: Lifecycle

    public init(
        icon: Image,
        title: String,
        subtitle: String? = nil,
        buttonTitle: String? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }

    // MARK: Public

    public let icon: Image
    public let title: String
    public let subtitle: String?
    public let buttonTitle: String?
    public let buttonAction: (() -> Void)?

    public static func == (lhs: PlaceholderConfig, rhs: PlaceholderConfig) -> Bool {
        lhs.title == rhs.title && lhs.subtitle == rhs.subtitle && lhs.buttonTitle == rhs.buttonTitle && lhs.icon == rhs
            .icon
    }
}
