//
//  Created by Daniel on 12/19/20.
//  Copyright © 2020 dk. All rights reserved.
//

import UIKit

class AppleNewsHandler: NewsTableHandler {

    // 获取第一个文章 item
    var itemsTop: [Article] {
        guard let first = articles.first else { return [] }
        return [first]
    }

    // 一行两个
    var itemsStacked: [Article] {
        guard articles.count > 3 else { return [] }

        // 去除第一个 item,因为已经被上面的函数获取过了
        let items = articles.suffix(articles.count-1)

        // 取前面两个 item,也就是整个 array 的 第二第三 个
        let pref = items.prefix(2)
        return Array(pref)
    }

    // 取剩下的 item
    var items: [Article] {
        guard articles.count > 0 else { return [] }
        return articles.suffix(articles.count-3)
    }

    // 分几组的意思
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count > 0 ? 3 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return itemsTop.count
        case 1:
            return 1
        case 2:
            return items.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AppleNewsCellLarge.identifier) as! AppleNewsCellLarge // "as!"表示向下转型
            let article = itemsTop[indexPath.row]
            cell.load(article: article)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AppleNewsCellStacked.identifier) as! AppleNewsCellStacked
            cell.load(itemsStacked)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AppleNewsCell.identifier) as! AppleNewsCell
            let article = items[indexPath.row]
            cell.load(article: article)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.section {
//        case 0:
//            let item = itemsTop[indexPath.row]
//            guard let url = item.url else { return }
//
//            // 打开一个URL 罢了,目前都是用浏览器打开网址
//            UIApplication.shared.open(url)
//        case 1:
//            print("todo!")
//        case 2:
//            let item = items[indexPath.row]
//            guard let url = item.url else { return }
//
//            UIApplication.shared.open(url)
//        default:
//            break
//        }
        let item = itemsTop[indexPath.row]
        self.openReadPage(item)
    }
    
    func openReadPage(_ article: Article) {
        // 打开阅读页
        let vc = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        
        
        let readPage = ReadingViewController()
        vc.pushViewController(readPage, animated: false)
    }

}
