//
//  LifeCounter.swift
//  lifer
//
//  Created by Richard DiPippo on 4/9/22.
//

import SwiftUI
import Combine

struct LifeCounter: View {
    @Binding var lifeCount : String
    @State var testPrefix : Int
    
    var body: some View {
        var rememberedLifeCount : String = ""

        VStack {
            Button {
                var lifeCountAsInt = Int(self.lifeCount)
                self.lifeCount = String(lifeCountAsInt! + 1)
            } label: {
                Image(systemName: "arrow.up")
            }.foregroundColor(Color.white)
                .disabled(self.lifeCount == "")
                .accessibilityIdentifier(String(self.testPrefix) + "LifeUp")

            TextField("", text: $lifeCount, onEditingChanged: { (editing) in
                if editing {
                    rememberedLifeCount = String(self.lifeCount)
                    self.lifeCount = ""
                } else if (self.lifeCount == "") {
                    self.lifeCount = rememberedLifeCount
                }
            }).frame(
              maxWidth: 100,
              maxHeight: 100
            ).font(.largeTitle)
             .introspectTextField { (textField) in
                textField.addDoneButton(textField: textField)
             }.background(Color.white)
              .foregroundColor(Color.black)
              .keyboardType(UIKeyboardType.numberPad)
              .multilineTextAlignment(.center)
              .cornerRadius(14)
              .accessibilityIdentifier(String(self.testPrefix) + "Life")
              
            Button {
                var lifeCountAsInt = Int(self.lifeCount)
                self.lifeCount = String(lifeCountAsInt! - 1)
            } label: {
                Image(systemName: "arrow.down")
            }.foregroundColor(Color.white)
                .disabled(self.lifeCount == "")
                .accessibilityIdentifier(String(self.testPrefix) + "LifeDown")
        
            }
    }
}
