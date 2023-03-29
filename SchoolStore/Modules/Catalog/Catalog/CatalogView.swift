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
        mainView
    }

    // MARK: Private

    @ObservedObject private var vm: CatalogVM

    @ViewBuilder
    private var mainView: some View {
        switch vm.screenState {
        case let .showPlaceholder(config):
            PlaceholderView(config: config)
        case .showLoader:
            Spacer()
            LoaderView()
        case .showContent:
            contentView
        }
    }

    private var contentView: some View {
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

// MARK: - CatalogView_Previews

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(vm: CatalogVM(router: Router()))
    }
}
