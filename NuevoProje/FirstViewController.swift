//
//  ViewController.swift
//  NuevoProje
//
//  Created by berk birkan on 15.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import Alamofire_SwiftyJSON
import SwiftyJSON
import SDWebImage

var indextitle = Int()

var titlearray = [String]()
var thumbnailarray = [String]()
var imagearray = [String]()
var idarray = [Int]()


class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titletext.text = titlearray[indexPath.row]
        cell.thumbnailimage.sd_setImage(with: URL(string: thumbnailarray[indexPath.row]))
        cell.fullimage.sd_setImage(with: URL(string: imagearray[indexPath.row]))
        cell.index.text = String(indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tosecondvc", sender: nil)
        indextitle = indexPath.row
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondcontroller = segue.destination as! SecondViewController
        
        secondcontroller.imageurl = imagearray[indextitle]
        secondcontroller.photoid = idarray[indextitle]
        secondcontroller.titlestr = titlearray[indextitle]
        
        
    }


    @IBOutlet weak var topimage: UIImageView!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        getdatafromjson()
        
    }
    
    func getdatafromjson(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
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
                    titlearray.append(item["title"] as! String)
                    thumbnailarray.append(item["thumbnailUrl"] as! String)
                    imagearray.append(item["url"] as! String)
                    idarray.append(item["id"] as! Int)
                    self.topimage.sd_setImage(with: URL(string: imagearray[0]))
                    
                }
                self.tableview.reloadData()
                guard let title = jsonarray[0]["title"] as? String else{ return}
                print(title)
                //print(jsonResponse) //Response result
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
    
    
    
    


}

