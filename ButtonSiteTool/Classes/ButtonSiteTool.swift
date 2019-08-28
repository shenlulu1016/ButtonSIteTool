//
//  UIButton+Site.swift
//  SwiftTestDemo
//
//  Created by 申露露 on 2019/6/21.
//  Copyright © 2019 申露露. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    public func setButtonTo(text:String, color:UIColor, fontSize:CGFloat) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    public convenience init(text:String, color:UIColor, fontSize:CGFloat) {
        self.init()
        self.setButtonTo(text: text, color: color, fontSize: fontSize)
    }
    public convenience init(text:String, color:UIColor, fontSize:CGFloat, imageName:String) {
        self.init()
        self.setButtonTo(text: text, color: color, fontSize: fontSize)
        self.setImage(UIImage(named: imageName), for: .normal)
    }
    public convenience init(imageName:String) {
        self.init()
        self.setImage(UIImage.init(named: imageName), for: .normal)
    }
    
    
    
    ///文字在右图片在左（正常状态的基础上加一个间距）
    func setImageLeftTextRight(space:CGFloat) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0, -space * 0.5, 0, space * 0.5)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, space * 0.5, 0, -space * 0.5)
    }
    ///文字在左图片在右（正常状态的基础上加一个间距，切换位置）
    func setTextLeftImageRight(space:CGFloat) {
        let imageWidth = self.imageView?.frame.size.width
        let labelWidth = self.titleLabel?.intrinsicContentSize.width
        self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth! + space * 0.5, 0, -labelWidth! - space * 0.5)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth! - space * 0.5, 0, imageWidth! + space * 0.5)
    }
    ///文字在下图片在上
    /*
     图像的中心位置向右移动了labelWidth * 0.5，向上移动了-imageHeight * 0.5 - space * 0.5
     文字的中心位置向左移动了imageWidth * 0.5，向下移动了labelHeight*0.5+space*0.5
     */
    func setImageTopTextBottom(space:CGFloat) {
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        let labelWidth = self.titleLabel?.intrinsicContentSize.width
        let labelHeight = self.titleLabel?.intrinsicContentSize.height
        self.imageEdgeInsets = UIEdgeInsetsMake(-imageHeight! * 0.5 - space * 0.5, labelWidth! * 0.5, imageHeight! * 0.5 + space * 0.5, -labelWidth! * 0.5)
        self.titleEdgeInsets = UIEdgeInsetsMake(labelHeight! * 0.5 + space * 0.5, -imageWidth! * 0.5, -labelHeight! * 0.5 - space * 0.5, imageWidth! * 0.5)
    }
    ///文字在上图片在下
    /*
     图像的中心位置向右移动了labelWidth * 0.5，向下移动了imageHeight * 0.5 + space * 0.5
     文字的中心位置向左移动了imageWidth * 0.5，向上移动了labelHeight*0.5+space*0.5
     */
    func setTextTopImageBottom(space:CGFloat) {
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        let labelWidth = self.titleLabel?.intrinsicContentSize.width
        let labelHeight = self.titleLabel?.intrinsicContentSize.height
        self.imageEdgeInsets = UIEdgeInsetsMake(imageHeight! * 0.5 + space * 0.5, labelWidth! * 0.5, -imageHeight! * 0.5 - space * 0.5, -labelWidth! * 0.5)
        self.titleEdgeInsets = UIEdgeInsetsMake(-labelHeight! * 0.5 - space * 0.5, -imageWidth! * 0.5, labelHeight! * 0.5 + space * 0.5, imageWidth! * 0.5)
    }
}
