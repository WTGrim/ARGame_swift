//
//  NewShip.swift
//  ARGame_swift
//
//  Created by Dwt on 2017/10/17.
//  Copyright © 2017年 Dwt. All rights reserved.
//


import ARKit
import SceneKit

extension ARSCNView{
    
    func addShip(){
        
        let ship = Ship()
        let x = 0.2
        let y = 0.3
        let z = -1.0
        
        ship.position = SCNVector3(x, y, z)
        self.scene.rootNode.addChildNode(ship)
    }
}
