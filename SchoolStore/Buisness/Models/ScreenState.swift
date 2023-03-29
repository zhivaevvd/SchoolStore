//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public enum ScreenState: Equatable {
    case showPlaceholder(PlaceholderConfig)
    case showLoader
    case showContent
}
