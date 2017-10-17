//
//  NewBullet.swift
//  ARGame_swift
//
//  Created by Dwt on 2017/10/17.
//  Copyright © 2017年 Dwt. All rights reserved.
//



import ARKit
import SceneKit

extension ARSCNView{
    
    func shotBullet() {
        
        let bullet = Bullet()
        let (dir, pos) = self.getUserVector()
        
        bullet.position = pos
        bullet.physicsBody?.applyForce(dir, asImpulse: true)//施加力的方向和是否脉冲
        self.scene.rootNode.addChildNode(bullet)
    }
    
    func getUserVector() -> (SCNVector3, SCNVector3) {
        
        if let currentFrame = self.session.currentFrame {
            
            let matrix = SCNMatrix4(currentFrame.camera.transform)
            let direction = SCNVector3(-matrix.m31, -matrix.m32, -matrix.m33)
            let position = SCNVector3(-matrix.m41, -matrix.m42, -matrix.m43)
            return (direction, position)
        }
        
        return (SCNVector3(0, 0, -1), SCNVector3(0, 0, -0.2))
    }
}
