//
//  SellVC.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SellVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTxt.delegate = self
        priceTxt.delegate = self

    }

    func saveFIRData(){
        
        let name = nameTxt.text
        let price = priceTxt.text
        
        let dict: [String: Any] = ["name": name as Any,
                                   "price": price as Any]
        
        let db = Firestore.firestore()
        db.collection("sell").document().setData(dict)
        
        
        let alert = UIAlertController(title: "Upload", message: "Uploaded Successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "DONE", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func uploadButton(_ sender: UIButton) {
        
        self.saveFIRData()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
