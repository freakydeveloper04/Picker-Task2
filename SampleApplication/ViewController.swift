//
//  ViewController.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

            let db = Firestore.firestore()
            db.collection("user").getDocuments { (snapshot, error) in
            
            if error != nil{
                
                print(error as Any)
            }
            else{
                
                for document in snapshot!.documents{
                    
                    let name = document.data()["name"]
                    print(name as Any)
                    
                    let price = document.data()["price"]
                    print(price as Any)
                }
                
            }
        }
    }


}

