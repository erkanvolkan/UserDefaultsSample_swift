//
//  ViewController.swift
//  UserDefaultsSample_Swift
//
//  Created by Erkan on 11/9/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var styleSegmentedControl: UISegmentedControl!
    @IBOutlet private var petImageView: UIImageView!
    @IBOutlet private var nameTextField: NameTextField!
    
    var isDarkMode: Bool!
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let prefersDarkMode = "prefersDarkMode"
        static let petName = "petname"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPetImageView()
        checkForStylePreference()
        checkForSavedName()
    }
     func updateStyle() {
    //        update name and background up to sender's activity
           UIView.animate(withDuration: 0.4) {
                self.view.backgroundColor = self.isDarkMode ? Colors.darkGrey : .white
//            self.nameTextField!.updatedStyle(isDarkMode: self.isDarkMode)
            }
        }
    func checkForSavedName() {
//        before upload checking name
        let name = defaults.value(forKey: Keys.petName) as? String ?? ""
        nameTextField.text = name
    }
    func setupPetImageView() {
//        Image set for view
        petImageView.layer.cornerRadius = petImageView.frame.size.height / 2
        petImageView.clipsToBounds      = true
    }
    
    func checkForStylePreference() {
//        before upload checking the preference
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
   
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveName()
        checkForSavedName()
    }
    func saveName() {
        defaults.set(nameTextField.text!, forKey: Keys.petName)

    }
    @IBAction func didChangeStyleSegemntedControl(_ sender: UISegmentedControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference()
       updateStyle()
     
    }
    func saveStylePreference() {
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
}

