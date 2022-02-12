//
//  DetailViewController.swift
//  Project1
//
//  Created by Rogerio Cardoso Filho on 10/02/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image number \(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            
            imageView.image = UIImage(named: imageToLoad)
            
        }
        
        assert(selectedImage != nil, "the selected image is nil")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
        
    }

}
