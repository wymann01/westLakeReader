//
//  ReadingViewController.swift
//  TheNews
//
//  Created by wymann pan on 2022/9/22.
//  Copyright © 2022 dk. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ReadingViewController : UIViewController, UITextViewDelegate {
    
    var container = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置样式
        configure()
        
       
        // 创建ViewModel 并且加载数据
    }
    
    func configure() {
        view.backgroundColor = .yellow
        
        // 设置右上角更多菜单
        configureNavigation()
        
        // 文章内容
        configureReadingContent()
    }
    
    func configureNavigation() {
        let rightImage = UIImage(systemName: "figure.walk.circle")
        let rightBarbutton = UIBarButtonItem(title: nil, image: rightImage, primaryAction: nil, menu: nil)
        // TODO: menu 需要内容
        navigationItem.rightBarButtonItem = rightBarbutton
    }
    
    func configureReadingContent() {
        let containerView = UIScrollView()
        containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubviewForAutoLayout(containerView)
        // 添加布局约束
    
        containerView.snp.makeConstraints { make in
            // 为什么 safeArea 的 top 会那么靠下 ?
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        containerView.backgroundColor = .systemBlue
        
        
        
        let titleView = UILabel()
        titleView.text = "湖心亭看雪"
        titleView.numberOfLines = 2
        containerView.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.left.right.equalTo(containerView).offset(16)
        }
        
        let articleInfoView = UILabel()
        articleInfoView.numberOfLines = 2
        articleInfoView.text = "作者: 张岱 / 崇祯五年十二月"
        containerView.addSubview(articleInfoView)
        articleInfoView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(8)
            make.left.right.equalTo(titleView)
            
        }
        
        let articleView = UILabel()
        articleView.numberOfLines = 0
        articleView.text =  """
            崇祯五年十二月，余住西湖。大雪三日，湖中人鸟声俱绝。是日更定矣，余拏一小舟，拥毳衣炉火，独往湖心亭看雪。雾凇沆砀，天与云与山与水，上下一白。湖上影子，惟长堤一痕、湖心亭一点、与余舟一芥、舟中人两三粒而已。
            到亭上，有两人铺毡对坐，一童子烧酒炉正沸。见余大喜曰：湖中焉得更有此人！ 拉余同饮。余强饮三大白而别。问其姓氏，是金陵人，客此。及下船，舟子喃喃曰：“莫说相公痴，更有痴似相公者。
            """
        containerView.addSubview(articleView)
        articleView.snp.makeConstraints { make in
            make.left.right.equalTo(titleView)
            make.top.equalTo(articleInfoView.snp.bottom).offset(16)
        }
    }
    
    
}
