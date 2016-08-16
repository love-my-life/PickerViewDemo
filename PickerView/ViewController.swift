//
//  ViewController.swift
//  PickerView
//
//  Created by hanchen on 16/8/4.
//  Copyright © 2016年 LiJianhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setPickerView()
    }
    func setPickerView() {
        let pickerView = HomepagePickerView.init(frame: CGRectMake(0, self.view.frame.size.height - 200, self.view.bounds.size.width, 200))
        pickerView.dataArray = ["wet","ery","sdg","sag","dsfh"]
        pickerView.detailArray = ["214","346"]
        self.view.addSubview(pickerView)
        
        pickerView.onOneComponentSelected = { (component1Text: String) in
            print(component1Text)
        }
        pickerView.onTwoComponentSelected = { (component1Text: String, component2Text: String) in
            
            print(component1Text)
            print(component2Text)
        }
    }
    


}

