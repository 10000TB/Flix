//
//  SettingsViewController.swift
//  Example
//
//  Created by wc on 02/11/2017.
//  Copyright © 2017 DianQK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Flix

class SettingsViewController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"

        let profileProvider = ProfileProvider(avatar: #imageLiteral(resourceName: "Flix Icon"), name: "Flix")
        let profileSectionProvider = SpacingSectionProvider(providers: [profileProvider], headerHeight: 35, footerHeight: 0)

        let airplaneModeProvider = SwitchTableViewCellProvider(title: "Airplane Mode", icon: #imageLiteral(resourceName: "Airplane Icon"), isOn: false)
        let wifiProvider = DescriptionTableViewCellProvider(title: "Wi-Fi", icon: #imageLiteral(resourceName: "Wifi Icon"), description: "Flix_5G")
        let bluetoothProvider = DescriptionTableViewCellProvider(title: "Bluetooth", icon: #imageLiteral(resourceName: "Bluetooth Icon"), description: "On")
        let cellularProvider = DescriptionTableViewCellProvider(title: "Cellular", icon: #imageLiteral(resourceName: "Cellular Icon"))
        let personalHotspotProvider = DescriptionTableViewCellProvider(title: "Personal Hotspot", icon: #imageLiteral(resourceName: "Personal Hotspot Icon"), description: "Off")
        let carrierProvider = DescriptionTableViewCellProvider(title: "Carrier", icon: #imageLiteral(resourceName: "Carrier Icon"), description: "AT&T")

        let networkSectionProvider = SpacingSectionProvider(
            providers: [
                airplaneModeProvider,
                wifiProvider,
                bluetoothProvider,
                cellularProvider,
                personalHotspotProvider,
                carrierProvider
            ],
            headerHeight: 35,
            footerHeight: 0
        )

        self.tableView.flix.build([profileSectionProvider, networkSectionProvider])

    }

}
