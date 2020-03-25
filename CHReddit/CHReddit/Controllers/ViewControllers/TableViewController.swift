//
//  TableViewController.swift
//  CHReddit
//
//  Created by Colby Harris on 3/25/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var posts: [CHPost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CHPostController.fetchPosts { (posts) in
            self.posts = posts
            
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}

        let post = posts[indexPath.row]
        cell.postTitleLabel.text = post.title
        CHPostController.fetchImage(for: post) { (image) in
            DispatchQueue.main.async {
                cell.postImageView.image = image ?? #imageLiteral(resourceName: "redditStockImage")
            }
            cell.postImageView.image = image ?? #imageLiteral(resourceName: "redditStockImage")
        }
        return cell
    }
}
