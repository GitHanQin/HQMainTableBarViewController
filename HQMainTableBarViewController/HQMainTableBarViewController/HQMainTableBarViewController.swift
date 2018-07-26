//
//  HQMainTableBarViewController.swift
//  HQMainTableBarViewController
//
//  Created by 韩琴 on 2018/7/26.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import UIKit

public class HQMainTableBarViewController: UITabBarController {
    public var themColor:UIColor = UIColor.orange {
        didSet {
            viewDidLoad()
        }
    }///主题色
    public var barBackgroundColor:UIColor = UIColor.white{
        didSet {
            viewDidLoad()
        }
    }///tabbar背景色
    public var childVcNames:[String]=[String].init(){
        didSet {
            viewDidLoad()
        }
    }///vc的名字
    public var titles:[String]=[String].init(){
        didSet {
            viewDidLoad()
        }
    }///vc的标题
    public var imageNames:[String]=[String].init(){
        didSet {
            viewDidLoad()
        }
    }///vc的默认图
    public var selectedImageNames:[String]=[String].init(){
        didSet {
            viewDidLoad()
        }
    }///vc的选中图
    public var composeVCName:String!{
        didSet {
            viewDidLoad()
        }
    }///发布包含次弹出式发布界面是，注意childVcNames必须是基数，最中间的那个请放置空白VC用于占位。
    public var composeBtn:UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width*0.2, height: UIScreen.main.bounds.width*0.2)) {
        didSet {
            viewDidLoad()
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        //整体设置tablebar
        tabBar.tintColor = themColor
        tabBar.backgroundColor = barBackgroundColor
        if childVcNames.count == titles.count && titles.count == imageNames.count && imageNames.count == selectedImageNames.count && childVcNames.count>0 && viewControllers == nil{
            for i in 0..<childVcNames.count {
                addChildViewController(childVcName: childVcNames[i], title: titles[i], imageName: imageNames[i], selectedImageName: selectedImageNames[i])
            }
        }
        if composeVCName != nil {
            setUpCompseBtn()
        }
    }
   
}
//MARK:- UI
extension HQMainTableBarViewController {
    private func addChildViewController(childVcName:String,title:String,imageName:String,selectedImageName:String) {
        guard let childVc = getVCByName(childVcName: childVcName) else {
            print("获取不到VC")
            return
        }
        //5.设置子控制器的属性
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named:imageName)
        childVc.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        //6.包装子控制器的导航控制器
        let childNav = UINavigationController(rootViewController: childVc)
        if title == "" {
            childNav.tabBarItem.isEnabled = false
        }
        //7.添加控制器
        addChildViewController(childNav)
    }
    private func getVCByName(childVcName:String) -> UIViewController? {
        var childVc:UIViewController!
        //0.获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as?String else {
            
            print( "没有命名空间")
            return childVc
        }
        //1.根据字符串获取对应Class
        guard let childVcClass = NSClassFromString(nameSpace+"."+childVcName) else {
            print("没找到对应类")
            return childVc
        }
        //3.将获取到的anyCalss转为对应类型
        guard let childVctype = childVcClass as?UIViewController.Type else {
            print("没有获取到对应控制器类型")
            return childVc
        }
        //4.创建控制器对象
        childVc = childVctype.init()
        return childVc
    }
    //添加发布按钮
    private func setUpCompseBtn() {
        tabBar.addSubview(composeBtn)
        //设置位置
        composeBtn.center = CGPoint.init(x: tabBar.center.x, y: tabBar.bounds.size.height*0.5)
        //监听按钮的点击
        /*
         1.Selector("composeBtnClick")
         2."composeBtnClick"
         */
        composeBtn.addTarget(self, action:#selector(composeBtnClick(_:)), for: .touchUpInside)
    }
}
//MARK--事件监听
extension HQMainTableBarViewController {
    //时间监听的本质是发送消息，但是发送消息是OC的本质
    //将方法包装成@SEL-->类中查找方法列表 -->根据@SEL找到imp指针
    //加@objc ，该方法被添加到方法列表中
    @objc private func composeBtnClick(_:UIButton) {
        guard let compsoeVC = getVCByName(childVcName: composeVCName) else {
            return
        }
        let composeVCNav = UINavigationController.init(rootViewController: compsoeVC)
        composeVCNav.modalPresentationStyle = UIModalPresentationStyle.custom
        present(composeVCNav, animated: true, completion: nil)

    }
}
