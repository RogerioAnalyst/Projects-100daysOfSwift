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
    var numberOfQuestions = 0
    var highScore = 0
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "spain", "uk", "us"]
        
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(displayScore))
                
    }
    
    //MARK: - askQuestion
    
    func askQuestion(action: UIAlertAction! = nil){
        
        contries.shuffle()
        correctAnshwer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        
        title = contries[correctAnshwer].uppercased()
        
    }
    
    //MARK: - buttonTapped
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.15, initialSpringVelocity: 5, options: [.curveEaseIn], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { finished in
            sender.transform = .identity
        }
        
        var title: String
        
        if sender.tag == correctAnshwer {
            title = "Correct"
            score += 1
            numberOfQuestions += 1
            
        } else {
            title = "Wrong, that's the flag of: \(contries[sender.tag].uppercased())"
            score -= 1
            numberOfQuestions += 1
            
        }
        
        if numberOfQuestions == 10{
            
            if highScore < score {
                highScore = score
                save()
            }
            
            let final = UIAlertController(title: "You're final score is:", message: "\(score)", preferredStyle: .alert)
            final.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
            final.addAction(UIAlertAction(title: "View HighScore", style: .default) { [weak self] _ in
                let ac = UIAlertController(title: "Your HighScore is: \(self!.highScore)", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Restart", style: .cancel, handler: self?.askQuestion))
                self?.present(ac, animated: true)
            })
            present(final, animated: true)
            
            score = 0
            
            numberOfQuestions = 0
            
        } else {
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
            
        }
        
        let label = UILabel()
        label.text = "\(score)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        
        let barButton1 = UIBarButtonItem(customView: label)
        
        self.navigationItem.setRightBarButtonItems([barButton1], animated: false)
        
    }
    
    //MARK: - displayScore
    
    @objc func displayScore() {
           let vc = UIAlertController(title: "Youre score is:", message: "\(score)", preferredStyle: .alert)
           vc.addAction(UIAlertAction(title: "Continue to Play Guess The Flag", style: .default))
           vc.addAction(UIAlertAction(title: "Share youre score", style: .default, handler: shareScore))
           present(vc, animated: true)
       }
       
    //MARK: - shareScore
    
       func shareScore(action: UIAlertAction! = nil) {
           let message = "I have \(score) points."
           let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
           vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
           present(vc, animated: true)
       }
    
    //MARK: - save
       
       func save() {
           defaults.set(highScore, forKey: "highScore")
       }
    
}
