//
//  PickerController.swift
//  Valute
//
//  Created by Uros Andonov on 26.9.22..
//

import UIKit

protocol PickerControllerDelegate: class {
    func pickerController(_ controller: PickerController, didSelectCurrency cc: String)
}

final class PickerController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var currencies: [String] = [] {
        didSet{
            
        }
    }
    weak var delegate: PickerControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
}
    
extension PickerController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PickerCell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
        
        
        let cc = currencies[indexPath.row]
        cell.populateCell(with: cc)
        return cell
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


