//
//  DesireList.swift
//  00657106_HW05
//
//  Created by User13 on 2020/11/18.
//

import SwiftUI

struct DesireList: View {
    @AppStorage("name") var name: String = ""
    @StateObject var desiresData = DesiresData()
    @State private var showEditDesire = false
    
    var body: some View {
        NavigationView {
            List {
                VStack{
                    
                    TextField("請輸入名稱", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.asciiCapable)
                        .padding()
                    Text("Welcome, \(name)!")
                }
                Button("save") {
                    self.name = name
                }
                ForEach(desiresData.desires.indices, id: \.self) { (index) in
                    
                    NavigationLink(
                        destination: DesireEditor( editDesireIndex: index, desiresData: desiresData),
                        label: {
                            DesireRow(desire: desiresData.desires[index])
                        })
                    
                }
                .onDelete(perform: { indexSet in
                    desiresData.desires.remove(atOffsets: indexSet)
                })
                
            }
            .navigationTitle("慾望清單")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showEditDesire = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                        
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            })
            .sheet(isPresented: $showEditDesire, content: {
                NavigationView {
                    DesireEditor(desiresData: desiresData)
                }
            })
        }
    }
}

struct DesireList_Previews: PreviewProvider {
    static var previews: some View {
        DesireList()
    }
}

