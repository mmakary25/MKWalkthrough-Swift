//
//  ViewController.swift
//  MKWalkthrough
//
//  Created by minamakary25 on 06/09/2017.
//  Copyright (c) 2017 minamakary25. All rights reserved.
//

import UIKit
import MKWalkthrough

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MKWalkthrough.showCircularWalkthrough(onBarButtonItem: navigationItem.rightBarButtonItem!, radius: 50, hint: "Add your hint here!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

