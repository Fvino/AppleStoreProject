//
//  DetailProductViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 9/7/21.
//

import UIKit

final class DetailProductViewController: UIViewController {

    //MARK: - Private Properties
    var image = String()
    var text = String()
    let productImageView = UIImageView()
    let productTextLable = UILabel()

    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = .black

        addProductText()
        addProductImage()
    }

    //MARK: - Private Methods
    private func addProductText() {
        productTextLable.frame = CGRect(x: 95, y: 200, width: 170, height: 120)
        productTextLable.numberOfLines = 5
        productTextLable.lineBreakMode = .byWordWrapping
        productTextLable.textColor = .white
        view.addSubview(productTextLable)
    }
    private func addProductImage() {
        productImageView.frame = CGRect(x: 85, y: 350, width: 250, height: 200)
        productImageView.image = UIImage(named: image)
        productImageView.contentMode = .scaleAspectFit
        view.addSubview(productImageView)
    }
}
