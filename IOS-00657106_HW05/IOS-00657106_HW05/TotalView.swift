//
//  TotalView.swift
//  IOS-00657106_HW05
//
//  Created by User13 on 2020/11/25.
//

import SwiftUI

struct TotalView: View {
    @State private var trimEnd: CGFloat = 0
    @StateObject var desiresData = DesiresData()

    var body: some View {
        TabView{
                NavigationView{
                    DesireList()
                }.tabItem {Image(systemName: "house.fill"); Text("首頁") }
                NavigationView{
                    List{
                    PieChartView(percentages: [25, 75])
                     .frame(width: 300, height: 300)
                    }.navigationTitle("迫切需求百分比")
                }.tabItem {Image(systemName: "heart.fill"); Text("需求") }
                
                NavigationView{
                    List{
                    ZStack {
                     Circle()
                     .stroke(Color.red, lineWidth: 20)

                        Circle()
                         .trim(from: 0, to: trimEnd)
                         .stroke(Color.blue, style: StrokeStyle(lineWidth: 20,
                        lineCap: .round))
                         .frame(width: 300, height: 300)
                         .animation(.linear(duration: 2))
                         .onAppear {
                         trimEnd = 0.75
                         }
                     }.frame(width: 300, height: 300)
                    }.navigationTitle("花費金額百分比")
                     
                }.tabItem {Image(systemName: "star.fill"); Text("剩餘金額") }

            
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView()
    }
}
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
