//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import UIKit

class MainViewController: UITableViewController {

    let viewmodel = MainViewViewModel()
    var activityView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.fetchData { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func showActivityIndicatory() {
        activityView.center = self.view.center
        activityView.backgroundColor = .gray
        activityView.bringSubviewToFront(self.view)
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.episdeList?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Page 1"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell else {
            return UITableViewCell()
        }
        if let data = viewmodel.episdeList?.results?[indexPath.row] {
            cell.setView(name: data.name, episode: data.episode, date: data.air_date)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewmodel.episdeList?.results?[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            viewController.viewmodel = DetailViewModel(data: data)
                navigationController?.pushViewController(viewController, animated: true)
            }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
