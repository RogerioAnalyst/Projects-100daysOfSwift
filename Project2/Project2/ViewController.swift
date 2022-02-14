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
    var correctAnshwer = 0
    
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
    
    func askQuestion(action: UIAlertAction! = nil){
        
        contries.shuffle()
        correctAnshwer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        
        title = contries[correctAnshwer].uppercased()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnshwer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
}
