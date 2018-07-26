//
//  ComposeViewController.swift
//  HQMainTableBarViewController
//
//  Created by 韩琴 on 2018/7/26.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        // Do any additional setup after loading the view.
        let button = UIButton.init(frame: UIScreen.main.bounds)
        button.addTarget(self, action: #selector(dismissMyCompose), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func dismissMyCompose() {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
