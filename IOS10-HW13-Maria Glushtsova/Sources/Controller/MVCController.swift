//
//  MVCController.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 6.08.23.
//

import UIKit

class MVCController: UIViewController {
    
    private var model = MVCModel().createModels()
    
    private var mvcView: MVCView? {
        guard isViewLoaded else { return nil }
        return view as? MVCView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        view = MVCView()
        mvcView?.tableView.dataSource = self
        mvcView?.tableView.delegate = self
    }
}

private extension MVCController {
    
    func configureView() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MVCController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let viewController = DetailedSettingsViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)

        let cellType = model[indexPath.section].options[indexPath.row]

        switch cellType {
        case .staticCell(model: let model):
            model.handler()
        case .switchCell(model: let model):
            model.handler()
        }
    }
}

extension MVCController: UITableViewDataSource {
        
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
