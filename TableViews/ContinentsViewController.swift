//
//  ContinentsViewController.swift
//  TableViews
//
//  Created by Ian Bailey on 11/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ContinentsViewController: UIViewController {

    @IBOutlet weak var continentTableView: UITableView!
    

    private var continent = [[Country]]() {
        didSet { // property observer, get called when continent is changed or set
            continentTableView.reloadData() // reloads ALL the content of the table view
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continentTableView.dataSource = self
        loadData()
        
        
        
    }
    //Help method
    func loadData () {
        continent = Country.getSections()
        //didSet will get called on continent and table view will be reloaded
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Here is where we pass data from this view controller to the countryDetailVC
        
        //we will pass th selected country the CountryDetailVC
        
        // segue has a .source and a destination property
        
        guard let countryDVC = segue.destination as? CountryDetailViewController, let indexPath = continentTableView.indexPathForSelectedRow else {
            
            return
        }
        
        countryDVC.country = continent[indexPath.section][indexPath.row]
    }
    
    
    
    
    
}

extension ContinentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // the data for this table view is an array of arrays [[Country]]
        // no longer can we simply return continents.count
        //this would return 5 in our case, since we have 5 sections (continents) currently
        
        //we need to return the section's count
        // [section].count on the array of arrays
        return continent[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //step 1: get a cell using dequeueReusableCell
        let cell = continentTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        //Step 2: we need to get the current object at the current indexPath
        let country = continent[indexPath.section][indexPath.row]
        
        //step 3: configure cell
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(named: "\(country.thumbnailImageName)")
//        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = country.description
        //step 4: Return cell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return continent.count // 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continent[section].first?.continent
    }
}
