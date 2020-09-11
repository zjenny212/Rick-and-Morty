//
//  EpisodeTableViewCell.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setView(name:String?,episode:String?,date:String?) {
        self.name.text = name
        self.episode.text = episode
        self.date.text = date
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
