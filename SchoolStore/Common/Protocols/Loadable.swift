//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

public protocol Loadable {
    var isLoading: Binding<Bool> { get set }
}
