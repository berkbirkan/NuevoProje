//
//  SecondViewController.swift
//  NuevoProje
//
//  Created by berk birkan on 15.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import Alamofire_SwiftyJSON
import SwiftyJSON
import SDWebImage

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var imageurl = String()
    var photoid = Int()
    var titlestr = String()
    
    var namearray = [String]()
    var emailarray = [String]()
    var commentarray = [String]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentcell = tableView.dequeueReusableCell(withIdentifier: "commentcell", for: indexPath) as! CommentCell
        
        commentcell.emailtext.text = "E-mail: " + emailarray[indexPath.row]
        commentcell.nametext.text = "Name: " + namearray[indexPath.row]
        commentcell.bodytext.text = commentarray[indexPath.row]
        
        return commentcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    @IBOutlet weak var topimage: UIImageView!
    
    
    @IBOutlet weak var titletext: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        topimage.sd_setImage(with: URL(string: imageurl))
        titletext.text = titlestr
        
        getpostfromjson()
        self.tableview.reloadData()
        
        
        
    }
    
    func getpostfromjson(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId="+String(photoid)) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                guard let jsonarray = jsonResponse as? [[String:Any]] else{
                    return
                }
                
                for item in jsonarray{
                    self.namearray.append(item["name"] as! String)
                    self.emailarray.append(item["email"] as! String)
                    self.commentarray.append(item["body"] as! String)
                    
                }
                self.tableview.reloadData()
                
               
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    

  

}
