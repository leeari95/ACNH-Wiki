//
//  UIViewController.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/06/17.
//

import UIKit
import RxSwift

extension UIViewController {
    
    func showSelectedItemAlert(
        _ items: [String],
        currentItem: String?,
        barButtonItem: UIBarButtonItem? = nil
    ) -> Observable<String> {
        return Observable.create { observer in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            items.forEach { item in
                let title = item == currentItem ? "✓ " + item : item
                alert.addAction(
                    UIAlertAction(title: title, style: .default) { _ in
                        observer.onNext(title)
                        observer.onCompleted()
                    }
                )
            }
            alert.addAction(
                UIAlertAction(title: "Cancel".localized, style: .cancel) { _ in
                    alert.dismiss(animated: true)
                }
            )
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = self.view
                if let barButtonItem = barButtonItem {
                    popoverController.barButtonItem = barButtonItem
                } else {
                    popoverController.sourceRect = CGRect(
                        x: self.view.bounds.midX ,
                        y: self.view.bounds.midY,
                        width: .zero,
                        height: .zero
                    )
                    popoverController.permittedArrowDirections = []
                }
            }
            self.present(alert, animated: true, completion: nil)
            return Disposables.create { alert.dismiss(animated: true, completion: nil) }
        }
    }
}
