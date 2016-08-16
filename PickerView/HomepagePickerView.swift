//
//  HomepagePickerView.swift
//  PickerView
//
//  Created by hanchen on 16/8/4.
//  Copyright © 2016年 LiJianhui. All rights reserved.
//

import UIKit

class HomepagePickerView: UIPickerView ,UIPickerViewDelegate, UIPickerViewDataSource {
    // --- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var dataArray = NSArray() {
        willSet(newValue) {
            self.dataArray = newValue
        }
        didSet {
            self.reloadComponent(0)
        }
    }
    var detailArray = NSArray() {
        willSet(newValue) {
            self.detailArray = newValue
        }
        didSet {
            self.reloadComponent(1)
        }
    }
    // --- 回调函数
    var onTwoComponentSelected: ((component1Text: String, component2Text: String) -> Void)?
    var onOneComponentSelected : ((component1Text: String) -> Void)?
    /// ---- UIPickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if self.detailArray.count != 0 {
            return 2
        }else{
            return 1
        }
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if self.detailArray.count != 0 {
            if component == 0 {
                return dataArray.count
            }else{
                return detailArray.count
            }
        }else{
            return dataArray.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.detailArray.count != 0 {
            if component == 0 {
                return "\(dataArray[row])"
            }else{
                return detailArray[row] as? String
            }
        }else{
            return dataArray[row] as? String
        }
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.detailArray.count != 0  {
            let str1 = dataArray[self.selectedRowInComponent(0)] as! String
            let str2 = detailArray[self.selectedRowInComponent(1)] as! String
            if let block = onTwoComponentSelected {
                block(component1Text: str1,component2Text:str2)
            }
        }else{
            let str1 = dataArray[self.selectedRowInComponent(0)] as! String
            if let block = onOneComponentSelected {
                block(component1Text: str1)
            }
        }
        
    }
    func showPickerView() {
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
    }
}
