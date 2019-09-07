//
//  Model.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}


struct Model {
    var name:String
    var price:String
    
    var dictionary:[String:Any] {
        return [
            "name" : name,
            "price" : price,
        ]
    }
    
}

extension Model : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let price = dictionary["price"] as? String else {return nil}
        
        self.init(name: name, price: price)
    }
}


