//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryBananaJuice: MyButton!
    @IBOutlet weak var mangoKiwiJuice: MyButton!
    @IBOutlet weak var strawberryJuice: MyButton!
    @IBOutlet weak var bananaJuice: MyButton!
    @IBOutlet weak var pineAppleJuice: MyButton!
    @IBOutlet weak var kiwiJuice: MyButton!
    @IBOutlet weak var mangoJuice: MyButton!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineAppleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setJuiceType()
    }
    
    @IBAction func editStockTapped(_ sender: UIBarButtonItem) {
        pushEditStockView()
    }
    
    func pushEditStockView() {
        guard let editStockVC = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") else { return }
        
        self.navigationController?.pushViewController(editStockVC, animated: true)
    }
    
    @IBAction func orderJuice(_ sender: MyButton) {
        guard let senderJuice = sender.juice else { return }
        do { try juiceMaker.makeJuice(by: senderJuice)
        } catch JuiceMakerError.outOfStock {
            
        } catch { }
    }
    
    func setJuiceType() {
        strawberryBananaJuice.juice = .strawberryBananaJuice
        mangoKiwiJuice.juice = .mangoKiwiJuice
        strawberryJuice.juice = .strawberryJuice
        bananaJuice.juice = .bananaJuice
        pineAppleJuice.juice = .pineappleJuice
        kiwiJuice.juice = .kiwiJuice
        mangoJuice.juice = .mangoJuice
    }
    
}

