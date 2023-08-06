//
//  DetailedSettingsViewController.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 6.08.23.
//
import UIKit

class DetailedSettingsViewController: UIViewController {
    
    static let identifier = "DetailedSettingsViewController"
    
    let detailedSettingsView = DetailedSettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailedSettingsView
    }
}
