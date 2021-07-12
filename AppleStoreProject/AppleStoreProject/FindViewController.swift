//
//  FindViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 9/7/21.
//

import UIKit

final class FindViewController: UIViewController {

    //MARK: - Private Properties
    private let findLable = UILabel()
    private let seachTextField = UITextField()
    private let recentlyViewedLable = UILabel()
    private let cleanButton = UIButton()
    private let caseView = UIView()
    private let beltView = UIView()
    private let caseBownView = UIView()
    private let caseImageView = UIImageView()
    private let beltImageView = UIImageView()
    private let caseBownImageView = UIImageView()
    private let caseLable = UILabel()
    private let beltLable = UILabel()
    private let caseBownLable = UILabel()
    private let caseImage = UIImage()
    private let beltImage = UIImage()
    private let caseBownImage = UIImage()
    private let requestOptionsLable = UILabel()
    private let airPodsImageView = UIImageView()
    private let airPodsLable = UILabel()
    private let appleCareImageView = UIImageView()
    private let appleCareLable = UILabel()
    private let beatsImageView = UIImageView()
    private let beatsLable = UILabel()
    private let comparisonImageView = UIImageView()
    private let comparisonLable = UILabel()
    private var viewsScrollView = UIScrollView()
    private let caseImagesArray = ["case", "case2", "case3"]
    private let beltImagesArray = ["belt", "belt2", "belt3"]
    private let caseBownImagesArray = ["caseBown", "caseBown2", "caseBown3"]

    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backButtonTitle = "Поиск"

        addVisualElements()
    }

    //MARK: - Private Methods
    private func createFindLable() {
        findLable.frame = CGRect(x: 25, y: 100, width: 100, height: 50)
        findLable.font = UIFont.boldSystemFont(ofSize: 30)
        findLable.text = "Поиск"
        findLable.textColor = .white
        view.addSubview(findLable)
    }
    private func createSeachTextField() {
        seachTextField.frame = CGRect(x: 20, y: 150, width: 380, height: 30)
        seachTextField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        seachTextField.tintColor = UIColor.white
        seachTextField.leftViewMode = .always
        seachTextField.textColor = .white
        seachTextField.backgroundColor = #colorLiteral(red: 0.1123520657, green: 0.1123785749, blue: 0.1123485938, alpha: 0.8470588235)
        seachTextField.placeholder = " Поиск по продуктам и магазинам"
        seachTextField.layer.cornerRadius = 10
        view.addSubview(seachTextField)
    }
    private func createRecentlyViewedLable() {
        recentlyViewedLable.frame = CGRect(x: 25, y: 240, width: 250, height: 50)
        recentlyViewedLable.font = UIFont.boldSystemFont(ofSize: 20)
        recentlyViewedLable.text = "Недавно просмотренные"
        recentlyViewedLable.textColor = .white
        view.addSubview(recentlyViewedLable)
    }
    private func createCleanButton() {
        cleanButton.frame = CGRect(x: 315, y: 250, width: 80, height: 30)
        cleanButton.setTitle("Очистить", for: .normal)
        cleanButton.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .normal)
        view.addSubview(cleanButton)
    }
    private func createScrollView() {
        let viewsScrollViewRect = CGRect(x: 0, y: 290, width: view.bounds.size.width, height: 240)
        viewsScrollView.frame = viewsScrollViewRect
        viewsScrollView.contentSize = CGSize(width: viewsScrollViewRect.size.width * 1.5,
                                             height: viewsScrollViewRect.size.height)
        view.addSubview(viewsScrollView)
    }
    private func createCaseView() {
        caseView.frame = CGRect(x: 0, y: 0, width: 140, height: 180)
        caseView.backgroundColor = #colorLiteral(red: 0.1123520657, green: 0.1123785749, blue: 0.1123485938, alpha: 0.8470588235)
        caseView.layer.cornerRadius = 5
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(productViewTapped(sender:)))
        caseView.isUserInteractionEnabled = true
        caseView.addGestureRecognizer(imageTap)
        viewsScrollView.addSubview(caseView)
    }
    private func createBeltView() {
        beltView.frame = CGRect(x: 150, y: 0, width: 140, height: 180)
        beltView.backgroundColor = #colorLiteral(red: 0.1123520657, green: 0.1123785749, blue: 0.1123485938, alpha: 0.8470588235)
        beltView.layer.cornerRadius = 5
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(productViewTapped(sender:)))
        beltView.isUserInteractionEnabled = true
        beltView.addGestureRecognizer(imageTap)
        viewsScrollView.addSubview(beltView)
    }
    private func createCaseBownView() {
        caseBownView.frame = CGRect(x: 300, y: 0, width: 140, height: 180)
        caseBownView.backgroundColor = #colorLiteral(red: 0.1123520657, green: 0.1123785749, blue: 0.1123485938, alpha: 0.8470588235)
        caseBownView.layer.cornerRadius = 5
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(productViewTapped(sender:)))
        caseBownView.isUserInteractionEnabled = true
        caseBownView.addGestureRecognizer(imageTap)
        viewsScrollView.addSubview(caseBownView)
    }
    private func createCaseImageView() {
        caseImageView.frame = CGRect(x: 20, y: 30, width: 100, height: 80)
        caseImageView.image = UIImage(named: "case")
        caseImageView.contentMode = .scaleAspectFill
        caseView.addSubview(caseImageView)
    }
    private func createCaseLable() {
        caseLable.frame = CGRect(x: 20, y: 120, width: 100, height: 50)
        caseLable.font = UIFont(name: "arial", size: 11)
        caseLable.textColor = .white
        caseLable.numberOfLines = 5
        caseLable.lineBreakMode = .byWordWrapping
        caseLable.text = "Чехол Incase Flat для MacBookPro 16 дюймов."
        caseView.addSubview(caseLable)
    }
    private func createBeltImageView() {
        beltImageView.frame = CGRect(x: 20, y: 30, width: 100, height: 80)
        beltImageView.image = UIImage(named: "belt")
        beltImageView.contentMode = .scaleAspectFit
        beltView.addSubview(beltImageView)
    }
    private func createBeltLable() {

        beltLable.frame = CGRect(x: 20, y: 120, width: 100, height: 50)
        beltLable.font = UIFont(name: "arial", size: 11)
        beltLable.textColor = .white
        beltLable.numberOfLines = 5
        beltLable.lineBreakMode = .byWordWrapping
        beltLable.text = "Спортивный ремешок Black Unity"
        beltView.addSubview(beltLable)
    }
    private func createCaseBownImageView() {
        caseBownImageView.frame = CGRect(x: 20, y: 30, width: 100, height: 80)
        caseBownImageView.image = UIImage(named: "caseBown")
        caseBownImageView.contentMode = .scaleAspectFill
        caseBownView.addSubview(caseBownImageView)
    }
    private func createCaseBownLable() {
        caseBownLable.frame = CGRect(x: 20, y: 120, width: 100, height: 50)
        caseBownLable.font = UIFont(name: "arial", size: 11)
        caseBownLable.textColor = .white
        caseBownLable.numberOfLines = 5
        caseBownLable.lineBreakMode = .byWordWrapping
        caseBownLable.text = "Кожаный чехол для MacBook Pro 16 дюймов, золотисто-коричневый цвет"
        caseBownView.addSubview(caseBownLable)
    }
    private func createrequestOptionsLable() {
        requestOptionsLable.frame = CGRect(x: 25, y: 500, width: 250, height: 50)
        requestOptionsLable.font = UIFont.boldSystemFont(ofSize: 20)
        requestOptionsLable.text = "Варианты запросов"
        requestOptionsLable.textColor = .white
        view.addSubview(requestOptionsLable)
    }
    private func createAirPodsImageView() {
        airPodsImageView.frame = CGRect(x: 25, y: 578, width: 19, height: 19)
        airPodsImageView.image = UIImage(systemName: "magnifyingglass")
        airPodsImageView.contentMode = .scaleAspectFill
        airPodsImageView.tintColor = .white
        view.addSubview(airPodsImageView)
    }
    private func createAirPodsLable() {
        airPodsLable.frame = CGRect(x: 70, y: 560, width: 200, height: 50)
        airPodsLable.text = "AirPods"
        airPodsLable.textColor = .white
        view.addSubview(airPodsLable)
    }
    private func createAppleCareImageView() {
        appleCareImageView.frame = CGRect(x: 25, y: 638, width: 19, height: 19)
        appleCareImageView.image = UIImage(systemName: "magnifyingglass")
        appleCareImageView.contentMode = .scaleAspectFill
        appleCareImageView.tintColor = .white
        view.addSubview(appleCareImageView)
    }
    private func createAppleCareLable() {
        appleCareLable.frame = CGRect(x: 70, y: 620, width: 200, height: 50)
        appleCareLable.text = "AppleCare"
        appleCareLable.textColor = .white
        view.addSubview(appleCareLable)
    }
    private func createBeatsImageView() {
        beatsImageView.frame = CGRect(x: 25, y: 698, width: 19, height: 19)
        beatsImageView.image = UIImage(systemName: "magnifyingglass")
        beatsImageView.contentMode = .scaleAspectFill
        beatsImageView.tintColor = .white
        view.addSubview(beatsImageView)
    }
    private func createBeatsLable() {
        beatsLable.frame = CGRect(x: 70, y: 680, width: 200, height: 50)
        beatsLable.text = "Beats"
        beatsLable.textColor = .white
        view.addSubview(beatsLable)
    }
    private func creatуComparisonImageView() {
        comparisonImageView.frame = CGRect(x: 25, y: 758, width: 19, height: 19)
        comparisonImageView.image = UIImage(systemName: "magnifyingglass")
        comparisonImageView.contentMode = .scaleAspectFill
        comparisonImageView.tintColor = .white
        view.addSubview(comparisonImageView)
    }
    private func createComparisonLable() {
        comparisonLable.frame = CGRect(x: 70, y: 740, width: 200, height: 50)
        comparisonLable.text = "Сравните модели iPhone"
        comparisonLable.textColor = .white
        view.addSubview(comparisonLable)
    }
    private func addVisualElements() {
        createScrollView()
        createFindLable()
        createSeachTextField()
        createRecentlyViewedLable()
        createCleanButton()
        createCaseView()
        createBeltView()
        createCaseLable()
        createCaseImageView()
        createCaseLable()
        createBeltImageView()
        createBeltLable()
        createCaseBownView()
        createCaseBownImageView()
        createCaseBownLable()
        createrequestOptionsLable()
        createAirPodsImageView()
        createAirPodsLable()
        createAppleCareImageView()
        createAppleCareLable()
        createBeatsImageView()
        createBeatsLable()
        creatуComparisonImageView()
        createComparisonLable()
    }
    @objc private func productViewTapped(sender: UITapGestureRecognizer) {
        
        let detailProductVC = DetailProductViewController()
        switch sender.view {
        case caseView:
            detailProductVC.image = "case"
            detailProductVC.productTextLable.text = caseLable.text ?? ""
            detailProductVC.productPriceLable.text = "3 990.00 руб."
            detailProductVC.imagesArray = caseImagesArray
        case beltView:
            detailProductVC.image = "belt"
            detailProductVC.productTextLable.text = beltLable.text ?? ""
            detailProductVC.productPriceLable.text = "3 900.00 руб."
            detailProductVC.imagesArray = beltImagesArray
        case caseBownView:
            detailProductVC.image = "caseBown"
            detailProductVC.productTextLable.text = caseBownLable.text ?? ""
            detailProductVC.productPriceLable.text = "20 990.00 руб."
            detailProductVC.imagesArray = caseBownImagesArray
        default:
            break
        }
        navigationController?.pushViewController(detailProductVC, animated: true)
        }
}
