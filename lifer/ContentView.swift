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

    @State var redPlayerLife: String
    @State var bluePlayerLife: String
    @State var rememberedStartingLife: String
    
    public init(startingLife: String) {
        _redPlayerLife = State(wrappedValue: startingLife)
        _bluePlayerLife = State(wrappedValue: startingLife)
        _rememberedStartingLife = State(wrappedValue: startingLife)
    }
    
    var body: some View {
        GeometryReader { geometry in
           VStack {
               VStack {
                   LifeCounter(lifeCount: self.$redPlayerLife, color: "red").frame(
                     maxWidth: .infinity,
                     maxHeight: geometry.size.height * 0.50
                  ).background(Color.red)
               }
               HStack {
                   Button {
                       self.redPlayerLife = rememberedStartingLife
                       self.bluePlayerLife = rememberedStartingLife
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
               }
               VStack {
                   LifeCounter(lifeCount: self.$bluePlayerLife, color: "blue").frame(
                     maxWidth: .infinity,
                     maxHeight: geometry.size.height * 0.50
                  ).background(Color.blue)
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
