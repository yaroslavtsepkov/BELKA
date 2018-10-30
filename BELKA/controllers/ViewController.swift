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

class ViewController: UIViewController{
    var manager:SocketManager!
    var swiftSocket: SocketIOClient!
    let methodregister = [
        "email":"dimasblrok@gmail.com",
        "password": "123",
        "seed":"qrstuC456oK",
        "method":"register"
    ]
    
    let authdic = [
            "login":"sblrok",
            "password": "123",
            "module":"accounts",
            "method":"auth"
        ]
    
    /*let yeelightdic : [String: Any] = ["method": "send",
        "email":"dimasblrok@gmail.com",
        "password":"qrstuC456oK",
        "token":"box",
        "params":
        [
            "type":"socket.s20",
            "module": "device",
            "method": "find",
            "login": "sblrok",
            "password": "123",
            "type":"light.yeelight"
        ]
    ]
    
    let add: [String: Any] = [
        "address": "socket.s20",
        "type": "light.yeelight",
        "module": "device",
        "method": "add"
    ]
    */
    let config : [String: Any] = ["log": true,
                                  "compress": true,
                                  "forcePolling": true,
                                  "forceNew": true]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    func addSocketHandlers() {
        swiftSocket.on("response", callback: { data, ack in
            print(data)
        }
    )}
    func ConnectToSocket() {
        manager = SocketManager(socketURL: URL(string: "http://mybelka.ru:3000")!, config: config)
        swiftSocket = manager.socket(forNamespace: "/user")
        
        swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            print("socket connected")
            self.swiftSocket.emit("request", self.methodregister)
            
        }
        
        swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            self.swiftSocket.emit("request", self.authdic)
            print("auth ok")
        }
        
      /*  swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            self.swiftSocket.emit("request", self.yeelightdic)
            print("auth ok")
        }
        
        swiftSocket.on(clientEvent: .connect) {data, ack in
            print(data)
            self.swiftSocket.emit("request", self.add)
            print("auth ok")
        }*/
        
        
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
        swiftSocket.connect()
    }

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBAction func signUpAction(_ sender: Any) {
        
        //swiftSocket.emit("request", dic)
      
        /*swiftSocket.emitWithAck("request", dic).timingOut(after: 0) {data in
            self.swiftSocket.emit("response", "hello")
        }*/
        
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

