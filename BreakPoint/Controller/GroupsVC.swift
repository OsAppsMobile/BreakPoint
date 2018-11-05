//
//  SecondViewController.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 17.08.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
            DataService.instance.getGroups { (returnedGroupArray) in
                self.groupsArray = returnedGroupArray
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func createGroupBtnWasPressed(_ sender: Any) {
    }
    

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else { return GroupCell() }
        let group = groupsArray[indexPath.row]
        groupCell.configureCell(title: group.title, description: group.description, memberCount: group.members.count)
        return groupCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
       //guard let groupCell = tableView.cellForRow(at: indexPath) as? GroupCell else { return }
       let group = groupsArray[indexPath.row]
        groupFeedVC.initData(forGroup: group)
        present(groupFeedVC, animated: true, completion: nil)
    }
}
