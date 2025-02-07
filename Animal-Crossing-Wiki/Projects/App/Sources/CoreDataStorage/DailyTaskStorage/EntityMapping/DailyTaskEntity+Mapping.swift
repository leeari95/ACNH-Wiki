//
//  DailyTaskEntity+Mapping.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/06/10.
//

import Foundation
import CoreData

extension DailyTaskEntity {

    convenience init(_ task: DailyTask, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = task.id
        self.name = task.name
        self.icon = task.icon
        self.progressList = task.progressList
        self.amount = Int64(task.amount)
        self.date = task.createdDate
    }

    func toDomain() -> DailyTask {
        return DailyTask(
            id: self.id ?? UUID(),
            name: self.name ?? "",
            icon: self.icon ?? "",
            progressList: self.progressList ?? [],
            amount: Int(self.amount),
            createdDate: self.date ?? Date()
        )
    }
}
