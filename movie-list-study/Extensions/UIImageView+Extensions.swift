//
//  UIImageView+Extensions.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import UIKit
import Foundation

extension UIImageView {
    func load(url: String) {
        guard let urlImage = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlImage) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
