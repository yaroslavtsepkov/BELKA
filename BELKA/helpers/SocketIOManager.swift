//
//  SocketIOManager.swift
//  BELKA
//
//  Created by Yaroslav Tsepkov on 21/10/2018.
//  Copyright © 2018 Yaroslav Tsepkov. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    var socket = SocketManager(socketURL: URL(string: "http://mybelka.ru:3000/user")!)
    let methodregister = [
        "email":"dimasblrok@gmail.com",
        "password": "123",
        "seed":"qrstuC456oK",
        "method":"register"
    ]
    
    override init() {
        super.init()
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func register(){
        self.socket.emitAll("request", self.methodregister)
    }

}
