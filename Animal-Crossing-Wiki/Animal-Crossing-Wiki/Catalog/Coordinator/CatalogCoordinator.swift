//
//  CatalogCoordinator.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/07/04.
//

import UIKit

final class CatalogCoordinator: Coordinator {
    
    enum Route {
        case items(for: Category)
        case itemDetail(_ item: Item)
    }
    
    var type: CoordinatorType = .catalog
    var rootViewController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(rootViewController: UINavigationController = UINavigationController()) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let catalogVC = CatalogViewController()
        catalogVC.bind(to: CatalogViewModel(coordinator: self))
        rootViewController.addChild(catalogVC)
    }
    
    func transition(for route: Route) {
        switch route {
        case .items(let category):
            let viewController = ItemsViewController()
            viewController.bind(to: ItemsViewModel(category: category, coordinator: self))
            rootViewController.pushViewController(viewController, animated: true)
        case .itemDetail(let item):
            let viewController = ItemDetailViewController()
            viewController.bind(to: ItemDetailViewModel(item: item))
            rootViewController.pushViewController(viewController, animated: true)
        }
    }
}