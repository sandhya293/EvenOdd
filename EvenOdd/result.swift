//
//  result.swift
//  EvenOdd
//
//  Created by Sandhya Baghel on 20/06/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import Foundation

import UIKit


class result: UIViewController {
    var text:String = ""
    
    //@IBOutlet weak var textLabel:UILabel?
    
    private let lable:UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
       lb.textAlignment = .center;
        return lb
    }()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.addSubview(lable)
        lable.text = text
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        lable.frame = CGRect(x: 40 , y: 450 , width: 360 , height : 50)
       
    }
}
