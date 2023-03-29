//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - CatalogItemView

public struct CatalogItemView: View {
    // MARK: Public

    public let model: CatalogItem
    public var onTapAction: (() -> Void)?
    public var buyAction: (() -> Void)?

    public var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                CatalogItemAvatarView(stringUrl: model.imageUrl)

                VStack(alignment: .leading, spacing: 48) {
                    nameView
                    priceView
                }
            }

            Rectangle()
                .foregroundColor(Asset.separator.swiftUIColor)
                .frame(height: 1)
        }
        .onTapGesture {
            onTapAction?()
        }
    }

    // MARK: Private

    @ViewBuilder
    private var nameView: some View {
        VStack(alignment: .leading) {
            Text(model.name)
                .font(.headline)
                .foregroundColor(Asset.textPrimary.swiftUIColor)
                .lineLimit(2)

            Text(model.city)
                .font(.subheadline)
                .foregroundColor(Asset.textSecondary.swiftUIColor)
        }
    }

    @ViewBuilder
    private var priceView: some View {
        HStack {
            Text(String(model.cost))

            Spacer()

            Button {
                buyAction?()
            } label: {
                HStack(spacing: 4) {
                    Image(asset: Asset.itemAddToCart)
                        .resizable()
                        .frame(width: 16, height: 16)

                    Text(L10n.Catalog.buy)
                        .tint(Asset.navBlue.swiftUIColor)
                        .font(.subheadline)
                }
            }
        }
    }
}

// MARK: - CatalogItemView_Previews

struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView(
            model:
            CatalogItem(
                imageUrl: "https://s3-alpha-sig.figma.com/img/2703/f5de/847e2956c1c1dcdb5d1613758dd4750e?Expires=1681084800&Signature=nuu1WxdozhWCHgJNT82iO10rKXolx08mAiGY32-DLuS~NGTNvbU1Q3EzihVZh1fyHr72GJFn2BFAlwQfcQCfYdyYEjeJZgIv2S45Vr2zoU1bJ5VYqlfctfQBLyC7yDpIoa3vraT-1002uja9Cj65tRbrPDjM5BlRczFS7SVssBfD07xoDhXtZk17z3wWC3cSIIjs4pCRiLKW0H73iU3U2Wf8mebXjP84wzvpGDbYVjF-D8UCIoeJvY2~xPUxo9a5BRf0OGIS8XcvnfDwtACKs4tv1FEPau-kjvLpoGpM4AeQhDehnej7ahaOaswMdp4CT~zeEc5J1-6oEEyRpcnTFg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                name: "Futbolka",
                city: "Saransk",
                cost: "9 000 ₽",
                id: "test"
            )
        )
    }
}
