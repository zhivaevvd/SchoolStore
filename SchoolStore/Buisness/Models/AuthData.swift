//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

public struct AuthData {
    public let login: String
    public let password: String
    
    public static let mock = AuthData(login: "mass2014@yandex.ru", password: "opaopa21")
}
