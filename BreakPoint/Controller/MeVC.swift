//
//  MeVC.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 29.08.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var myMessagesArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmailLbl.text = Auth.auth().currentUser?.email
        DataService.instance.getUserFeedMessages { (userFeedMessages) in
            self.myMessagesArray = userFeedMessages
            self.tableView.reloadData()
        }
    }

    @IBAction func logOutBtnWasPressed(_ sender: Any) {
        let logOutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try  Auth.auth().signOut()
                let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let authVC = storyBoard.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch  {
                print(error.localizedDescription)
            }
        }
        logOutPopup.addAction(logoutAction)
        present(logOutPopup, animated: true, completion: nil)
    }
    
    
}

extension MeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMessagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let meFeedCell = tableView.dequeueReusableCell(withIdentifier: "MeFeedCell") as? MeFeedCell else { return MeFeedCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = myMessagesArray[indexPath.row]
        meFeedCell.configureCell(profileImage: image!, email: (Auth.auth().currentUser?.email)!, content: message.content)
        return meFeedCell
    }
    
}
