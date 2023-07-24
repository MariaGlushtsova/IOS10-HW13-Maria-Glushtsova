//
//  SettingsTableViewCell.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 8.07.23.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"

    // MARK: - Outlets

    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Setup
    
    func configure(with model: SettingsOptionModel) {
        iconImage.image = model.iconImage
        name.text = model.name.rawValue
        text.text = model.text
    }

    private func setupHierarchy() {
        contentView.addSubview(iconImage)
        contentView.addSubview(name)
        contentView.addSubview(text)
    }

    private func setupLayout() {

        iconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(30)
        }

        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalTo(iconImage).offset(40)
        }

        text.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        iconImage.image = nil
        name.text = nil
        text.text = nil
    }
}
