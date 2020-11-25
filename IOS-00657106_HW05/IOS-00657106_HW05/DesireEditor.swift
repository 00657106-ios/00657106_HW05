//
//  DesireEditor.swift
//  00657106_HW05
//
//  Created by User13 on 2020/11/18.
//

import Foundation

import SwiftUI

struct DesireEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var editDesireIndex: Int?
    var desiresData: DesiresData
    @State private var name = ""
    @State private var cost = 50
    @State private var trueHeart = true
    
    var body: some View {
        
        Form {
            TextField("物品名稱", text: $name)
            Stepper("價格 \(cost)", value: $cost, in: 10...10000,step:10)
            Toggle("迫切需求", isOn: $trueHeart)
        }
        
        .onAppear(perform: {
            if let editDesireIndex = editDesireIndex {
                let editDesire = desiresData.desires[editDesireIndex]
                name = editDesire.name
                cost = editDesire.cost
                trueHeart = editDesire.trueHeart
            }
        })
        .navigationBarTitle(editDesireIndex == nil ? "Add new desire" : "Edit desire")
        .toolbar(content: {
            ToolbarItem {
                Button("Save") {
                    let desire = Desire(name: name, cost: cost, trueHeart: trueHeart)
                    if let editDesireIndex = editDesireIndex {
                        desiresData.desires[editDesireIndex] = desire
                    } else {
                        desiresData.desires.insert(desire, at: 0)

                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        })
        
    }
}

struct DesireEditor_Previews: PreviewProvider {
    static var previews: some View {
        DesireEditor(desiresData: DesiresData())
    }
}


