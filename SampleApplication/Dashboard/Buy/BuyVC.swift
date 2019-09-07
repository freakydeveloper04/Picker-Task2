//
//  BuyVC.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class BuyVC: UIViewController{

    var arrData = [Model]()
    var db:Firestore!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    func loadData() {
        let db = Firestore.firestore()
        
        db.collection("sell").getDocuments() { (snapshot, error) in
            
            self.arrData.removeAll()

            if let error = error {
                print("\(error.localizedDescription)")
            }
            
            else{
                
                for document in (snapshot?.documents)!{
                    
                    let name = document.data()["name"] as? String ?? ""
                    let price = document.data()["price"] as? String ?? ""
                    
//                    print("name \(name)")
//                    print("price \(price)")

                    self.arrData.append(Model(name: name, price: price))
                    self.tableView.reloadData()

//                    print(self.arrData)
                }
         
                }
            }
        }
}
    extension BuyVC: UITableViewDelegate, UITableViewDataSource {

        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return arrData.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let sell = arrData[indexPath.row]
            
            cell.textLabel?.text = "NAME : \(sell.name)   PRICE: \(sell.price)"
        
        return cell
    }
}

