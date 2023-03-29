//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public enum PlaceholderDefault {
    public static func emptyCatalog(_ buttonAction: (() -> Void)?) -> PlaceholderConfig {
        PlaceholderConfig(
            icon: Asset.imagePlaceholder.swiftUIImage,
            title: L10n.Catalog.Empty.title,
            subtitle: L10n.Catalog.Empty.subtitle,
            buttonTitle: L10n.Catalog.Empty.button.uppercased(),
            buttonAction: buttonAction
        )
    }
}
