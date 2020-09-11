//
//  CharacterViewController.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import UIKit

class CharacterViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var species: UILabel!
    
    var viewmodel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getCharacter()
        viewmodel.getImage()
        viewmodel.character.bind { (_) in
            self.setView()
        }
        viewmodel.img.bind{ _ in
            self.setImg()
        }
    }
    
    func setView() {
        DispatchQueue.main.async {
            self.name.text = "Name: \(String(describing: self.viewmodel.character.value?.name ?? ""))"
            self.gender.text = "Gender: \(String(describing: self.viewmodel.character.value?.gender ?? ""))"
            self.species.text = "Species: \(String(describing: self.viewmodel.character.value?.species ?? ""))"
            self.img.image = self.viewmodel.img.value
        }
        
    }
    
    func setImg() {
        DispatchQueue.main.async {
            self.img.image = self.viewmodel.img.value
        }
    }
}
