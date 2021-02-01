//
//  LastViewController.swift
//  assignment2
//
//  Created by Tomiris Sayat on 31.01.2021.
//

import UIKit

class LastViewController: UIViewController {
    
    var total: Int = 0
    
    var delegate: VarDelegate?
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel?.text = "\(total)/10"
        // Do any additional setup after loading the view.
    }

    @IBAction func quitButton(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation0

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
