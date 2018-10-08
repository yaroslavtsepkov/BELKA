//
//  ViewController.swift
//  BELKA
//
//  Created by Yaroslav Tsepkov on 05.08.2018.
//  Copyright © 2018 Yaroslav Tsepkov. All rights reserved.
//

import UIKit
import Alamofire
import SocketIO


class ViewController: UIViewController {
   var manager:SocketManager!
    
    var swiftSocket: SocketIOClient!
    let msg = "register"
    let dic = [
        "email":"user@mail.ru",
        "password":"ilovecats",
        "method":"register",
        "seed":"dsfsdf"
    ]
    let config : [String: Any] = ["log": true,
                                  "compress": true,
                                  "forcePolling": true,
                                  "forceNew": true]
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    func addSocketHandlers() {
        swiftSocket.on("response", callback: { data, ack in
            ack.with(1)
        }
    )}
    func ConnectToSocket() {
        manager = SocketManager(socketURL: URL(string: "http://mybelka.ru:3000")!, config: config)
        let defaultNamespaceSocket = manager.defaultSocket
        swiftSocket = manager.socket(forNamespace: "/user")
        
        
        swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            print("socket connected")
        }
        
        swiftSocket.on(clientEvent: .error) { (data, ack) in
            print(data)
            print("socket error")
        }
        
        swiftSocket.on(clientEvent: .disconnect) { (data, ack) in
            print(data)
            print("socket disconnect")
        }
        
        swiftSocket.on(clientEvent: SocketClientEvent.reconnect) { (data, ack) in
            print(data)
            print("socket reconnect")
        }
        swiftSocket.on("response", callback: {data, ack in
            
        })
        
        swiftSocket.connect()
    }

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBAction func signUpAction(_ sender: Any) {
        ConnectToSocket()
        self.swiftSocket.emit("request", dic)
        
    }
    @IBAction func loginAction(_ sender: Any) {
        
    }
    @IBAction func ButtonResetPassword(_ sender: Any) {
    }
    @IBAction func buttonEnter(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

