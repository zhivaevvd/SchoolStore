//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import SwiftUI

// MARK: - LoaderView

public struct LoaderView: View {
    // MARK: Public

    public var body: some View {
        Image(asset: Asset.blueLoader)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false)) {
                    isLoading.toggle()
                }
            }
    }

    // MARK: Private

    @State private var isLoading: Bool = false
}

// MARK: - LoaderView_Previews

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
