//
//  TableViewController.swift
//  Photo List
//
//  Created by oktay on 7.07.2023.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var frc : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    var pc = (UIApplication.shared.delegate.self as! AppDelegate).persistentContainer.viewContext
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let fecthRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        let sorter = NSSortDescriptor(key: "title", ascending: true)
        fecthRequest.sortDescriptors = [sorter]
        return fecthRequest
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        frc = getFRC()
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch{
            print(error)
            return
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = frc.sections?[section].numberOfObjects
        return numberOfRows!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let dataRow = frc.object(at: indexPath) as! Entity
        
        cell.imgPhoto.image = UIImage(data: (dataRow.img)! as Data)
        cell.lblDesc.text = dataRow.desc
        cell.lbltitle.text = dataRow.title
        return cell
    }
}


extension TableViewController: NSFetchedResultsControllerDelegate {
    
}
