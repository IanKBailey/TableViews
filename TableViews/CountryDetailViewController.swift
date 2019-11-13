//
//  CountryDetailViewController.swift
//  TableViews
//
//  Created by Ian Bailey on 11/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
//expected data is a country object
    // this property gets set in the prepareForSegue method from the ContinentsViewController
    var country: Country!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(country.fullImageName)")
        textView.text = country.description
        //set title of navigation bar
        title = country.name
       
    }
    

    

}
