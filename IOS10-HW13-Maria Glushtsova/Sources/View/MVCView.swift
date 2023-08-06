//
//  MVCView.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 6.08.23.
//

import UIKit
import SnapKit

class MVCView: UIView {
    
    // MARK: - Outlets
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    private func registerCelll() {
        tableView.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifier)
    }
    
    //MARK: -> Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
        registerCelll()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup

    private func setupView() {
        backgroundColor = UIColor.white
    }

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
