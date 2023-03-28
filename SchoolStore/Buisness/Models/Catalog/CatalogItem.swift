//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public struct CatalogItem: Hashable {
    // MARK: Lifecycle

    public init(imageUrl: String, name: String, city: String, cost: Int, id: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.city = city
        self.cost = cost
        self.id = id
    }

    // MARK: Public

    public static let mock: [CatalogItem] = [
        CatalogItem(
            imageUrl: "https://s3-alpha-sig.figma.com/img/f679/14e8/6acf0eca5f8a53254ece90d97c232596?Expires=1681084800&Signature=fWpP-53fbPOl9XodYmc6UNJuSycM21XWllH2uSrlr2pxdFNEbdaLtpHDsvv-q2YnAZKL4xtKU9CE769MjZkbYDIYm4NULCCxOeaHYd05lBQtn5Qe~4dEb5spuRyDylufCg1RIUBfXrxVGV6vmZxQ7aOjhiLxmj~~zXzT8HfQMHGR6YokWQ~4hJdvxzO~ysigTF348ht~DHWGEqJk7M-FuDo09S~aZvFLy7WmPusq8iDBc1U2dZrtL93bcckfOz5DNky~U~vM0H7ZIpAey3bZiNM39f038jp4M-NT69ZjXkxL0PUq5ZwbDHg0WKGXTppAxG10efONsjayo3TW3PsbQQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
            name: "Futbolka",
            city: "Saransk",
            cost: 9000,
            id: "sad1"
        ),

        CatalogItem(
            imageUrl: "https://s3-alpha-sig.figma.com/img/2703/f5de/847e2956c1c1dcdb5d1613758dd4750e?Expires=1681084800&Signature=nuu1WxdozhWCHgJNT82iO10rKXolx08mAiGY32-DLuS~NGTNvbU1Q3EzihVZh1fyHr72GJFn2BFAlwQfcQCfYdyYEjeJZgIv2S45Vr2zoU1bJ5VYqlfctfQBLyC7yDpIoa3vraT-1002uja9Cj65tRbrPDjM5BlRczFS7SVssBfD07xoDhXtZk17z3wWC3cSIIjs4pCRiLKW0H73iU3U2Wf8mebXjP84wzvpGDbYVjF-D8UCIoeJvY2~xPUxo9a5BRf0OGIS8XcvnfDwtACKs4tv1FEPau-kjvLpoGpM4AeQhDehnej7ahaOaswMdp4CT~zeEc5J1-6oEEyRpcnTFg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
            name: "Futbolka",
            city: "Saransk",
            cost: 9000,
            id: "oocbe--3423-4"
        ),

        CatalogItem(
            imageUrl: "https://s3-alpha-sig.figma.com/img/ef7c/c0a1/8bdb9cf73142a5652dae065d45f69641?Expires=1681084800&Signature=myHtaB6CxqTuNuXYJgsi7LcaEwuwXk~3bgJvZlQhpI7KT-yTm7I1tG6Idh3ZsFgIcw880ztvFX88LffHKrICmHvEDhNI0ZJk3H2CprN8INl6rFjXr2nmQQ7OVUP-VTc6SmyquOGJtbkvJU6riIy7iwum5Q4nNHI~4lTs-68lH81wvn-YJ-LFO350A3afscAZRi7E3Jd7CvRWmOOTcAOK7eKb0wqnGuCMk0sIv2Fo0b~35giALAkeU2YMbtE1Pov1KKXKL~hr8~XMxkb6LHXUKJ5g~M-ijI9Chag836sBkbegpXAnTZIiLiVyojdWIHEjtF9jlnyrHTT6WjPct7mjbA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
            name: "Futbolka",
            city: "Saransk",
            cost: 9000,
            id: "ooewhh23"
        ),

        CatalogItem(
            imageUrl: "https://s3-alpha-sig.figma.com/img/f679/14e8/6acf0eca5f8a53254ece90d97c232596?Expires=1681084800&Signature=fWpP-53fbPOl9XodYmc6UNJuSycM21XWllH2uSrlr2pxdFNEbdaLtpHDsvv-q2YnAZKL4xtKU9CE769MjZkbYDIYm4NULCCxOeaHYd05lBQtn5Qe~4dEb5spuRyDylufCg1RIUBfXrxVGV6vmZxQ7aOjhiLxmj~~zXzT8HfQMHGR6YokWQ~4hJdvxzO~ysigTF348ht~DHWGEqJk7M-FuDo09S~aZvFLy7WmPusq8iDBc1U2dZrtL93bcckfOz5DNky~U~vM0H7ZIpAey3bZiNM39f038jp4M-NT69ZjXkxL0PUq5ZwbDHg0WKGXTppAxG10efONsjayo3TW3PsbQQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
            name: "Futbolka",
            city: "Saransk",
            cost: 9000,
            id: "skken6"
        ),
    ]

    public let imageUrl: String
    public let name: String
    public let city: String
    public let cost: Int
    public let id: String
}
