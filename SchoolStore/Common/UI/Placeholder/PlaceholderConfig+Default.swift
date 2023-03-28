//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public enum PlaceholderDefault {
    public static func emptyCatalog(_ buttonAction: (() -> Void)?) -> PlaceholderConfig {
        PlaceholderConfig(
            icon: Asset.imagePlaceholder.swiftUIImage,
            title: "Oshibka",
            subtitle: "dve stroki",
            buttonTitle: "obnovit",
            buttonAction: buttonAction
        )
    }
}
