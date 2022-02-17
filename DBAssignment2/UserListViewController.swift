//
//  UserListViewController.swift
//  DBAssignment2
//
//  Created by Neosoft on 07/02/22.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var userListTableView: UITableView!
    
    var users = [User]()
    
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userListTableView.delegate = self
        userListTableView.dataSource = self
        
        users = dbHelper.getUserData()
        print(users[0].firstName!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        users = dbHelper.getUserData()
        self.userListTableView.reloadData()
    }

}



extension UserListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")as! UserCell
        cell.educationLbl.text = users[indexPath.row].education!
        cell.nameLbl.text = "\(users[indexPath.row].firstName!) \(users[indexPath.row].lastName!)"
        cell.userImageView.image = UIImage(data: users[indexPath.row].photo!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
