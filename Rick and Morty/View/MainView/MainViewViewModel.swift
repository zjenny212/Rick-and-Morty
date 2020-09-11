//
//  MainViewViewModel.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import Foundation


class MainViewViewModel {
    let manager = DataManager.shared
    var episdeList : Episodes?
    
    func fetchData(completion: @escaping (Error?) -> ()) {
        self.manager.getData { (episdes, error) in
            if error == nil {
                self.episdeList = episdes
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}
