//
//  CharacterViewModel.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import Foundation
import UIKit

class CharacterViewModel {
    var url : Observable<URL?> = Observable(nil)
    var character : Observable<Character?> = Observable(nil)
    var img : Observable<UIImage?> = Observable(nil)
    var imgURL : Observable<String?> = Observable(nil)
    let manager = DataManager.shared
    
    init() {}
    init(data:URL?) {
        url.value = data
    }
    
    func getCharacter() {
        self.manager.getCharacter(url: url.value, completion: { [self] (char, error) in
            if error == nil {
                self.character.value = char
                self.imgURL.value = char?.image
                getImage()
            } else {
                print(error?.localizedDescription ?? "error")
            }
        })
    }
    
    func getImage() {
        guard let imglink = URL(string: imgURL.value ?? "") else { return }
        self.manager.downloadImage(from: imglink, completion: { (img, error) in
            if error == nil {
                self.img.value = img ?? UIImage()
            } else {
                print(error?.localizedDescription ?? "Download image error")
            }
        })
    }
}
