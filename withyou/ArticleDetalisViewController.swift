//
//  ArticleDetalisViewController.swift
//  withyou
//
//  Created by Abdullah on 22/05/1446 AH.
//

import Foundation
import UIKit
class ArticleDetalisViewController:UIViewController {
    
    var articleContent: String?
    
    @IBOutlet weak var contentTextView: UITextView!
   
        override func viewDidLoad() {
            super.viewDidLoad()
            contentTextView.isEditable = false
            contentTextView.isSelectable = false
            contentTextView.isUserInteractionEnabled = false
            
            if let content = articleContent {
                print("Content Received: \(content)")
                contentTextView.text = content
            } else {
                print("No content received!")
                contentTextView.text = "No content available"
            }
        }
    }

