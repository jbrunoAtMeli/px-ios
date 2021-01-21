//
//  TableViewDataSource.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

internal class AndesListTableViewDataSource: NSObject, UITableViewDataSource {

    var listProtocol: AndesListProtocol

    init(listProtocol: AndesListProtocol) {
        self.listProtocol = listProtocol
        super.init()
    }

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return listProtocol.numberOfSections(in: tableView)
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProtocol.tableView(tableView, numberOfRowsInSection: section)
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = listProtocol.cellForRowAt(indexPath: indexPath)
        switch customCell.type {
        case .simple:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell", for: indexPath) as? AndesListSimpleViewCell else {
                fatalError("The dequeued cell is not an instance of AndesListSimpleViewCell.")
            }
            cell.selectionStyle = listProtocol.getSelectionStyle()
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        case .chevron:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListChevronViewCell", for: indexPath) as? AndesListChevronViewCell else {
                fatalError("The dequeued cell is not an instance of AndesListChevronViewCell.")
            }
            cell.selectionStyle = listProtocol.getSelectionStyle()
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        default:
            return UITableViewCell()
        }
    }
}
