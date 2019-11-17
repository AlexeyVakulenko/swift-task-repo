//
//  TasksViewController.swift
//  swift-task-project
//
//  Created by Aleksey Vakulenko on 17/11/2019.
//  Copyright © 2019 Aleksey Vakulenko. All rights reserved.
//

import Foundation
import UIKit

class TacksViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Tasks"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
