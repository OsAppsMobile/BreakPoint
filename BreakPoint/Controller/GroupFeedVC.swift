//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 14.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupTitleLbl: UILabel!    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sendMessageView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var group: Group?
    var groupMessageArray = [Message]()
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sendMessageView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DataService.instance.getEmail(forGroup: group!) { (memberEmails) in
            self.membersLbl.text = memberEmails.joined(separator: ", ")
        }
        self.groupTitleLbl.text = group?.title
        
        DataService.instance.REF_GROUPS.observe(.value) { (groupsSnaphot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessageArray = returnedGroupMessages
                self.tableView.reloadData()
                if self.groupMessageArray.count >= 1 {
                let endIndex = IndexPath(row: self.groupMessageArray.count - 1, section: 0)
                self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
                }
            })
        }
    }
    

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (success) in
                if success {
                    self.messageTextField.text! = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                } else {
                    print("Message could not send. Please try again.")
                }
            })
        }
    }
    
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groupFeedCell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell") as? GroupFeedCell else { return GroupFeedCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = groupMessageArray[indexPath.row]
        DataService.instance.getUserName(forUID: message.senderId) { (returnedUserName) in
            groupFeedCell.configureCell(profileImg: image!, userEmail: returnedUserName, message: message.content)
        }
        return groupFeedCell
    }
}
