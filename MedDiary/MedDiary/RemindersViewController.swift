//
//  RemindersViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/1/23.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var persistence = PersistenceLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.register(
          ReminderTableViewCell.nib,
          forCellReuseIdentifier: ReminderTableViewCell.identifier
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.reminders.count // Change!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
           withIdentifier: ReminderTableViewCell.identifier,
           for: indexPath
         ) as! ReminderTableViewCell
        let reminder = persistence.reminders[indexPath.row]
          cell.configure(reminder) // Shows an error, you'll fix this next!

        // corner radius ?
        cell.imageViewIcon.layer.cornerRadius = cell.imageViewIcon.frame.height / 2
        
         return cell
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistence.setNeedsToReloadReminders()
        tableView.reloadData()
    }

}
extension RemindersViewController {
    
     func setupNavBar() {
        title = "Reminders" // Add a title to the nav bar
        // Create a UIBarButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddReminder(_:)))
        // Add the barbuttonitem to the navbar
        navigationItem.rightBarButtonItem = addButton
    }

    // This function handle taps on the bar button item, see #selector above
    @objc func pressAddReminder(_ sender: UIBarButtonItem) {
        let addReminderVC = AddReminderViewController.instantiate()
          let navigationController = UINavigationController(rootViewController: addReminderVC)
        navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
    }
   
}
