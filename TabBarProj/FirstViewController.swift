//
//  FirstViewController.swift
//  TabBarProj
//
//  Created by Vaibhav U on 28/07/20.
//  Copyright © 2020 Vaibhav U. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
let name:String
let capital:String
   
}

class FirstViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet var tableview: UITableView!
    
    var arrdata = [jsonstruct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getdata()
       
    }
  func getdata(){
       let url = URL(string: "https://restcountries.eu/rest/v2/all")
       URLSession.shared.dataTask(with: url!) { (data, response, error) in
           do{if error == nil{
               self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
               
               for mainarr in self.arrdata{
                  print(mainarr.name,":",mainarr.capital)
                   DispatchQueue.main.async {
                        self.tableview.reloadData()
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
           let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
           cell.lblName.text = "Name : \(arrdata[indexPath.row].name)"
           cell.lblCapital.text = "Capital : \(arrdata[indexPath.row].capital)"
           return cell
       }
}

