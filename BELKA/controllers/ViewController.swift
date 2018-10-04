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

    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectToSocket()
        }
    
    func ConnectToSocket() {
        let config : [String: Any] = ["log": true,
                                      "compress": true,
                                      "forcePolling": true,
                                      "forceNew": true]
        
        manager = SocketManager(socketURL: URL(string: "http://mybelka.ru:3000/user")!, config: config)
        let defaultNamespaceSocket = manager.defaultSocket
        swiftSocket = manager.socket(forNamespace: "/user")
        
        
        swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            print("socket connected")
        }
        
        swiftSocket.on(clientEvent: .error) { (data, eck) in
            print(data)
            print("socket error")
        }
        
        swiftSocket.on(clientEvent: .disconnect) { (data, eck) in
            print(data)
            print("socket disconnect")
        }
        
        swiftSocket.on(clientEvent: SocketClientEvent.reconnect) { (data, eck) in
            print(data)
            print("socket reconnect")
        }
        
        swiftSocket.connect()
    }

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBAction func signUpAction(_ sender: Any) {
        ConnectToSocket()
        let data = [
        "email":"user@mail.ru",
        "password":"ilovecats",
        "method":"register",
        "seed":"dsfsdf"
        ]
        swiftSocket.emit("request", data)
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

