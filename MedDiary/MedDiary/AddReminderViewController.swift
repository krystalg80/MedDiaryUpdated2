//
//  AddReminderViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/9/23.
//

import UIKit

class AddReminderViewController: UIViewController {
    
    let reminderImages = Reminder.Images.allCases

    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReminderImageCollectionViewCell.nib, forCellWithReuseIdentifier: ReminderImageCollectionViewCell.identifier)
        
        setupNavBar()
    }
    func setupNavBar() {
        title = "Select Image"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddReminder(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    @objc func cancelAddReminder(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 
    // All of the code in AddHabitViewController ...
 // class ends here!

// Add the extension below AddHabitViewController class!
extension AddReminderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminderImages.count // <- add this
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReminderImageCollectionViewCell.identifier, for: indexPath) as! ReminderImageCollectionViewCell
        cell.setImage(image: reminderImages[indexPath.row].image)
        return cell
        // to here!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/4, height: collectionViewWidth/4)
        
    }
    
    
}

    
    // Extension code here...

