//
//  ViewController.swift
//  MFSDKCocoapod
//
//  Created by Elsayed Hussein on 5/15/19.
//  Copyright © 2019 Elsayed Hussein. All rights reserved.
//

import UIKit
import MFSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var errorcodeLabel : UILabel!
    @IBOutlet weak var pay_Button: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    
    
    //at list one prodduct Required
    let productList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set order status delegate Method to get payment status
        MFInvoiceCreateStatus.shared.delegate = self
        
    }
    
    @IBAction func payDidPRessed(_ sender: Any) {
        
        let invoiceValue = Double(amountTextField.text ?? "") ?? 0
        //        let invoice = MFInvoice(invoiceValue: invoiceValue, customerName: "Test", countryCode: .kuwait, displayCurrency: MFCurrency.Kuwaiti_Dinar_KWD)
        //        let invoice = MFInvoice(invoiceValue: invoiceValue, customerName: "Test", countryCode: .kuwait, displayCurrency: MFCurrency.Saudi_Riyal_SAR)
        //        let invoice = MFInvoice(invoiceValue: invoiceValue, customerName: "Test", countryCode: .kuwait, displayCurrency: MFCurrency.Jordanian_Dinar_JOD)
        let invoice = MFInvoice(invoiceValue: invoiceValue, customerName: "Test", countryCode: .kuwait, displayCurrency: .Kuwaiti_Dinar_KWD)
        
        invoice.customerEmail = "a@b.com"// must be email
        invoice.customerMobile = "mobile no"//Required
        invoice.customerCivilId = ""
        invoice.customerBlock = ""
        invoice.customerStreet = ""
        invoice.customerHouseBuildingNo = ""
        invoice.customerReference = ""
        invoice.language = .arabic
        invoice.sendInvoiceOption = .sms
        invoice.apiCustomFileds = ""
        
        // Uncomment this to add ptoducts for your invoice
        //        var productList = [MFProduct]()
        //        let product = MFProduct(name: "ABC", unitPrice: 1, quantity: 2)
        //        productList.append(product)
        //        invoice.invoiceItems = productList
        
        //place order with SDK
        //        MFPaymentRequest.shared.createInvoice(invoice: invoice, paymentMethod: .all, apiLanguage: .english) // show all availbale payment methods
        //        MFPaymentRequest.shared.createInvoice(invoice: invoice, paymentMethod: .visaMaster, apiLanguage: .english) // for
        //        MFPaymentRequest.shared.createInvoice(invoice: invoice, paymentMethod: .debitCardUAE, apiLanguage: .english)
        //        MFPaymentRequest.shared.createInvoice(invoice: invoice, paymentMethod: .mada, apiLanguage: .english)
        MFPaymentRequest.shared.createInvoice(invoice: invoice, paymentMethod: .all, apiLanguage: .english)
    }
    
}
//MFOrder status Delegate methods
extension ViewController : MFInvoiceCreateStatusDelegate {
    func didInvoiceCreateSucess(result: String) {
        
    }
    
    func didInvoiceCreateSucess(transaction: MFTransaction) {
        errorcodeLabel.text = "Succes"
        resultTextView.text = "result: \(transaction)"
    }
    
    func didInvoiceCreateFail(error: MFFailResponse) {
        errorcodeLabel.text = "responseCode: \(error.statusCode)"
        resultTextView.text = "Error: \(error.errorDescription)"
    }
    
    func didPaymentCancel() {
        errorcodeLabel.text = "responseCode: -1"
        resultTextView.text = "Error: Payment Cancelled"
    }
    
}

