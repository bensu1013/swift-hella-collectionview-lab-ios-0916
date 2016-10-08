//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by Benjamin Su on 10/7/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaDetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var textString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = textString
    }

}
