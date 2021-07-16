//
//  InformationViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 15/7/21.
//

import UIKit

final class InformationViewController: UIViewController {

    

    //MARK: - Private Properties
    private lazy var infoImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 600)
        return view
    }()

    private let mainText: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 30, y: 650, width: 350, height: 45)
        lable.font = .boldSystemFont(ofSize: 35)
        lable.textAlignment = .center
        return lable
    }()

    private let text: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 30, y: 690, width: 350, height: 75)
        lable.font = .boldSystemFont(ofSize: 20)
        lable.textColor = .systemGray2
        lable.numberOfLines = 2
        lable.lineBreakMode = .byWordWrapping
        lable.textAlignment = .center
        return lable
    }()

    lazy var subWiew: [UIView] = [self.infoImage, self.mainText, self.text]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        for view in subWiew { self.view.addSubview(view) }
    }

    //MARK: - init
    init(infoWith: InfoHelper) {
        super.init(nibName: nil, bundle: nil)

        infoImage.image = UIImage(named: infoWith.imageName)
        mainText.text = infoWith.mainLable
        text.text = infoWith.lable
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
