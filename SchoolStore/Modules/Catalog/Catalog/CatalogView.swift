//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - CatalogView

public struct CatalogView: View {
    // MARK: Lifecycle

    public init(vm: CatalogVM) {
        self.vm = vm
    }

    // MARK: Public

    public var body: some View {
        if vm.isLoading {
            Spacer()
            LoaderView()
        } else if let phConfig = vm.placeholderConfig {
            PlaceholderView(config: phConfig)
        } else {
            List {
                ForEach(vm.items, id: \.id) { model in
                    CatalogItemView(model: model) {
                        vm.onItemTap()
                    } buyAction: {
                        vm.buyDidTap()
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .buttonStyle(.plain)
            .padding([.leading, .trailing], 16)
        }
    }

    // MARK: Private

    @ObservedObject private var vm: CatalogVM
}

// MARK: - CatalogView_Previews

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(vm: CatalogVM(router: Router()))
    }
}
