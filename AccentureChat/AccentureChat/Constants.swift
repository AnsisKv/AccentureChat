//
//  Constants.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 19/05/2023.
//

struct K {
    static let appName = "AccentureChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let signUpSegue = "SignUpToChat"
    static let loginSegue = "LoginToChat"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
}
