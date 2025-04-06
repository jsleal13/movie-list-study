//
//  ComingSoonView.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//
import UIKit
import Foundation

final class ComingSoonView: UIView {
    private let imageHeight: CGFloat = 150

    private lazy var warningImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFit
        element.load(url: "https://purepng.com/public/uploads/large/under-construction-yom.png")
        return element
    }()

    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Oops!"
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 0
        element.textAlignment = .center
        element.lineBreakMode = .byWordWrapping
        element.textColor = AppColors.textColor
        element.text = "This page is not available yet. Try again later"
        return element
    }()

    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [warningImage, titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.contentMode = .scaleAspectFit
        stack.alignment = .center
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews(){
        addSubview(mainStackView)
    }

    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            warningImage.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
    }

    func setNavBar(viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        viewController.title = viewController.tabBarItem.title
        let navigationBarAppearance = UINavigationBarAppearance()
        viewController.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        viewController.navigationController?.navigationBar.barTintColor = .systemPurple
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}
