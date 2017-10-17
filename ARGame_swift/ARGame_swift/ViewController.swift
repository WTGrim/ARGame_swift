//
//  ViewController.swift
//  ARGame_swift
//
//  Created by Dwt on 2017/10/17.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController , ARSCNViewDelegate, SCNPhysicsContactDelegate{

    @IBOutlet weak var arscnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        arscnView.scene = scene
        arscnView.delegate = self
        arscnView.showsStatistics = true
        
        //启动完成后添加
        arscnView.addShip()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        config.isLightEstimationEnabled = true
        arscnView.session.run(config)
    }

    
    @IBAction func didTapScreen(_ sender: UITapGestureRecognizer) {
        //点击发射子弹
        arscnView.shotBullet()
    }
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        
        print("击中目标")
        contact.nodeA.removeFromParentNode()
        contact.nodeB.removeFromParentNode()
        arscnView.addShip()
        
        
    }

}

