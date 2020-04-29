//
//  ViewController.swift
//  SOA
//
//  Created by Alexandra Beznosova on 13.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import UIKit
import StoryViewCell

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var items: [Story] = []
    private let storiesManager = StoriesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        storiesManager.getStories { result in
            switch result {
            case .success(let stories):
                self.items.append(contentsOf: stories)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
  
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: StoryViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? StoryViewCell ??
        StoryViewCell(style: .default, reuseIdentifier: "Cell")
        cell.selectionStyle = .none
        let story = self.items[indexPath.row]
        cell.titleTextLabel.text = story.title
        cell.detailLabel.text = story.abstract
        return cell
    }
}
