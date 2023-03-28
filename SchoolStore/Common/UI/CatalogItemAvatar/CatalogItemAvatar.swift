//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - CatalogItemAvatarView

public struct CatalogItemAvatarView: View {
    public let stringUrl: String
    public let width: CGFloat = 112
    public let height: CGFloat = 112

    public var body: some View {
        AsyncImage(url: URL(string: stringUrl)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Image(asset: Asset.imagePlaceholder)
                .resizable()
                .scaledToFill()
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - CatalogItemAvatar_Previews

struct CatalogItemAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemAvatarView(
            stringUrl: "https://s3-alpha-sig.figma.com/img/f679/14e8/6acf0eca5f8a53254ece90d97c232596?Expires=1681084800&Signature=fWpP-53fbPOl9XodYmc6UNJuSycM21XWllH2uSrlr2pxdFNEbdaLtpHDsvv-q2YnAZKL4xtKU9CE769MjZkbYDIYm4NULCCxOeaHYd05lBQtn5Qe~4dEb5spuRyDylufCg1RIUBfXrxVGV6vmZxQ7aOjhiLxmj~~zXzT8HfQMHGR6YokWQ~4hJdvxzO~ysigTF348ht~DHWGEqJk7M-FuDo09S~aZvFLy7WmPusq8iDBc1U2dZrtL93bcckfOz5DNky~U~vM0H7ZIpAey3bZiNM39f038jp4M-NT69ZjXkxL0PUq5ZwbDHg0WKGXTppAxG10efONsjayo3TW3PsbQQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
        )
    }
}
