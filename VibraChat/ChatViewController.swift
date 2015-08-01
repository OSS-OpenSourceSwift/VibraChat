//
//  ChatViewController.swift
//  VibraChat
//
//  Created by JJ Garzella on 8/1/15.
//  Copyright (c) 2015 JMGSE. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ChatViewController: UIViewController, MCSessionDelegate {

    var session: MCSession!
    
    override func viewDidLoad() {
        if session == nil {
            println("This could be bad...")
        }
    }
    
    func sendMessage(message: String) {
        let messageAsData = message.dataUsingEncoding(NSUTF8StringEncoding)
        session.sendData(messageAsData, toPeers:session.connectedPeers, withMode:.Reliable, error: nil)
    }
    
    func sendVibrate() {
        for peer in session.connectedPeers as! [MCPeerID] {
            session.sendResourceAtURL(NSURL(), withName: "Vibration", toPeer: peer) {error in println(error)}
        }
    }
    
    // session delegate
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
            
        // DISPLAY MESSAGE
        
            
    }
    
    func session(session: MCSession!,
             peer peerID: MCPeerID!,
    didChangeState state: MCSessionState) {
        // LOG SOMETHING
        
    }
    
    func session(session: MCSession!,
        didReceiveStream stream: NSInputStream!,
        withName streamName: String!,
        fromPeer peerID: MCPeerID!) {
    
    }
    
    // UNUSED - Boilerplate code
    func session(session: MCSession!,
didFinishReceivingResourceWithName resourceName: String!,
         fromPeer peerID: MCPeerID!,
          atURL localURL: NSURL!,
         withError error: NSError!) {}
    func session(session: MCSession!,
didStartReceivingResourceWithName resourceName: String!,
         fromPeer peerID: MCPeerID!,
   withProgress progress: NSProgress!) {}

}
