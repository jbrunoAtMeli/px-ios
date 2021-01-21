//
//  AndesBodyLinks.swift
//  AndesUI
//
//  Created by Marcelo Agustin Gil on 27/07/2020.
//

public class AndesBodyLinks {
    var links: [AndesBodyLink]
    var listener: ((_ index: Int) -> Void)

    public init(links: [AndesBodyLink], listener: @escaping ((_ index: Int) -> Void)) {
        self.links = links
        self.listener = listener
    }
}
