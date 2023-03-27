//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - LoadableButton

public struct LoadableButton: View {
    // MARK: Lifecycle

    public init(style: LoadableButtonStyle) {
        self.style = style
    }

    // MARK: Public

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .foregroundColor(style.bgColor)

            if style.isLoading.wrappedValue {
                ProgressView()
                    .tint(style.titleColor)
            } else {
                Text(style.title)
                    .font(.title3.bold())
                    .foregroundColor(style.titleColor)
            }
        }
        .onTapGesture {
            guard !style.isLoading.wrappedValue else { return }
            style.action?()
        }
        .frame(maxWidth: .infinity)
        .frame(height: style.height)
    }

    // MARK: Private

    private let style: LoadableButtonStyle
}

// MARK: - LoadableButton_Previews

struct LoadableButton_Previews: PreviewProvider {
    static var previews: some View {
        LoadableButton(style: LoadableButtonStyles.blue46(title: "Voiti", isLoading: .constant(true), action: {
            print("sss")
        }))
    }
}
