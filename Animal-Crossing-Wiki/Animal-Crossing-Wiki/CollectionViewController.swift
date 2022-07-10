//
//  CollectionViewController.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/07/10.
//

import UIKit
import RxSwift

class CollectionViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.registerNib(CategoryRow.self)
        return tableView
    }()
    
    private lazy var progressButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.bullet"),
            style: .plain,
            target: self,
            action: nil
        )
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        view.backgroundColor = .acBackground
        view.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setUpNavigationItem() {
        navigationItem.title = "Collection"
        self.navigationItem.rightBarButtonItem = progressButton
    }
    
    func bind(to viewModel: CollectionViewModel) {
        setUpNavigationItem()
        let input = CollectionViewModel.Input(
            selectedCategory: tableView.rx.modelSelected((title: Category, count: Int).self).asObservable(),
            didTapRightBarButton: progressButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output.catagories
            .filter { !$0.isEmpty }
            .bind(to: tableView.rx.items(cellIdentifier: CategoryRow.className, cellType: CategoryRow.self)) { _, item, cell in
                cell.setUp(
                    iconName: item.title.iconName,
                    title: item.title.rawValue,
                    itemCount: item.count
                )
            }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                self.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
    }
}
