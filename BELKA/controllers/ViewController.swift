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

