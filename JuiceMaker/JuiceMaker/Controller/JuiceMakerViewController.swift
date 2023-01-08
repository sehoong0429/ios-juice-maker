//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func editStockTapped(_ sender: UIBarButtonItem) {
        pushEditStockView()
    }
    
    func pushEditStockView() {
        guard let editStockVC = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") else { return }
        
        self.navigationController?.pushViewController(editStockVC, animated: true)
    }
}

