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
        let x = (-0.5).random(end: 0.5)//产生-0.5到0.5的随机数
        let y = (-0.5).random(end: 0.5)
        
        ship.position = SCNVector3(x, y, -1)
        self.scene.rootNode.addChildNode(ship)
    }
}


extension Double{
    
    func random(end:Double) -> Float {
        
        let factor = Double(arc4random()) / Double(UInt32.max)
        return Float(end - factor * (end  - self))
    }
}
