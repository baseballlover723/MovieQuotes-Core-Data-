//
//  MovieQuoteDetailViewController.swift
//  MovieQuotes
//
//  Created by Philip Ross on 1/26/15.
//  Copyright (c) 2015 Philip Ross. All rights reserved.
//

import UIKit

class MovieQuoteDetailViewController: UIViewController {
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var managedObjectContext: NSManagedObjectContext?
    var movieQuote : MovieQuote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "showEditQuoteDialog")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateView()
    }
    
    func showEditQuoteDialog() {
        
        let alertController = UIAlertController(title: "Edit this movie quote", message: "", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = self.movieQuote?.quote
            textField.placeholder = "Quote"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = self.movieQuote?.movie
            textField.placeholder = "Movie Title"
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            println("you pressed cancel")
        }
        let editQuoteAction = UIAlertAction(title: "Update quote", style:UIAlertActionStyle.Default) { (action) -> Void in
            println("You pressed Edit Quote")
            
            let quoteTextField = alertController.textFields![0] as UITextField
            let movieTextField = alertController.textFields![1] as UITextField
            self.movieQuote?.quote = quoteTextField.text
            self.movieQuote?.movie = movieTextField.text
            self.movieQuote?.lastTouchDate = NSDate()
            
            //save 
            var error: NSError? = nil
            self.managedObjectContext!.save(&error)
            if error != nil {
                println("Unresolved Core Data error \(error?.userInfo)")
                abort()
            }

            self.updateView()
            
            
            
        }
        //        quoteTextField.text, movie: movieTextField.txt)
        
        alertController.addAction(cancelAction)
        alertController.addAction(editQuoteAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateView() {
        println("update")
        println("quote = \(movieQuote?.quote)")
        println("movie = \(movieQuote?.movie)")
        quoteLabel.text = movieQuote?.quote
        movieLabel.text = movieQuote?.movie
    }
}
