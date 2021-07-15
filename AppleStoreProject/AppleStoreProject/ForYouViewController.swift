//
//  ForYouViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 9/7/21.
//

import UIKit

final class ForYouViewController: UIViewController {

    //MARK: - Private Properties
    private let forYouUnderLineView = UIView()
    private let userImageButton = UIButton()
    private let someThingNewLable = UILabel()
    private let orderView = UIView()
    private let orderLineView = UIView()
    private let orderImage = UIImageView()
    private let orderStatusImage = UIImageView()
    private let orderStatusLable = UILabel()
    private let orderStatusInformationLable = UILabel()
    private let orderStatusButton = UIButton()
    private let orderProgressView = UIProgressView()
    private let orderProcessedLable = UILabel()
    private let orderSendLable = UILabel()
    private let orderDeliveredLable = UILabel()
    private let recomendationLable = UILabel()
    private let informationDeliveryImage = UIImageView()
    private let informationDeliveryLable = UILabel()
    private let notificationDeliveryLable = UILabel()
    private let notificationDeliveryImageView = UIImageView()
    private let notificationDeliveryUnderLineView = UIView()
    private let yourDevicesLable = UILabel()
    private let showDevicesButton = UIButton()
    private let mainScrollView = UIScrollView()
    private let imagePicker = UIImagePickerController()

    //MARK: - UIForYouViewController
    override func viewDidLoad() {
        super.viewDidLoad()


        adjustNavBar()
        addScrollView()
        addVisualElements()
        saveAvatarImage()

        view.backgroundColor = .white
    }

    //MARK: - Methods
    private func adjustNavBar() {
        navigationItem.title = "Для вас"
        navigationController?.navigationBar.prefersLargeTitles = true
        let barButton = UIBarButtonItem()
        barButton.customView = userImageButton
        navigationItem.rightBarButtonItem = barButton
    }

    private func addScrollView() {
        mainScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view = mainScrollView
    }

    private func saveAvatarImage() {
        guard let data = UserDefaults.standard.value(forKey: "avatar") as? Data else { return }
        guard let image = UIImage(data: data) else { return }
        userImageButton.setImage(image.resizeImage(to: CGSize(width: 30, height: 30)), for: .normal)
    }

    private func createUserImageButton() {
        let userImage = UIImage(named: "man")?.resizeImage(to: CGSize(width: 30, height: 30))
        userImageButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        userImageButton.setImage(userImage, for: .normal)
        userImageButton.layer.cornerRadius = 15
        userImageButton.clipsToBounds = true
        userImageButton.addTarget(self, action: #selector(changeAvatarImage), for: .touchUpInside)
    }

    private func createForYouUnderLineView() {
        forYouUnderLineView.frame = CGRect(x: 15, y: 160, width: 365, height: 1)
        forYouUnderLineView.backgroundColor = #colorLiteral(red: 0.9373239875, green: 0.9317518473, blue: 0.941607058, alpha: 1)
        view.addSubview(forYouUnderLineView)
    }

    private func createSomeThingNewLable() {
        someThingNewLable.frame = CGRect(x: 30, y: 180, width: 200, height: 40)
        someThingNewLable.text = "Вот что нового"
        someThingNewLable.font = .boldSystemFont(ofSize: 28)
        view.addSubview(someThingNewLable)
    }

    private func createOrderView() {
        orderView.frame = CGRect(x: 30, y: 280, width: 355, height: 140)
        orderView.layer.cornerRadius = 15
        orderView.layer.shadowColor = UIColor.systemGray.cgColor
        orderView.layer.shadowOpacity = 1
        orderView.layer.shadowRadius = 5
        orderView.layer.shadowOffset = .zero
        orderView.backgroundColor = .white
        view.addSubview(orderView)
    }

    private func createOrderImage() {
        orderImage.frame = CGRect(x: 20, y: 20, width: 55, height: 55)
        orderImage.image = UIImage(named: "beats")
        orderView.addSubview(orderImage)
    }

    private func createOrderStatusLable() {
        orderStatusLable.frame = CGRect(x: 90, y: 20, width: 180, height: 20)
        orderStatusLable.text = "Ваш заказ отправлен."
        orderStatusLable.font = .boldSystemFont(ofSize: 14)
        orderView.addSubview(orderStatusLable)
    }

    private func createOrderStatusInformationLable() {
        orderStatusInformationLable.frame = CGRect(x: 90, y: 50, width: 180, height: 20)
        orderStatusInformationLable.text = "1 товар, доставка завтра"
        orderStatusInformationLable.font = UIFont(name: "arial", size: 14)
        orderStatusInformationLable.textColor = .systemGray
        orderView.addSubview(orderStatusInformationLable)
    }

    private func createOrderStatusImage() {
        orderStatusImage.frame = CGRect(x: 325, y: 50, width: 15, height: 15)
        orderStatusImage.image = UIImage(systemName: "chevron.right")
        orderStatusImage.tintColor = .systemGray
        orderView.addSubview(orderStatusImage)
    }

    private func createOrderLineView() {
        orderLineView.frame = CGRect(x: 0, y: 85, width: 355, height: 1)
        orderLineView.backgroundColor = #colorLiteral(red: 0.9373239875, green: 0.9317518473, blue: 0.941607058, alpha: 1)
        orderView.addSubview(orderLineView)
    }

    private func createOrderProgressView() {
        orderProgressView.progressViewStyle = .default
        orderProgressView.frame = CGRect(x: 20, y: 100, width: 315, height: 2)
        orderProgressView.setProgress(0.5, animated: false)
        orderProgressView.progressTintColor = .systemGreen
        orderView.addSubview(orderProgressView)
    }

    private func createOrderProcessedLable() {
        orderProcessedLable.frame = CGRect(x: 25, y: 110, width: 100, height: 20)
        orderProcessedLable.text = "обрабатывается"
        orderProcessedLable.font = UIFont(name: "arial", size: 12)
        orderView.addSubview(orderProcessedLable)
    }

    private func createOrderSendLable() {
        orderSendLable.frame = CGRect(x: 145, y: 110, width: 80, height: 20)
        orderSendLable.text = "отправлено"
        orderSendLable.textAlignment = .center
        orderSendLable.font = UIFont(name: "arial", size: 12)
        orderView.addSubview(orderSendLable)
    }

    private func createOrderDeliveredLable() {
        orderDeliveredLable.frame = CGRect(x: 260, y: 110, width: 80, height: 20)
        orderDeliveredLable.text = "доставлено"
        orderDeliveredLable.font = UIFont(name: "arial", size: 12)
        orderDeliveredLable.textColor = .systemGray
        orderView.addSubview(orderDeliveredLable)
    }

    private func createRecomendationLable() {
        recomendationLable.frame = CGRect(x: 30, y: 490, width: 200, height: 40)
        recomendationLable.text = "Рекомендуется вам"
        recomendationLable.font = .boldSystemFont(ofSize: 20)
        view.addSubview(recomendationLable)
    }

    private func createInformationDeliveryImage() {
        informationDeliveryImage.frame = CGRect(x: 50, y: 550, width: 40, height: 40)
        informationDeliveryImage.image = UIImage(systemName: "app.badge")
        informationDeliveryImage.tintColor = .systemRed
        view.addSubview(informationDeliveryImage)
    }

    private func createInformationDeliveryLable() {
        informationDeliveryLable.frame = CGRect(x: 120, y: 515, width: 200, height: 100)
        informationDeliveryLable.text = "Получайте новости о своем заказе в режиме реального времени."
        informationDeliveryLable.numberOfLines = 3
        informationDeliveryLable.lineBreakMode = .byWordWrapping
        informationDeliveryLable.font = .boldSystemFont(ofSize: 14)
        view.addSubview(informationDeliveryLable)
    }

    private func createNotificationDeliveryLable() {
        notificationDeliveryLable.frame = CGRect(x: 120, y: 575, width: 260, height: 100)
        notificationDeliveryLable.text = "Включите уведомления, чтобы получать новости о своем заказе."
        notificationDeliveryLable.numberOfLines = 2
        notificationDeliveryLable.lineBreakMode = .byWordWrapping
        notificationDeliveryLable.font = .boldSystemFont(ofSize: 13)
        notificationDeliveryLable.textColor = .systemGray
        view.addSubview(notificationDeliveryLable)
    }

    private func createNotificationDeliveryImageView() {
        notificationDeliveryImageView.frame = CGRect(x: 365, y: 577, width: 15, height: 15)
        notificationDeliveryImageView.image = UIImage(systemName: "chevron.right")
        notificationDeliveryImageView.tintColor = .systemGray
        view.addSubview(notificationDeliveryImageView)
    }

    private func createnotificationDeliveryUnderLineView() {
        notificationDeliveryUnderLineView.frame = CGRect(x: 15, y: 660, width: 365, height: 1)
        notificationDeliveryUnderLineView.backgroundColor = #colorLiteral(red: 0.9373239875, green: 0.9317518473, blue: 0.941607058, alpha: 1)
        view.addSubview(notificationDeliveryUnderLineView)
    }

    private func createyourDevicesLable() {
        yourDevicesLable.frame = CGRect(x: 30, y: 700, width: 270, height: 40)
        yourDevicesLable.text = "Ваши устройства"
        yourDevicesLable.font = .boldSystemFont(ofSize: 25)
        view.addSubview(yourDevicesLable)
    }

    private func  createShowDevicesButton() {
        showDevicesButton.frame = CGRect(x: 280, y: 710, width: 120, height: 20)
        showDevicesButton.setTitle("Показать все", for: .normal)
        showDevicesButton.setTitleColor(UIColor.systemBlue, for: .normal)
        view.addSubview(showDevicesButton)
    }

    private func addVisualElements() {
        createUserImageButton()
        createForYouUnderLineView()
        createSomeThingNewLable()
        createOrderView()
        createOrderImage()
        createOrderStatusLable()
        createOrderStatusInformationLable()
        createOrderStatusImage()
        createOrderLineView()
        createOrderProgressView()
        createOrderProcessedLable()
        createOrderSendLable()
        createOrderDeliveredLable()
        createRecomendationLable()
        createInformationDeliveryImage()
        createInformationDeliveryLable()
        createNotificationDeliveryLable()
        createNotificationDeliveryImageView()
        createnotificationDeliveryUnderLineView()
        createyourDevicesLable()
        createShowDevicesButton()
    }

    @objc private func changeAvatarImage() {

        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

extension ForYouViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

        if let image = info[.originalImage] as? UIImage {
            let img = image.resizeImage(to: CGSize(width: 30, height: 30))
            let imageData = image.pngData()
            UserDefaults.standard.setValue(imageData, forKey: "avatar")
            userImageButton.setImage(img, for: .normal)
        }
        picker.dismiss(animated: true)
    }
}

extension ForYouViewController: UINavigationControllerDelegate {}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}


