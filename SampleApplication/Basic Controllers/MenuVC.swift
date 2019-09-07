//
//  MenuVC.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import Firebase

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }
}
