//
//  DetailProductViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 9/7/21.
//

import UIKit

final class DetailProductViewController: UIViewController {

    //MARK: - Public Properties

    var productText: String! {
        didSet {
            productTextLable.text = productText
        }
    }

    var productPrice: String! {
        didSet {
            productPriceLable.text = productPrice
        }
    }

    var productDiscription: String! {
        didSet {
            productDiscriptionLable.text = productText
        }
    }

    var image: String! {
        didSet {
            imageName = image
        }
    }

    var imagesNamesArray: [String]! {
        didSet {
            imagesArray = imagesNamesArray
        }
    }

    //MARK: - Private Properties
    private let productPriceLable = UILabel()
    private let productDiscriptionLable = UILabel()
    private var imageName = String()
    private var imagesArray = [String]()
    private let productTextLable = UILabel()
    private var shareButton = UIBarButtonItem()
    private var heartButton = UIBarButtonItem()
    private let grayProductColorButton = UIButton()
    private let blackProductColorButton = UIButton()
    private let compatibilityImageView = UIImageView()
    private let compatibilityLable = UILabel()
    private let compabilityProductLable = UILabel()
    private let addToBasketButton = UIButton()
    private let deliveryImageView = UIImageView()
    private let mainDeliveryLable = UILabel()
    private let dateDeliveryLable = UILabel()
    private let adressDeliveryLable = UILabel()
    private let quantityLable = UILabel()
    private var quantityTextField = UITextField()
    private let productImagesScrollView = UIScrollView()
    private var imageTap = UIGestureRecognizer()
    private var parametrImage = String()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        createVisuaElemants()
        addTextFielNnotificationCenter()
    }

    //MARK: - Private Methods
    private func adjustNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .black
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                      style: .plain, target: self, action: nil)
        shareButton.tintColor = .systemBlue
        heartButton = UIBarButtonItem(image: UIImage(systemName: "suit.heart"),
                                      style: .plain, target: self, action: nil)
        heartButton.tintColor = .systemBlue
        navigationItem.setRightBarButtonItems([heartButton ,shareButton], animated: true)
    }

    private func createProductText() {
        productTextLable.frame = CGRect(x: 15, y: 70, width: 380, height: 120)
        productTextLable.font = UIFont.boldSystemFont(ofSize: 17)
        productTextLable.textAlignment = .center
        productTextLable.numberOfLines = 2
        productTextLable.lineBreakMode = .byWordWrapping
        productTextLable.textColor = .white
        view.addSubview(productTextLable)
    }

    private func createPriceLable() {
        productPriceLable.frame = CGRect(x: 150, y: 160, width: 120, height: 30)
        productPriceLable.textAlignment = .center
        productPriceLable.textColor = .gray
        view.addSubview(productPriceLable)
    }

    private func createProductImagesScrollView() {
        let imagesScrollViewRect = CGRect(x: 0, y: 210, width: view.bounds.size.width, height: 250)
        productImagesScrollView.frame = imagesScrollViewRect
        productImagesScrollView.contentSize = CGSize(width: imagesScrollViewRect.size.width * 3,
                                                     height: imagesScrollViewRect.size.height)
        productImagesScrollView.isPagingEnabled = true
        productImagesScrollView.indicatorStyle = .white
        view.addSubview(productImagesScrollView)
    }

    private func createProductDiscriptionLable() {
        productDiscriptionLable.frame = CGRect(x: 15, y: 450, width: 380, height: 50)
        productDiscriptionLable.textAlignment = .center
        productDiscriptionLable.textColor = .gray
        productDiscriptionLable.font = UIFont.systemFont(ofSize: 12)
        productDiscriptionLable.numberOfLines = 2
        productDiscriptionLable.lineBreakMode = .byWordWrapping
        productDiscriptionLable.text = productTextLable.text
        view.addSubview(productDiscriptionLable)
    }

    private func createGrayProductColorButton() {
        grayProductColorButton.frame = CGRect(x: 165, y: 520, width: 30, height: 30)
        grayProductColorButton.layer.cornerRadius = 15
        grayProductColorButton.backgroundColor = .gray
        view.addSubview(grayProductColorButton)
    }

    private func createBlackProductColorButton() {
        blackProductColorButton.frame = CGRect(x: 215, y: 520, width: 30, height: 30)
        blackProductColorButton.layer.cornerRadius = 15
        blackProductColorButton.backgroundColor = #colorLiteral(red: 0.1419389649, green: 0.1433443012, blue: 0.1433443012, alpha: 1)
        view.addSubview(blackProductColorButton)
    }

    private func createCompabilityImageView() {
        compatibilityImageView.frame = CGRect(x: 65, y: 580, width: 18, height: 18)
        compatibilityImageView.image = UIImage(systemName: "checkmark.circle.fill")
        compatibilityImageView.layer.cornerRadius = 9
        compatibilityImageView.tintColor = .green
        compatibilityImageView.backgroundColor = .black
        view.addSubview(compatibilityImageView)
    }

    private func createCompabilityLable() {
        compatibilityLable.frame = CGRect(x: 90, y: 580, width: 100, height: 20)
        compatibilityLable.text = "Совместимо с"
        compatibilityLable.textAlignment = .center
        compatibilityLable.textColor = .gray
        compatibilityLable.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(compatibilityLable)
    }

    private func createCompabilityProductLable() {
        compabilityProductLable.frame = CGRect(x: 190, y: 580, width: 150, height: 20)
        compabilityProductLable.text = "MacBook Pro - Евгений"
        compabilityProductLable.textAlignment = .center
        compabilityProductLable.textColor = .systemBlue
        compabilityProductLable.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(compabilityProductLable)
    }

    private func createQuantityLable() {
        quantityLable.frame = CGRect(x: 50, y: 640, width: 250, height: 20)
        quantityLable.text = "Введите количество товара:"
        quantityLable.textColor = .white
        quantityLable.font = .boldSystemFont(ofSize: 15)
        view.addSubview(quantityLable)
    }

    private func createQuantityTextField() {
        quantityTextField.frame = CGRect(x: 300, y: 635, width: 90, height: 30)
        quantityTextField.backgroundColor = #colorLiteral(red: 0.1123520657, green: 0.1123785749, blue: 0.1123485938, alpha: 0.8470588235)
        quantityTextField.textAlignment = .center
        quantityTextField.layer.cornerRadius = 5
        quantityTextField.placeholder = "Количество"
        quantityTextField.textColor = .white
        quantityTextField.font = .boldSystemFont(ofSize: 15)
        quantityTextField.keyboardType = .numberPad
        view.addSubview(quantityTextField)
    }

    private func createAddToBusketButton() {
        addToBasketButton.frame = CGRect(x: 15, y: 680, width: 380, height: 35)
        addToBasketButton.backgroundColor = #colorLiteral(red: 0.1868417395, green: 0.5818876385, blue: 1, alpha: 1)
        addToBasketButton.setTitle("Добавить в корзину", for: .normal)
        addToBasketButton.layer.cornerRadius = 5
        addToBasketButton.addTarget(self, action: #selector(addToBasketAction), for: .touchUpInside)
        view.addSubview(addToBasketButton)
    }

    private func createDeliveryImageView() {
        deliveryImageView.frame = CGRect(x: 15, y: 747, width: 17, height: 17)
        deliveryImageView.image = UIImage(systemName: "shippingbox")
        deliveryImageView.tintColor = .gray
        view.addSubview(deliveryImageView)
    }

    private func createMainDeliveryLable() {
        mainDeliveryLable.frame = CGRect(x: 50, y: 745, width: 300, height: 20)
        mainDeliveryLable.text = "Заказ сегодня в течении дня, доставка: "
        mainDeliveryLable.textColor = .white
        mainDeliveryLable.font = UIFont.boldSystemFont(ofSize: 12)
        view.addSubview(mainDeliveryLable)
    }

    private func createDateDeliveryLable() {
        dateDeliveryLable.frame = CGRect(x: 50, y: 760, width: 300, height: 20)
        dateDeliveryLable.text = "Чт 25 Фев - Бесплатно"
        dateDeliveryLable.textColor = .gray
        dateDeliveryLable.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(dateDeliveryLable)
    }

    private func createAdressDeliveryLable() {
        adressDeliveryLable.frame = CGRect(x: 50, y: 775, width: 300, height: 20)
        adressDeliveryLable.text = "Варианты доставки для местоположения: 115533"
        adressDeliveryLable.textColor = .systemBlue
        adressDeliveryLable.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(adressDeliveryLable)
    }

    private func createVisuaElemants() {
        adjustNavigationBar()
        createProductText()
        createPriceLable()
        createProductImagesScrollView()
        addImagesToScrollView(array: imagesArray)
        createGrayProductColorButton()
        createBlackProductColorButton()
        createCompabilityImageView()
        createCompabilityLable()
        createCompabilityProductLable()
        createQuantityLable()
        createQuantityTextField()
        createAddToBusketButton()
        createProductDiscriptionLable()
        createDeliveryImageView()
        createMainDeliveryLable()
        createDateDeliveryLable()
        createAdressDeliveryLable()
    }

    private func addImagesToScrollView(array: [String]) {
        var imageViewRect = CGRect(x: 60, y: -50, width: 300, height: 350)
        imageTap = UITapGestureRecognizer(target: self, action: #selector(productViewTapped))
        guard let firstImage = UIImage(named: imagesArray.first ?? "") else { return }
        let firstImageView = imagesViewWithImage(paramImage: firstImage,
                                                 paramFrame: imageViewRect)
        firstImageView.isUserInteractionEnabled = true
        firstImageView.addGestureRecognizer(imageTap)
        parametrImage = imagesArray.first ?? ""
        productImagesScrollView.addSubview(firstImageView)
        guard let secondImage = UIImage(named: "\(imagesArray[1])") else { return }
        imageViewRect = CGRect(x: 460, y: -50, width: 300, height: 350)
        let secondImageView = imagesViewWithImage(paramImage: secondImage,
                                                  paramFrame: imageViewRect)
        productImagesScrollView.addSubview(secondImageView)

        guard let thirdImage = UIImage(named: "\(imagesArray[2])") else { return }
        imageViewRect = CGRect(x: 860, y: -50, width: 300, height: 350)
        let thirdImageView = imagesViewWithImage(paramImage: thirdImage,
                                                 paramFrame: imageViewRect)
        productImagesScrollView.addSubview(thirdImageView)
    }

    private func imagesViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }

    private func addTextFielNnotificationCenter() {
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification,
                                               object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -250
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification,
                                               object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
    }
    
    @objc private func addToBasketAction() {
        quantityTextField.endEditing(true)
    }

    @objc private func productViewTapped() {
        let webDetailVS = WebDetailsProductViewController()
        webDetailVS.name = parametrImage
        present(webDetailVS, animated: true)
    }
}


