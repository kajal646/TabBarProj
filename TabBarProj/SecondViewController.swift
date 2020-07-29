//
//  SecondViewController.swift
//  TabBarProj
//
//  Created by Vaibhav U on 28/07/20.
//  Copyright © 2020 Vaibhav U. All rights reserved.
//

import UIKit
import Kingfisher
struct jsonstruct1:Decodable {

    let name : String
    let link : String
    let imageUrl : String
   
}

class SecondViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
     var arrdata = [jsonstruct1]()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
    }
    
func getdata(){
     
    let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses")
    
       URLSession.shared.dataTask(with: url!) { (data, response, error) in
           do{if error == nil{
               self.arrdata = try JSONDecoder().decode([jsonstruct1].self, from: data!)
               
               for mainarr in self.arrdata{
                  print(mainarr.name,":",mainarr.link)
                   DispatchQueue.main.async {
                        self.tableView.reloadData()
                   }
                  
               }
               }
           
           }catch{
               print("Error in get json data")
           }
           
       }.resume()
   }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.arrdata.count
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell:SecondTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SecondTableViewCell
         
        cell.lblArtist.text = "Link : \(arrdata[indexPath.row].link)"
        cell.lblTrack.text = "Name : \(arrdata[indexPath.row].name)"
        cell.imgView.kf.setImage(with: URL(string: arrdata[indexPath.row].imageUrl ))
           return cell
       }
}

