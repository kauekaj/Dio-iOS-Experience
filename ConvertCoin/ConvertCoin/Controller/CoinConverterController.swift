//
//  CoinConverterController.swift
//  ConvertCoin
//
//  Created by Kaue de Assis Jacyntho on 07/12/22.
//

import UIKit
import iOSDropDown

class CoinConverterController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var dropDownTo: DropDown!
    @IBOutlet weak var dropDownFrom: DropDown!
    @IBOutlet weak var lblValueConvert: UILabel!
    @IBOutlet weak var txtValueInfo: UITextField!
    @IBOutlet weak var btnHistory: UIButton!
    
    //MARK: ViewModel
    private var viewModel: CoinConverterViewModel!
    
    
    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CoinConverterViewModel()
        configDropDown()
    }
    
    private func configDropDown() {
        self.dropDownTo.optionArray = self.viewModel.getListCoins()
        self.dropDownTo.arrowSize = 9
        self.dropDownTo.selectedRowColor = .gray
        
        self.dropDownFrom.optionArray = self.viewModel.getListCoins()
        self.dropDownFrom.arrowSize = 9
        self.dropDownFrom.selectedRowColor = .gray
    }
    
    private func createList() -> [String] {
        return ["X", "Y", "Z"]
    }
    
}
