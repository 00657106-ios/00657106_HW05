//
//  Desire.swift
//  00657106_HW05
//
//  Created by User13 on 2020/11/18.
//

import SwiftUI

import Foundation

struct Desire: Codable  {
    let id = UUID()
    var name: String
    var cost: Int
    var trueHeart: Bool
}

