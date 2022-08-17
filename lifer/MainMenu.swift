//
//  MainMenu.swift
//  LIfer
//
//  Created by Richard DiPippo on 3/11/22.
//

import SwiftUI

struct MainMenu: View {
    @State var startingLife : String = "20"
    @State var numPlayers = "2"
    @State var rememberedStartingLife = "20"
    @State var rememberedNumPlayers = "2"
    @State var gameStarted = false
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                Text("Starting Life").foregroundColor(Color.black).font(.largeTitle)
                
                TextField("", text: $startingLife, onEditingChanged: { (editing) in
                  if editing {
                     self.rememberedStartingLife = startingLife
                     self.startingLife = ""
                  } else if (self.startingLife == "") {
                     self.startingLife = self.rememberedStartingLife
                  }
                }).introspectTextField { (textField) in
                    textField.addDoneButton(textField: textField)
                }
                 .keyboardType(UIKeyboardType.numberPad)
                 .multilineTextAlignment(.center)
                 .textFieldStyle(.roundedBorder)
                 .frame(maxWidth: 100)
                 .accessibilityIdentifier("startingLife")
                 .focused($isFocused)
                
                Text("Number of Players").foregroundColor(Color.black).font(.largeTitle)
                
                TextField("", text: $numPlayers, onEditingChanged: { (editing) in
                  if editing {
                     self.rememberedNumPlayers = numPlayers
                     self.numPlayers = ""
                  } else if (self.numPlayers == "") {
                     self.numPlayers = self.rememberedNumPlayers
                  }
                }).introspectTextField { (textField) in
                    textField.addDoneButton(textField: textField)
                }
                 .keyboardType(UIKeyboardType.numberPad)
                 .multilineTextAlignment(.center)
                 .textFieldStyle(.roundedBorder)
                 .frame(maxWidth: 100)
                 .accessibilityIdentifier("numPlayers")
                 .focused($isFocused)
                
                  Button(action: {
                      self.isFocused = false
                      self.gameStarted = true
                  }) {
                    Text("Start Game").foregroundColor(Color.white).padding(14)
                  }.background(Color.blue).cornerRadius(14)
                   .fullScreenCover(isPresented: $gameStarted) {
                       ContentView(startingLife: self.$startingLife.wrappedValue, numPlayers: self.$numPlayers.wrappedValue)
                   }.disabled(self.startingLife == "")
            }.frame(maxWidth: .infinity, maxHeight: .infinity ).background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
       }
    }
}
