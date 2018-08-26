//
//  socket.swift
//  BELKA
//
//  Created by Yaroslav Tsepkov on 23.08.2018.
//  Copyright © 2018 Yaroslav Tsepkov. All rights reserved.
//

import Foundation
import SocketIO

let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
let socket = manager.defaultSocket

socket.on(clientEvent: .connect) {data, ack in
    print("socket connected")
}

socket.on("currentAmount") {data, ack in
    guard let cur = data[0] as? Double else { return }
    
    socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
        socket.emit("update", ["amount": cur + 2.50])
    }
    
    ack.with("Got your currentAmount", "dude")
}

socket.connect()

// swift-tools-version:4.0


