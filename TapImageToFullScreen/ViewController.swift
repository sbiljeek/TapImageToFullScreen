//
//  ViewController.swift
//  TapImageToFullScreen
//
//  Created by Salman Biljeek on 11/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .tertiarySystemFill
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 12
            return imageView
        }()
        
        let image = UIImage(named: "image1") ?? UIImage()
        
        imageView.image = image
        
        let ratio = image.size.height / image.size.width
        
        let leftRightPadding: CGFloat = 40
        
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: leftRightPadding).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -leftRightPadding).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: ratio).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let imageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleImageTapped))
        imageView.addGestureRecognizer(imageViewTapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc fileprivate func handleImageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        guard let image = imageView.image else { return }
        let vc = FullScreenImageViewController(image: image)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}

