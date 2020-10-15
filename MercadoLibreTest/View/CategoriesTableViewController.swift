//
//  CategoriesTableViewController.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 13/10/20.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    private var categoriesDetail: CategoryDetail?
    
    var selectedCategoryDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let categoriesClass = ManagerServices()
        categoriesClass.getCategoryForID(idCategory: self.selectedCategoryDetail) { [self] (categoryDetail) in
            if categoryDetail != nil {
                categoriesDetail = categoryDetail
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
        self.title = "Detalle Categorias"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesDetail?.results.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
         let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailCell", for: indexPath) as? DetailCategoryTableViewCell
        
        cell?.titleLabelCell.text = self.categoriesDetail?.results[indexPath.row].title
        cell?.imageViewCell.donwloadedFrom(url: (self.categoriesDetail!.results[indexPath.row].thumbnail), contentMode: .scaleAspectFit)
        cell?.priceLabelCell.text! = "Precio: $\(String(describing: self.categoriesDetail!.results[indexPath.row].price))"
        cell?.QuantityLabelCell.text! = "Cant. disponible:\(String(describing: self.categoriesDetail!.results[indexPath.row].available_quantity))"
        cell?.ubicationLabelCell.text! = "Ubicación:\(String(describing: self.categoriesDetail!.results[indexPath.row].address.city_name)) ,\(String(describing: self.categoriesDetail!.results[indexPath.row].address.state_name))"
//        cell?.textLabel?.text = self.categories?[indexPath.row].name
        // Configure the cell...
        
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        if let itemDetailController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemDetailController") as? ItemDetailViewController { // new *ViewController
            self.definesPresentationContext = true // present
            itemDetailController.modalPresentationStyle = .fullScreen
            itemDetailController.idItemDetail = self.categoriesDetail?.results[indexPath.row].id
            self.present(itemDetailController, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
