//
//  MyPagesViewController.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 15/7/21.
//

import UIKit

class MyPagesViewController: UIPageViewController {

    //MARK: - Private Properties
    private let skipButton = UIButton()
    private let nextButton = UIButton()
    private let getStartedButton = UIButton()
    private let appearance = UIPageControl()
    private let info = [InfoHelper(imageName: "track", mainLable: "Track Your Cycle", lable: "Manage irregular period and learn to improve your period."),
                        InfoHelper(imageName: "plan", mainLable: "Plan Your Pregnancy", lable: "Favorable days are important."),
                        InfoHelper(imageName: "daily", mainLable: "Daily Health Insight",  lable: "Personal health insight.")]

    lazy var arrayInfoViewController: [InformationViewController] = {
        var infoVC = [InformationViewController]()
        for i in info {
            infoVC.append(InformationViewController(infoWith: i))
        }
        return infoVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        createSkipButton()
        createNextButton()
        createGetStarted()
    }

    //MARK: - UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = UIColor.white
        dataSource = self
        delegate = self
        setViewControllers([arrayInfoViewController[0]], direction: .forward, animated: true, completion: nil)
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    private func createSkipButton() {
        skipButton.frame = CGRect(x: 50, y: 850, width: 50, height: 30)
        skipButton.setTitle("SKIP", for: .normal)
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.tintColor = .systemBlue
        skipButton.addTarget(self, action: #selector(myTabPresent), for: .touchUpInside)
        view.addSubview(skipButton)
    }

    private func createNextButton() {
        nextButton.frame = CGRect(x: 310, y: 850, width: 50, height: 30)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.tintColor = .systemBlue
        nextButton.addTarget(self, action: #selector(nextPageMove), for: .touchUpInside)
        view.addSubview(nextButton)
    }

    private func createGetStarted() {
        getStartedButton.frame = CGRect(x: 145, y: 780, width: 120, height: 30)
        getStartedButton.setTitle("GET STARTED", for: .normal)
        getStartedButton.setTitleColor(.systemBlue, for: .normal)
        getStartedButton.isHidden = true
        getStartedButton.addTarget(self, action: #selector(myTabPresent), for: .touchUpInside)
        view.addSubview(nextButton)
        view.addSubview(getStartedButton)
    }
    private func indexObserver(x: Int) {
        switch x {
        case 2:
            getStartedButton.isHidden = false
            skipButton.isHidden = true
            nextButton.isHidden = true
        default:
            getStartedButton.isHidden = true
            skipButton.isHidden = false
            nextButton.isHidden = false
        }
    }

    @objc private func myTabPresent() {

        let buyVC = BuyViewController()
        let forYouVC = ForYouViewController()
        let findVC = FindViewController()
        let basketVC = BasketViewController()

        let buyNavController = UINavigationController(rootViewController: buyVC)
        let forYouNavController = UINavigationController(rootViewController: forYouVC)
        let findNavController = UINavigationController(rootViewController: findVC)
        let basketNavController = UINavigationController(rootViewController: basketVC)

        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([buyNavController, forYouNavController, findNavController, basketNavController],
                                    animated: true)
        tabBarVC.tabBar.barTintColor = .black
        tabBarVC.tabBar.unselectedItemTintColor = .systemGray5

        buyVC.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"),
                                        tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.crop.circle.fill"),
                                           tag: 1)
        findVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)

        buyNavController.navigationBar.barTintColor = .black
        findNavController.navigationBar.barTintColor = .black
        basketNavController.navigationBar.barTintColor = .black

        dismiss(animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)

    }

    @objc private func nextPageMove(){
        guard let currentViewController = viewControllers?.first else { return }
        guard let nextViewController =
                dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension MyPagesViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InformationViewController else { return nil }
        if let index = arrayInfoViewController.firstIndex(of: viewController) {
            indexObserver(x: index)

            if index > 0 {
                return arrayInfoViewController[index - 1]
            }
        }
        return nil
    }
}

extension MyPagesViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InformationViewController else { return nil }
        if let index = arrayInfoViewController.firstIndex(of: viewController) {
            indexObserver(x: index)

            if index < info.count - 1 {
                return arrayInfoViewController[index + 1]
            }
        }
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return info.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let myVC = pageViewController.viewControllers?.first as? InformationViewController else {
            return 0
        }
        return arrayInfoViewController.firstIndex(of: myVC) ?? 0
    }
}



