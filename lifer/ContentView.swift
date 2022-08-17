//
//  ContentView.swift
//  LIfer
//
//  Created by Richard DiPippo on 3/8/22.
//

import SwiftUI
import Introspect
import Foundation

struct ContentView: View {
    @Environment(\.dismiss)  var dismiss
    @State var rememberedStartingLife: [String]
    var rememberedStartingLife2: [String]
    
    var colors = [Color.red, Color.blue, Color.green, Color.yellow, Color.purple, Color.gray]
    var numPlayers = 2
    var startingLife = "0"
    
    public init(startingLife: String, numPlayers: String) {
        self.numPlayers = Int(numPlayers)!
        self.startingLife = startingLife
        _rememberedStartingLife = State(wrappedValue: [String](repeating: startingLife, count: Int(numPlayers)!))
        self.rememberedStartingLife2 = [String](repeating: startingLife, count: Int(numPlayers)!)
    }
        
    var body: some View {

        GeometryReader { geometry in
           VStack {
               HStack {
                   Button {
                       // we  need to maintain a copy of the array because we can't reassign the state array.
                       rememberedStartingLife.removeAll()
                       rememberedStartingLife = rememberedStartingLife + rememberedStartingLife2
                   } label: {
                       Image(systemName: "arrow.clockwise")
                   }.foregroundColor(Color.black)
                    .accessibilityIdentifier("resetLife")
                   
                   Button {
                      dismiss()
                   } label: {
                       Image(systemName: "return")
                   }.foregroundColor(Color.black)
                    .accessibilityIdentifier("goBack")
               }.frame(maxWidth: .infinity,
                       maxHeight: geometry.size.height * 0.1)
               VStack {
                   ForEach(0..<numPlayers, id: \.self) {player in
                       LifeCounter(lifeCount: self.$rememberedStartingLife[player], testPrefix: player).frame(
                         maxWidth: .infinity,
                         maxHeight: geometry.size.height * 0.45
                      ).background(colors[player])
                   }
               }
           }
        }
    }
}

extension  UITextField {
   @objc func addDoneButton(textField: UITextField) {
      let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
      let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
      toolBar.items = [flexButton, doneButton]
      toolBar.setItems([flexButton, doneButton], animated: true)
      textField.inputAccessoryView = toolBar
   }
    
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}
