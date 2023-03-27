//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public enum LoadableButtonStyles {
    public static func blue46(title: String, isLoading: Binding<Bool>, action: (() -> Void)?) -> LoadableButtonStyle {
        LoadableButtonStyle(
            title: title,
            bgColor: Asset.navBlue.swiftUIColor,
            titleColor: Asset.white.swiftUIColor,
            cornerRadius: 8,
            height: 46,
            isLoading: isLoading,
            action: action
        )
    }
}
