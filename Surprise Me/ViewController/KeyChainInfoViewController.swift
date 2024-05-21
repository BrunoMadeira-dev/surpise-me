//
//  KeyChainInfoViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 21/05/2024.
//

import Foundation
import Security

class KeyChainInfoViewController {
    
    func saveCredentials(username: String, password: String) -> Bool {
        guard let passwordData = password.data(using: .utf8),
              let usernameData = username.data(using: .utf8) else { return false }
        
        let usernameQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.bruno.username",
            kSecValueData as String: usernameData
        ]
        
        SecItemDelete(usernameQuery as CFDictionary)
        let usernameStatus = SecItemAdd(usernameQuery as CFDictionary, nil)
        
        let passwordQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.bruno.password",
            kSecValueData as String: passwordData
        ]
        
        SecItemDelete(passwordQuery as CFDictionary)
        let passwordStatus = SecItemAdd(passwordQuery as CFDictionary, nil)
        
        return usernameStatus == errSecSuccess && passwordStatus == errSecSuccess
    }
    
    func retrieveCredentials() -> (username: String, password: String)? {
        // Retrieve username
        let usernameQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.bruno.username",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var usernameItem: CFTypeRef?
        let usernameStatus = SecItemCopyMatching(usernameQuery as CFDictionary, &usernameItem)
        
        // Retrieve password
        let passwordQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.bruno.password",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var passwordItem: CFTypeRef?
        let passwordStatus = SecItemCopyMatching(passwordQuery as CFDictionary, &passwordItem)
        
        guard usernameStatus == errSecSuccess, let usernameData = usernameItem as? Data, let username = String(data: usernameData, encoding: .utf8),
              passwordStatus == errSecSuccess, let passwordData = passwordItem as? Data, let password = String(data: passwordData, encoding: .utf8) else {
            return nil
        }
        
        return (username, password)
    }
}
