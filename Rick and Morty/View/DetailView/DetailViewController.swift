//
//  DetailViewController.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var viewmodel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.episode.bind { (_) in
            self.setView()
        }
    }
    
    func setView() {
        episode.text = viewmodel.episode.value?.episode
        name.text = viewmodel.episode.value?.name
        urlLabel.text = viewmodel.episode.value?.url
    }
}

extension DetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.episode.value?.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "charactersListCell", for: indexPath) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        if let data = viewmodel.episode.value?.characters?[indexPath.row] {
            cell.textLabel?.text = "\(data)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewmodel.episode.value?.characters?[indexPath.row]
        if let viewController = storyboard?.instantiateViewController(identifier: "CharacterViewController") as? CharacterViewController {
            viewController.viewmodel = CharacterViewModel(data:data)
                navigationController?.pushViewController(viewController, animated: true)
            }
    }
}
