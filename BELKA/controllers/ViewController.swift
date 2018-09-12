//
//  ViewController.swift
//  BELKA
//
//  Created by Yaroslav Tsepkov on 05.08.2018.
//  Copyright © 2018 Yaroslav Tsepkov. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request("http://jsonplaceholder.typicode.com/posts").responseJSON { response in
            print(response)
        }
        print("viewDidLoad ended")
    }
 
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        guard let url = URL(string: "http://85.117.155.231:3000/user/") else { return }
        let parametrs = [
            "email": "user@mail.ru",
            "password": "ilovecats",
            "method": "register",
            "seed": "c52gk12l"
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.data(withJSONObject: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
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

