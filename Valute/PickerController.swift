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
    
    var filterString: String?
    
    var currencies: [String] = [] {
        didSet{
            if !isViewLoaded {return}
            tableView.reloadData()
        }
    }
    
    private var filteredCurrencies: [String] {
        guard let filter = filterString?.uppercased() else {
            return currencies
        }
        var arr: [String] = []
        for cc in currencies {
            if cc.contains(filter){
                arr.append(cc)
            }
            
        }
        return arr
        

    }
    weak var delegate: PickerControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureUI() {
        title = "Choose currency"
        tableView.backgroundView = UIImageView(image: UIImage(named: "globalbg"))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
}

    
extension PickerController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCurrencies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PickerCell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
        
        
        let cc = filteredCurrencies[indexPath.row]
        cell.populateCell(with: cc)
        return cell
    }
}

extension PickerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cc = filteredCurrencies[indexPath.row]
        
        delegate?.pickerController(self, didSelectCurrency: cc)
      
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


