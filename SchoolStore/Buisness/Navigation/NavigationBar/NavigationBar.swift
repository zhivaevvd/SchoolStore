//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - NavigationBar

public struct NavigationBar: View {
    // MARK: Lifecycle

    public init(config: NavigationBarConfig) {
        self.config = config
    }

    // MARK: Public

    public var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(Asset.navBlue.swiftUIColor)
                .frame(maxWidth: .infinity, maxHeight: 88)
                .overlay {
                    if config.displayType == .largeTitle {
                        largeTitle
                    } else {
                        inlineTitle
                    }
                }

            AnyView(config.contentView)

            Spacer()
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: backButton)
        .ignoresSafeArea()
    }

    // MARK: Private

    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    private let config: NavigationBarConfig

    private var largeTitle: some View {
        HStack {
            Text(config.title)
                .font(.title.weight(.medium))
                .foregroundColor(Asset.white.swiftUIColor)
            Spacer()
        }
        .padding(.leading, 16)
        .padding(.top, 36)
    }

    private var inlineTitle: some View {
        Text(config.title)
            .font(.title3.weight(.medium))
            .foregroundColor(Asset.white.swiftUIColor)
            .padding(.top, 44)
    }

    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .tint(Asset.white.swiftUIColor)
        }
        .padding(.bottom, 10)
    }
}

// MARK: - NavigationBar_Previews

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(config: .init(
            title: L10n.Catalog.title,
            displayType: .inline,
            contentView: AnyView(Text("test"))
        ))
    }
}
