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
        removeNodeDynamic(node: contact.nodeB, isExplode: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.removeNodeDynamic(node: contact.nodeA, isExplode: true)
            self.arscnView.addShip()
        }
        
    }
    
    func removeNodeDynamic(node : SCNNode, isExplode : Bool)  {
        
        playSound(of: .collision)
        
        if isExplode {
            playSound(of: .explosion)
            let ps = SCNParticleSystem(named: "explosion", inDirectory: nil)
            let psNode = SCNNode()
            psNode.addParticleSystem(ps!)
            arscnView.scene.rootNode.addChildNode(psNode)
        }
        
        node.removeFromParentNode()
    }
}

