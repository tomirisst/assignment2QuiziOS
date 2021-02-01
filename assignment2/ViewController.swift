//
//  ViewController.swift
//  assignment2
//
//  Created by Tomiris Sayat on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
}


