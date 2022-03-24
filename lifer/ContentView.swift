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
    @State var rememberedRedPlayerLife: String
    @State var bluePlayerLife: String
    @State var rememberedBluePlayerLife: String
    @State var rememberedStartingLife: String
    
    public init(startingLife: String) {
        _redPlayerLife = State(wrappedValue: startingLife)
        _bluePlayerLife = State(wrappedValue: startingLife)
        _rememberedRedPlayerLife = State(wrappedValue: startingLife)
        _rememberedBluePlayerLife = State(wrappedValue: startingLife)
        _rememberedStartingLife = State(wrappedValue: startingLife)
    }
    
    var body: some View {
        GeometryReader { geometry in
           VStack {
               VStack {
                  VStack {
                      Button {
                          self.redPlayerLife = String(Int(self.redPlayerLife)! + 1)
                      } label: {
                          Image(systemName: "arrow.up")
                      }.foregroundColor(Color.white)
                       .disabled(redPlayerLife == "")

                      TextField("", text: $redPlayerLife, onEditingChanged: { (editing) in
                          if editing {
                             self.rememberedRedPlayerLife = self.redPlayerLife
                             self.redPlayerLife = ""
                          } else if (self.redPlayerLife == "") {
                             self.redPlayerLife = self.rememberedRedPlayerLife
                          }
                      }).frame(
                        maxWidth: 100,
                        maxHeight: 100
                      ).font(.largeTitle)
                       .introspectTextField { (textField) in
                          textField.addDoneButton(textField: textField)
                       }.background(Color.white).keyboardType(UIKeyboardType.numberPad)
                        .multilineTextAlignment(.center)
                        .cornerRadius(14)
                        .accessibilityIdentifier("redLife")
                        
                      Button {
                          self.redPlayerLife = String(Int(self.redPlayerLife)! - 1)
                      } label: {
                          Image(systemName: "arrow.down")
                      }.foregroundColor(Color.white)
                       .disabled(redPlayerLife == "")
                  }.frame(
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
                   
                   Button {
                      dismiss()
                   } label: {
                       Image(systemName: "return")
                   }.foregroundColor(Color.black)
                    .accessibilityIdentifier("goBack")
               }
               VStack {
                  VStack {
                      Button {
                          self.bluePlayerLife = String(Int(self.bluePlayerLife)! + 1)
                      } label: {
                          Image(systemName: "arrow.up")
                      }.foregroundColor(Color.white)
                       .disabled(bluePlayerLife == "")
                      
                      TextField("", text: $bluePlayerLife, onEditingChanged: { (editing) in
                          if editing {
                             self.rememberedBluePlayerLife = self.bluePlayerLife
                             self.bluePlayerLife = ""
                          } else if (self.bluePlayerLife == "") {
                              self.bluePlayerLife = self.rememberedBluePlayerLife
                          }
                      }).frame(
                        maxWidth: 100,
                        maxHeight: 100
                      ).introspectTextField { (textField) in
                          textField.addDoneButton(textField: textField)
                       }.background(Color.white).keyboardType(UIKeyboardType.numberPad)
                          .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .cornerRadius(14)
                        .accessibilityIdentifier("blueLife")
                      
                      Button {
                          self.bluePlayerLife = String(Int(self.bluePlayerLife)! - 1)
                      } label: {
                          Image(systemName: "arrow.down")
                      }.foregroundColor(Color.white)
                       .disabled(bluePlayerLife == "")
                  }.frame(
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
