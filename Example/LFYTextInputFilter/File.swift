//
//  File.swift
//  LFYTextInputFilter_Example
//
//  Created by luffy on 2019/3/22.
//  Copyright © 2019 2805508788@qq.com. All rights reserved.
//

import Foundation
import UIKit

class textViewxxx: NSObject {

    func test() -> Void {
        
        
        let text = UITextField(frame: .zero);
        
        text.lfy_makeStrategy { (make) in
             make?.lfy_limit()(3)?.lfy_option()(LFYStrategyOptions.name)
        }
        
    }
}
