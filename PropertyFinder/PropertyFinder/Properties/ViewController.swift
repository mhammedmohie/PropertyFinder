//
//  ViewController.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {
    let propertiesListVM = PropertiesListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        propertiesListVM.getProperties {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sortBTNPressed(_ sender: Any) {

        let alert = UIAlertController(title: "Data Sorting", message: "Please choose sorting method", preferredStyle: UIAlertControllerStyle.alert)

        alert.addAction(UIAlertAction(title: "Bedrooms Ascending", style: .default, handler: { (action) in
            self.propertiesListVM.changeSortingTo(sorteType: .bedroomsAssending, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "Bedrooms Descending", style: .default, handler: { (action) in
            self.propertiesListVM.changeSortingTo(sorteType: .bedroomsDescending, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "Price Ascending", style: .default, handler: { (action) in
            self.propertiesListVM.changeSortingTo(sorteType: .priceAscending, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "Price Descending", style: .default, handler: { (action) in
            self.propertiesListVM.changeSortingTo(sorteType: .priceDescending, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }))
        self.present(alert, animated: true, completion: nil)

    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "propertyCell", for: indexPath) as! ProprtyTableViewCell

        let propertyObj  = propertiesListVM.properties [indexPath.row]
        cell.propertyBedsLBL.text = propertiesListVM.propertyBedRooms(property: propertyObj)
        cell.propertyPriceLBL.text = propertiesListVM.propertyPrice(property: propertyObj)
        cell.propertyTitleLBL.text = propertiesListVM.propertyTitle(property: propertyObj)
        if propertyObj.thumbnail != nil {
            cell.propertyIMG.af_setImage(withURL: URL(string: propertyObj.thumbnail!)!)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertiesListVM.properties.count
    }

     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        log.debug(indexPath.row)
        if Double(indexPath.row) > 0.8 * Double(propertiesListVM.properties.count)
            && !propertiesListVM.isLoadingData{
            propertiesListVM.loadNextPage {
                self.tableView.reloadData()
            }
        }
    }
}

