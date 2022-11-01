//
//  KeyChainManager.swift
//  KeyChainTest
//
//  Created by 신상원 on 2022/11/01.
//

import Foundation

import SwiftKeychainWrapper

final class KeyChainManager {
  static let shared = KeyChainManager()

  private init() { }

  func save(_ list: TestData) {
    guard
      let data = try? PropertyListEncoder().encode(list)
    else {
      print("Encode Error")
      return
    }
    KeychainWrapper.standard[.burrito] = data
  }

  func load() -> TestData? {
    guard
      let data = KeychainWrapper.standard[.burrito] as Data?,
      let decodeData = try? PropertyListDecoder().decode(
        TestData.self,
        from: data
      )
    else {
      print("Decode Error")
      return nil
    }
    return decodeData
  }

  func remove() {
    KeychainWrapper.standard.remove(forKey: .burrito)
  }
}



extension KeychainWrapper.Key {
  static let burrito: KeychainWrapper.Key = "Burrito"
}


struct TestData: Codable, Equatable {
  var id: UUID = UUID()
  var list: [String]
  let name: String
  let index: Int
}


