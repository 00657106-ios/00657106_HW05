//
//  charView.swift
//  IOS-00657106_HW05
//
//  Created by User13 on 2020/11/25.
//

import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
        
    }
}
struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }
    var body: some View {
        ZStack {
            ForEach(angles.indices) { (index) in
                if index == angles.count - 1 {
                    PieChart(startAngle: angles[index],
                             endAngle: .zero)
                        .fill(Color.red)
                } else {
                    PieChart(startAngle: angles[index],
                             endAngle: angles[index+1])
                        .fill(Color.blue)
                }
            }
        }
    }
}
