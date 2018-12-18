import UIKit
import CoreData

class PersonsTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var persons:[Person]?
    
    fileprivate func reloadData() {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key: "stuName", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    //    @IBAction func edit(_ sender: Any) {
    //        self.isEditing = !isEditing
    //    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let p = persons?[indexPath.row]{
            cell.textLabel?.text = p.stuNo
            cell.detailTextLabel?.text = p.stuName
        }
        
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let secVC = segue.destination as! DetailViewController
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) ,let person = persons?[indexPath.row]{
                secVC.person = person
            }
        }
    }
    
    
}
