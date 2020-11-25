//
//  DesiresData.swift
//  00657106_HW05
//
//  Created by User13 on 2020/11/18.
//

import Foundation
import SwiftUI


class DesiresData: ObservableObject {
    @AppStorage("desires") var desiresData: Data?
    
    @Published var desires = [Desire]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(desires)
                desiresData = data
            } catch {
            }
        }
      
    }
   init() {
        if let loversData = desiresData {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Desire].self,from: loversData) {
                desires = decodedData
            }
        }
    }
}
