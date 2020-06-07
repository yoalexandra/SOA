//
//  ViewController.swift
//  SOA
//
//  Created by Alexandra Beznosova on 13.04.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var items: [Story] = []
    private let storiesManager = StoriesManager.shared
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? StoryCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let story = self.items[indexPath.row]
        cell.configure(with: story)
        return cell
    }
}
