//
//  AndesListDataSource.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//

import Foundation

@objc public protocol AndesListDataSource {

    @objc func andesList(_ listView: AndesList, cellForRowAt indexPath: IndexPath) -> AndesListCell
    @objc func andesList(_ listView: AndesList, numberOfRowsInSection section: Int) -> Int
    @objc func numberOfSections(_ listView: AndesList) -> Int

}
