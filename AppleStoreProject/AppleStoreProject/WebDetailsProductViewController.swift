//
//  WebDetailsProductViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 13/7/21.
//

import UIKit
import WebKit

final class WebDetailsProductViewController: UIViewController {

    //MARK: - Public Properties
    var name: String! {
        didSet {
            imageName = name
        }
    }

    //MARK: - Private Properties
    @objc private let wkWebView = WKWebView()
    private let toolBar = UIToolbar()
    private var productUrl = String()
    private var imageName = String()

    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        createVisualElements()
        selectUrlByImage()
    }

    //MARK: - Private Methods
    private func viewAdjust() {
        view.backgroundColor = .white
        view = wkWebView
    }

    private func createToolBar() {
        toolBar.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - 130, width: 410, height: 54)
        toolBar.contentMode = .scaleToFill
        view.addSubview(toolBar)
    }

    private func createToolBarButtons() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.2"),
                                     style: .plain, target: self, action: #selector(goBack))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward.2"),
                                        style: .plain, target: self, action: #selector(goForward))
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"),
                                        style: .plain, target: self, action: #selector(refresh))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                      style: .plain, target: self, action: #selector(share))
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolBar.setItems([backButton, forwardButton, flexibleSpace, refreshButton, shareButton], animated: true)
    }

    private func selectUrlByImage() {
        switch imageName {
        case "case":
            productUrl = "https://www.apple.com/ru/shop/product/HLKY2ZM/A/"
        case "belt":
            productUrl = "https://www.apple.com/ru/shop/product/MJ4V3ZM/A/"
        case "caseBown":
            productUrl = "https://www.apple.com/ru/shop/product/MWV92ZM/A/"
        default:
            break
        }

        guard let myUrl = URL(string: productUrl) else { return }
        let request = URLRequest(url: myUrl)
        wkWebView.load(request)
    }

    private func createVisualElements() {
        viewAdjust()
        createToolBar()
        createToolBarButtons()
    }

    @objc private func goBack() {

       wkWebView.canGoBack ? goBack() : dismiss(animated: true)
    }

    @objc private func goForward() {
        guard wkWebView.canGoForward else { return }
            wkWebView.goForward()
    }

    @objc private func refresh() {
        wkWebView.reload()
    }

    @objc private func share() {
        let urlShare = [productUrl]
        let activityViewController = UIActivityViewController(activityItems: urlShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true)
    }
}


