//
//  DetailViewModel.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import Foundation
class DetailViewModel {
    var episode : Observable<Results?> = Observable(nil)
    var url: URL?
    let manager = DataManager.shared
    
    init() {}
    
    init(data: Results?) {
        episode.value = data
    }
}
