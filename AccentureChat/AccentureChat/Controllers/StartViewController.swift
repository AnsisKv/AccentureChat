//
//  StartViewController.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 17/05/2023.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabel.alpha = 0
        titleLabel2.alpha = 0
        
        UIView.animate(withDuration: 2.0, animations: {
            self.titleLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 2.0) {
                self.titleLabel2.alpha = 1
            }
        }
    }
}
