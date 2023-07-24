//
//  Model.swift
//  IOS10-HW13-Maria Glushtsova
//
//  Created by Admin on 8.07.23.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOptionModel)
    case switchCell(model: SettingsSwitchOptionModel)
}

struct SettingsOptionModel {
    var iconImage: UIImage?
    var name: SettingsText
    var text: String
    var handler: (() -> Void)
}

struct SettingsSwitchOptionModel {
    var iconImage: UIImage?
    var name: SettingsText
    var handler: (() -> Void)
    var isOn: Bool
}

enum SettingsText: String {
    case airplaneMode = "Авиарежим"
    case wiFi = "Wi-Fi"
    case bluetooth = "Bluetooth"
    case mobileData = "Сотовая связь"
    case personHotspot = "Режим модема"
    case vpn = "VPN"
    case notifications = "Уведомления"
    case sounds = "Звуки, тактильные сигналы"
    case focus = "Не беспокоить"
    case screenTime = "Экранное время"
    case general = "Основные"
    case controlCentre = "Пункт управления"
    case display = "Экран и яркость"
    case homeScreen = "Экран «Домой»"
}

extension ViewController {
    
    func configure() {
        model.append(Section(title: "", options: [
            .switchCell(
                model: SettingsSwitchOptionModel(
                    iconImage: UIImage(named: "Plane"),
                    name: .airplaneMode,
                    handler: { print( "did tappped PlaneSwitch" ) },
                    isOn: true)
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Wifi"),
                    name: .wiFi,
                    text: "Не подключено",
                    handler: { print( "did tappped Wifi" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Bluetooth"),
                    name: .bluetooth,
                    text: "Вкл.",
                    handler: { print( "did tappped Bluetooth" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Connection"),
                    name: .mobileData,
                    text: "",
                    handler: { print( "did tappped MobileData" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Hotspot"),
                    name: .personHotspot,
                    text: "",
                    handler: { print( "did tappped PersonHotspot" ) })
            ),
            .switchCell(
                model: SettingsSwitchOptionModel(
                    iconImage: UIImage(named: "Vpn"),
                    name: .vpn,
                    handler: { print( "did tappped VpnSwitch" ) },
                    isOn: true)
            ),
            
        ]))
        
        model.append(Section(title: "", options: [
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Notifications"),
                    name: .notifications,
                    text: "",
                    handler: { print( "did tappped Notifications" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Sound"),
                    name: .sounds,
                    text: "",
                    handler: { print( "did tappped Sounds" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Moon"),
                    name: .focus,
                    text: "",
                    handler: { print( "did tappped Focus" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Time"),
                    name: .screenTime,
                    text: "",
                    handler: { print( "did tappped ScreenTime" ) })
            ),
        ]))
        
        model.append(Section(title: "", options: [
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Settings"),
                    name: .general,
                    text: "",
                    handler: { print( "did tappped General" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Switch"),
                    name: .controlCentre,
                    text: "",
                    handler: { print( "did tappped ControlCentre" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "Screen"),
                    name: .display,
                    text: "",
                    handler: { print( "did tappped Display" ) })
            ),
            .staticCell(
                model: SettingsOptionModel(
                    iconImage: UIImage(named: "HomeScreen"),
                    name: .homeScreen,
                    text: "",
                    handler: { print( "did tappped HomeScreen" ) })
            ),
        ]))
    }
}

