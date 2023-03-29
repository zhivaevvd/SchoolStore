//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public final class CatalogVM: ObservableObject {
    // MARK: Lifecycle

    public init(router: Router) {
        self.router = router
        fetchItems()
    }

    // MARK: Public

    @Published public var items: [CatalogItem] = []

    @Published public var screenState: ScreenState = .showLoader

    public func onItemTap() {
        router.push(.productCard)
    }

    public func buyDidTap() {
        print("go to buy screen")
    }

    // MARK: Private

    private let router: Router

    private func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.screenState = .showPlaceholder(PlaceholderDefault.emptyCatalog {
                self?.refresh()
            })
        }
    }

    private func refresh() {
        screenState = .showLoader

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.items = CatalogItem.mock
            self?.screenState = .showContent
        }
    }
}
