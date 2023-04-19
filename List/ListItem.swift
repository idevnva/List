//
//  ListItem.swift
//  List
//
//  Created by Владислав Новошинский on 19.04.2023.
//

import Foundation

struct ListItem: Identifiable {
    let id = UUID()
    var name: String
    var randomNumber = Int.random(in: 0..<100)
}
