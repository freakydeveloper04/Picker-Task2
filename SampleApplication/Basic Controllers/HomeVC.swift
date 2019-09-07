//
//  HomeVC.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    @IBOutlet weak var welcomLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);
    }

    @IBAction func continueButton(_ sender: UIButton) {
        
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {

        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
        self.dismiss(animated: false, completion: nil)
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vcc = story.instantiateViewController(withIdentifier: "start")
        vcc.modalPresentationStyle = .overCurrentContext
        self.present(vcc, animated: true, completion: nil)
    }
}
