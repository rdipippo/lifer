//
//  LifeCounter.swift
//  lifer
//
//  Created by Richard DiPippo on 4/9/22.
//

import SwiftUI

struct LifeCounter: View {
    var lifeCount: Binding<String>
    @State var rememberedLifeCount: String
    var color: String
    
    public init(lifeCount: Binding<String>, color: String) {
        self.lifeCount = lifeCount
        self.color = color
        _rememberedLifeCount = State(wrappedValue: "")
    }
    
    var body: some View {
        VStack {
            Button {
                self.lifeCount.wrappedValue = String(Int(self.lifeCount.wrappedValue)! + 1)
            } label: {
                Image(systemName: "arrow.up")
            }.foregroundColor(Color.white)
                .disabled(lifeCount.wrappedValue == "")
                .accessibilityIdentifier(self.color + "LifeUp")

            TextField("", text: lifeCount, onEditingChanged: { (editing) in
                if editing {
                    self.rememberedLifeCount = self.lifeCount.wrappedValue
                    self.lifeCount.wrappedValue = ""
                } else if (self.lifeCount.wrappedValue == "") {
                    self.lifeCount.wrappedValue = self.rememberedLifeCount
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
              .accessibilityIdentifier(self.color + "Life")
              
            Button {
                self.lifeCount.wrappedValue = String(Int(self.lifeCount.wrappedValue)! - 1)
            } label: {
                Image(systemName: "arrow.down")
            }.foregroundColor(Color.white)
                .disabled(lifeCount.wrappedValue == "")
                .accessibilityIdentifier(self.color + "LifeDown")
        }
    }
}
