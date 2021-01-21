//
//  TableViewDelegate.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

internal class AndesListTableViewDelegate: NSObject, UITableViewDelegate {

    var listProtocol: AndesListProtocol

    init(listProtocol: AndesListProtocol) {
        self.listProtocol = listProtocol
        super.init()
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listProtocol.didSelectRowAt?(indexPath: indexPath)
    }

    internal func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfRows(inSection: indexPath.section) - 1 <= indexPath.row {
            guard let cell = cell as? AndesListCell else {
                fatalError("The dequeued cell is not an instance of AndesListSimpleViewCell.")
            }
            cell.setupSeparatorStyle(separatorStyle: .none)
        }
    }
}
