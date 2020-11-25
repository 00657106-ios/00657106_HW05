//
//  DesireRow.swift
//  00657106_HW05
//
//  Created by User13 on 2020/11/18.
//

import SwiftUI

struct DesireRow: View {
    var desire: Desire
    
    var body: some View {
        HStack {
            Text(desire.name)
            Spacer()
            Text("\(desire.cost) $")
            Image(systemName: desire.trueHeart ? "heart.fill" : "heart")
        }
        
    }
    
}

struct DesireRow_Previews: PreviewProvider {
    static var previews: some View {
        
        DesireRow(desire: Desire(name: "Fries", cost: 80, trueHeart: true))
            .previewLayout(.sizeThatFits)
            
    }
}
