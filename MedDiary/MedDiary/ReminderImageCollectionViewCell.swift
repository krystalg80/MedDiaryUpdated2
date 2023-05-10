//
//  ReminderCollectionViewCell.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/9/23.
//

import UIKit

class ReminderImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var reminderImage: UIImageView!
    
    static let identifier = "ReminderImageCell"

        static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    func setImage(image: UIImage){
        self.reminderImage.image = image
    }
}


