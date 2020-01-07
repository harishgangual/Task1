//
//  NewViewController.swift
//  Task1
//
//  Created by GAVL DEV on 07/01/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblPages: UITableView!
    var sPageNo = ""
    var arrPages:Array<Any> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let task = URLSession.shared.dataTask(with: URL(string: "https://hn.algolia.com/api/v1/search_by_date?tags=story&page="+sPageNo)!, completionHandler: { (data, response, error) -> Void in
                   do{
                    let dict:Dictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                       print(dict)
                    self.arrPages=dict["hits"] as! Array<Any>
                    DispatchQueue.main.async {
                    self.tblPages.reloadData()
                    }
                   }
                   catch {
                       print("json error: \(error)")
                   }
               })
               task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageTableViewCell", for: indexPath) as! PageTableViewCell
        let dict:Dictionary = arrPages[indexPath.row] as! [String:Any]
        cell.lblTitle.text = dict["title"] as! String
        cell.lblCreatedAt.text = dict["created_at"] as! String
        return cell
    }

}
