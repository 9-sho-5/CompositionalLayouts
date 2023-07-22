//
//  DetailViewController.swift
//  CompositionalLayouts
//
//  Created by 楠瀬　法生 on 2023/07/18.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name: String = ""
    var imageUrl: String = ""
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        imageView.loadImage(urlString: imageUrl)
    }
}
