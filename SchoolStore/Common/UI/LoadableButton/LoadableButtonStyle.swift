//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public struct LoadableButtonStyle: Loadable {
    // MARK: Lifecycle

    public init(
        title: String,
        bgColor: Color,
        titleColor: Color,
        cornerRadius: CGFloat,
        height: CGFloat,
        isLoading: Binding<Bool>,
        action: (() -> Void)?
    ) {
        self.title = title
        self.bgColor = bgColor
        self.titleColor = titleColor
        self.cornerRadius = cornerRadius
        self.height = height
        self.isLoading = isLoading
        self.action = action
    }

    // MARK: Public

    public let title: String
    public let bgColor: Color
    public let titleColor: Color
    public let cornerRadius: CGFloat
    public let height: CGFloat
    public var isLoading: Binding<Bool>
    public var action: (() -> Void)?
}
