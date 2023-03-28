//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - PlaceholderView

public struct PlaceholderView: View {
    // MARK: Lifecycle

    public init(config: PlaceholderConfig) {
        self.config = config
    }

    // MARK: Public

    public var body: some View {
        Rectangle()
            .foregroundColor(Asset.placeholderBackground.swiftUIColor)
            .overlay {
                VStack(spacing: 24) {
                    config.icon
                    messageView
                    buttonView
                }
            }
    }

    // MARK: Private

    private let config: PlaceholderConfig

    private var messageView: some View {
        VStack(spacing: 4) {
            Text(config.title)
                .font(.headline)
                .foregroundColor(Asset.textSecondary.swiftUIColor)
                .fontWeight(.bold)

            if let subtitle = config.subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Asset.textSecondary.swiftUIColor)
            }
        }
    }

    @ViewBuilder
    private var buttonView: some View {
        if let buttonTitle = config.buttonTitle {
            Button {
                config.buttonAction?()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Asset.navBlue.swiftUIColor)
                        .frame(width: 89, height: 28)

                    Text(buttonTitle.uppercased())
                        .foregroundColor(Asset.white.swiftUIColor)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

// MARK: - PlaceholderView_Previews

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(config: PlaceholderDefault.emptyCatalog {
            print("Test")
        })
    }
}
