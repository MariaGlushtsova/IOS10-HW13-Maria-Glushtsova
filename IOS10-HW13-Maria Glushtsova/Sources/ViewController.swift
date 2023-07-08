//
//  ViewController.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 8.07.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var model = [Section]()
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private func registerCelll() {
        tableView.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifier)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        registerCelll()
        setupHierarchy()
        setupLayout()
        configure()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellType = model[indexPath.section].options[indexPath.row]
        
        switch cellType {
        case .staticCell(model: let model):
            model.handler()
        case .switchCell(model: let model):
            model.handler()
        }
    }
}

extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = model[indexPath.section].options[indexPath.row]
        
        switch cellType {
        case .staticCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath
            ) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        case .switchCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            
            return cell
        }
    }
}
