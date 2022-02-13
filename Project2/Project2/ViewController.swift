//
//  ViewController.swift
//  Project2
//
//  Created by Rogerio Cardoso Filho on 12/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var contries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(){
        
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        
    }
}
