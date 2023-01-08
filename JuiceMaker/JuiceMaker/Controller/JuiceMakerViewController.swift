//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryBananaButton: MyButton!
    @IBOutlet weak var strawberryButton: MyButton!
    @IBOutlet weak var bananaButton: MyButton!
    @IBOutlet weak var pineappleButton: MyButton!
    @IBOutlet weak var magoKiwiButton: MyButton!
    @IBOutlet weak var kiwiButton: MyButton!
    @IBOutlet weak var mangoButton: MyButton!
    
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
            failAlert()
            return
        } catch { }
        
        successAlert(sender)
    }
    
    func setJuiceType() {
        strawberryBananaButton.juice = .strawberryBananaJuice
        magoKiwiButton.juice = .mangoKiwiJuice
        strawberryButton.juice = .strawberryJuice
        bananaButton.juice = .bananaJuice
        pineappleButton.juice = .pineappleJuice
        kiwiButton.juice = .kiwiJuice
        mangoButton.juice = .mangoJuice
    }
    
    func successAlert(_ sender: MyButton) {
        guard let senderJuice = sender.juice else { return }
        let alert = UIAlertController(title: nil,
                                      message: "\(senderJuice.rawValue)쥬스 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재고가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default) { _ in
            self.pushEditStockView()
        }
        let cancel = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
}

