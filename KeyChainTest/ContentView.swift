//
//  ContentView.swift
//  KeyChainTest
//
//  Created by 신상원 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
  @State
  var text: String = ""

  var body: some View {
    VStack(spacing: 20) {

      TextField(text: $text) {
      }
      .textFieldStyle(.roundedBorder)

      Button(
        action: {
          KeyChainManager.shared.save(
            .init(
              list: ["1", "2", "3"],
              name: "bran",
              index: 10
            )
          )
        },
        label: {
          Text("SAVE")
        }
      )

      Button(
        action: {
          print(KeyChainManager.shared.load())
        },
        label: {
          Text("LOAD")
        }
      )

      Button(
        action: {
          KeyChainManager.shared.remove()
        },
        label: {
          Text("DEL")
        }
      )


    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
