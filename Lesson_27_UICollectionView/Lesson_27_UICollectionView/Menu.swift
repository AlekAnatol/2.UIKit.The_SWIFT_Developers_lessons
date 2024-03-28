//
//  Menu.swift
//  Lesson_27_UICollectionView
//
//  Created by Екатерина Алексеева on 31.05.2022.
//

import Foundation

struct Menu {
    let name: String?
    let imageName: String?
    let typeOfButton: buttonEnum
}


enum buttonEnum {
    case add
    case detail
}
