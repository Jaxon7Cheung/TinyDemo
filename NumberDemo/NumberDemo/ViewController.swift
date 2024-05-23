//
//  ViewController.swift
//  NumberDemo
//
//  Created by 张旭洋 on 2023/1/6.
//

import UIKit

class ViewController: UIViewController {
    
    var Number: Int = 0
    var step: Bool = true;
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        if step {
            Number += 1
        } else {
            Number -= 1
        }
        switch (Number) {
        case 10: step = false; break
        case 0: step = true; break
        default: break
        }
        updateUI()
        
    }
    func updateUI() {
        label.text = "Number:\(Number)"
        let title = !step ? "-1" : "+1"
        button.setTitle(title, for: .normal)
    }
    
}
