//
// SchoolStore
// Copyright © 2023 Vladislav Zhivaev. All rights reserved.
//

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - L10n

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
    public enum Auth {
        /// Войти
        public static let action = L10n.tr("Localizable", "auth.action", fallback: "Войти")
        /// Localizable.strings
        ///   SchoolStore
        ///
        ///   Created by Headdds and hands on 07.02.2023.
        public static let login = L10n.tr("Localizable", "auth.login", fallback: "Логин")
        /// Пароль
        public static let password = L10n.tr("Localizable", "auth.password", fallback: "Пароль")
    }
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// MARK: - BundleToken

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
