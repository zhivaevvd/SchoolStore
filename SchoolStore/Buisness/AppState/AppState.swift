//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

import Foundation

//public final class AppState: ObservableObject {
//    @Published public var accessToken: String?
//    @Published public var person: Person?
//}

@propertyWrapper
public struct UserDefault<T: Codable> {
    public var key: String
    public var wrappedValue: T? {
        get {
            if let data = UserDefaults.standard.object(forKey: key) as? Data {
                return try? JSONDecoder().decode(T.self, from: data)
            }
            return nil
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}

public class AppState: ObservableObject {
    @UserDefault(key: "accessToken") var accessToken: String?
    @UserDefault(key: "person") var person: Person?
}
