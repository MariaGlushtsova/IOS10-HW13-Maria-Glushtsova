//
//  DetailedSettingsViewViewController.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 9.07.23.
//

import UIKit
import SnapKit

class DetailedSettingsViewViewController: UIViewController {
    
    var model = [Section]()
    
    // MARK: - Outlets

    private lazy var congratsImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "DetailImage"))
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Поздравляю! Вы перешли на страницу расширенных настроек"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .systemGray3
    }
    
    private func setupHierarchy() {
        view.addSubview(congratsImage)
        view.addSubview(label)
    }
    
    private func setupLayout() {
        congratsImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(350)
            make.height.equalTo(150)
        }
        
        label.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
