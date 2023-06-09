//
//  ChatViewController.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 18/05/2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var tableViews: UITableView!
    @IBOutlet weak var messagesTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViews.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableViews.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.messages = []
                
                if let e = error {
                    print ("Error retrieveing data. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.tableViews.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableViews.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messagesTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("Error saving data. \(e)")
                } else {
                    print("Data saved successfully.")
                    
                    DispatchQueue.main.async {
                        self.messagesTextField.text = ""
                    }
                    
                }
            }
        }
    }
    
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out.", signOutError)
        }
    }
}
extension ChatViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < messages.count {
            let message = messages[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
            cell.label.text = message.body
            
            // Message from user
            if message.sender == Auth.auth().currentUser?.email {
                cell.messageBubble.backgroundColor = UIColor(named: "LightPurple")
                cell.label.textColor = UIColor(named: "Purple")
                cell.stackViewLeadingConstraint.constant = 50
                cell.stackViewTrailingConstraint.constant = 10            }
            // Message from sender
            else {
                cell.messageBubble.backgroundColor = UIColor(named: "Purple")
                cell.label.textColor = UIColor(named: "LightPurple")
                cell.stackViewLeadingConstraint.constant = 10
                cell.stackViewTrailingConstraint.constant = 50
            }
            
            
            return cell
        } else {
            
            return UITableViewCell()
        }
        
        
    }
    
}
