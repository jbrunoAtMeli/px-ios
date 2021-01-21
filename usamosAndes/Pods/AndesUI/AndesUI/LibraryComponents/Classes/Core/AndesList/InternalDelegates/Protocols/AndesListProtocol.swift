//
//  AndesListProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

@objc internal protocol AndesListProtocol {
    func cellForRowAt(indexPath: IndexPath) -> AndesListCell
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func getSeparatorStyle() -> AndesSeparatorStyle
    func getSelectionStyle() -> UITableViewCell.SelectionStyle
    @objc optional func didSelectRowAt(indexPath: IndexPath)
}
