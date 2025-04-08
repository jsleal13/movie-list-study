//
//  ComingSoonViewController.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import UIKit
import Foundation

class ComingSoonViewController: BaseViewController {
    private var mainView: ComingSoonView?

    override func loadView() {
        mainView = ComingSoonView()
        view = mainView
    }
}
