//
//  ViewController.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 13/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableCategories: UITableView!
    
    
    private var categories: [Categories]?
    private var selectIdCategoryDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableCategories.delegate = self
        self.tableCategories.dataSource = self
        
        let categoriesClass = ManagerServices()
        categoriesClass.getCategories(callback: { (categories) in
            if categories != nil {
                self.categories = categories
                DispatchQueue.main.async {
                    self.tableCategories.reloadData()
                }
                
            }
        })
        
    }
    
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 0
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategories", for: indexPath) as! MenuTableViewCell
        
        
        
        cell.identifierLabel.layer.cornerRadius = 20.0
        cell.identifierLabel.clipsToBounds = true
        
        cell.identifierLabel.text = self.categories![indexPath.row].name
        cell.identifierLabel.getFirtsLetterText(character: " ", cantLetters: 2)
        
        
        
        
        cell.nameLabel.text = self.categories![indexPath.row].name
        // Configure the cell...
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectIdCategoryDetail = self.categories![indexPath.row].id
        
        performSegue(withIdentifier: "toDetailcategory", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailcategory" {
            let destinationVC = segue.destination as! CategoriesTableViewController
            destinationVC.selectedCategoryDetail = self.selectIdCategoryDetail
        }
    }
    
    
}

