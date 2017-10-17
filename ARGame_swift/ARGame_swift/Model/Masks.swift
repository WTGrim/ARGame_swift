//
//  Masks.swift
//  ARGame_swift
//
//  Created by Dwt on 2017/10/17.
//  Copyright © 2017年 Dwt. All rights reserved.
//



struct Masks: OptionSet {
    
    let rawValue: Int
    static let ship = Masks(rawValue: 1 << 0)
    static let bullet = Masks(rawValue: 1 << 1)
}
