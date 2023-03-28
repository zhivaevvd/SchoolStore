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

    @Published public var isLoading: Bool = false

    @Published public var placeholderConfig: PlaceholderConfig?

    public func onItemTap() {
        router.push(.productCard)
    }

    public func buyDidTap() {
        print("go to buy screen")
    }

    // MARK: Private

    private let router: Router

    private func fetchItems() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isLoading = false
            // self?.items = CatalogItem.mock
            self?.placeholderConfig = PlaceholderDefault.emptyCatalog {
                self?.fetchItems()
            }
        }
    }
}
