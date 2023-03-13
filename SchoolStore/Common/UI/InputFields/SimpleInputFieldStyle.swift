//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public struct SimpleInputFieldStyle {
    // MARK: Lifecycle

    public init(
        type: SimpleIputFieldType,
        placeholder: String = "",
        icon: Image?,
        text: Binding<String>
    ) {
        self.type = type
        self.placeholder = placeholder
        self.icon = icon
        _text = text
    }

    // MARK: Public

    public let type: SimpleIputFieldType
    public let placeholder: String
    public let icon: Image?
    @Binding public var text: String
}
