//
//  CongratsRevampViewController.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 10/25/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

open class CongratsRevampViewController: MercadoPagoUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var bundle = MercadoPago.getBundle()
    var viewModel: CongratsViewModel!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 60
        self.tableView.separatorStyle = .none
        
        addUpperScrollingFrame()
        registerCells()
    }
    
    func addUpperScrollingFrame() {
        var frame = self.tableView.bounds
        frame.origin.y = -frame.size.height;
        let view = UIView(frame: frame)
        view.backgroundColor = self.viewModel.getColor()
        tableView.addSubview(view)
    }
    
    func registerCells() {
        
        let headerNib = UINib(nibName: "HeaderCongratsTableViewCell", bundle: self.bundle)
        self.tableView.register(headerNib, forCellReuseIdentifier: "headerNib")
        let emailNib = UINib(nibName: "ConfirmEmailTableViewCell", bundle: self.bundle)
        self.tableView.register(emailNib, forCellReuseIdentifier: "emailNib")
        let approvedNib = UINib(nibName: "ApprovedTableViewCell", bundle: self.bundle)
        self.tableView.register(approvedNib, forCellReuseIdentifier: "approvedNib")
        let rejectedNib = UINib(nibName: "RejectedTableViewCell", bundle: self.bundle)
        self.tableView.register(rejectedNib, forCellReuseIdentifier: "rejectedNib")
        let callFAuthNib = UINib(nibName: "CallForAuthTableViewCell", bundle: self.bundle)
        self.tableView.register(callFAuthNib, forCellReuseIdentifier: "callFAuthNib")
        let footerNib = UINib(nibName: "FooterTableViewCell", bundle: self.bundle)
        self.tableView.register(footerNib, forCellReuseIdentifier: "footerNib")
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController != nil && self.navigationController?.navigationBar != nil {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            ViewUtils.addStatusBar(self.view, color: self.viewModel.getColor())
        }
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MPTracker.trackPaymentEvent(self.viewModel.payment.tokenId, mpDelegate: MercadoPagoContext.sharedInstance, paymentInformer: self.viewModel, flavor: Flavor(rawValue: "3"), action: "CREATE_PAYMENT", result:nil)
    }
    
    init(payment: Payment, paymentMethod : PaymentMethod, callback : @escaping (_ payment : Payment, _ status : MPStepBuilder.CongratsState) -> Void){
        super.init(nibName: "CongratsRevampViewController", bundle : bundle)
        self.viewModel = CongratsViewModel(payment: payment, paymentMethod: paymentMethod, callback: callback)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            if self.viewModel.approved() || self.viewModel.callForAuth() {
                return 2
            } else {
                return 1
            }
        } else {
            return 1
        }
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isHeaderCellFor(indexPath: indexPath) {
            return self.getHeaderCell()
        
        } else if viewModel.isApprovedBodyCellFor(indexPath: indexPath){
            return getApprovedBodyCell()
        
        } else if viewModel.isEmailCellFor(indexPath: indexPath) {
            return getConfirmEmailCell()
        
        } else if viewModel.isCallForAuthFor(indexPath: indexPath) {
            return getCallForAuthCell()
            
        } else if viewModel.isSelectOtherPaymentMethodCellFor(indexPath: indexPath){
            if viewModel.callForAuth() {
                return getOtherPaymentMethodCell(drawLine: true)
            }
            return getOtherPaymentMethodCell(drawLine: false)
        
        } else if viewModel.isFooterCellFor(indexPath: indexPath){
            return getFooterCell()
        }
        
        return UITableViewCell()
    }
    
    private func getHeaderCell() -> UITableViewCell {
        let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "headerNib") as! HeaderCongratsTableViewCell
        headerCell.fillCell(payment: self.viewModel.payment!, paymentMethod: self.viewModel.paymentMethod!, color: self.viewModel.getColor(), instruction: nil)
        return headerCell
    }
    
    private func getFooterCell() -> UITableViewCell {
        let footerNib = self.tableView.dequeueReusableCell(withIdentifier: "footerNib") as! FooterTableViewCell
        footerNib.setCallbackStatus(callback: self.viewModel.callback, payment: self.viewModel.payment, status: MPStepBuilder.CongratsState.ok)
        footerNib.fillCell(payment: self.viewModel.payment)
        if self.viewModel.approved(){
            ViewUtils.drawBottomLine(y: footerNib.contentView.frame.minY, width: UIScreen.main.bounds.width, inView: footerNib.contentView)
        }
        return footerNib
    }
    
    private func getApprovedBodyCell() -> UITableViewCell {
        let approvedCell = self.tableView.dequeueReusableCell(withIdentifier: "approvedNib") as! ApprovedTableViewCell
        approvedCell.fillCell(payment: self.viewModel.payment!)
        return approvedCell
    }
    
    private func getConfirmEmailCell() -> UITableViewCell {
        let confirmEmailCell = self.tableView.dequeueReusableCell(withIdentifier: "emailNib") as! ConfirmEmailTableViewCell
        confirmEmailCell.fillCell(payment: self.viewModel.payment!, instruction:nil)
        ViewUtils.drawBottomLine(y: confirmEmailCell.contentView.frame.minY, width: UIScreen.main.bounds.width, inView: confirmEmailCell.contentView)
        return confirmEmailCell
    }
    
    private func getOtherPaymentMethodCell(drawLine: Bool) -> UITableViewCell {
        let rejectedCell = self.tableView.dequeueReusableCell(withIdentifier: "rejectedNib") as! RejectedTableViewCell
        rejectedCell.setCallbackStatus(callback: self.viewModel.setCallbackWithTracker(cellName: "rejected"), payment: self.viewModel.payment, status: MPStepBuilder.CongratsState.cancel_RETRY)
        rejectedCell.fillCell(payment: self.viewModel.payment)
        if drawLine {
            ViewUtils.drawBottomLine(y: rejectedCell.contentView.frame.minY, width: UIScreen.main.bounds.width, inView: rejectedCell.contentView)
        }
        return rejectedCell
    }
    
    private func getCallForAuthCell() -> UITableViewCell {
        let callFAuthCell = self.tableView.dequeueReusableCell(withIdentifier: "callFAuthNib") as! CallForAuthTableViewCell
        callFAuthCell.setCallbackStatus(callback: self.viewModel.setCallbackWithTracker(cellName: "call"), payment: self.viewModel.payment, status: MPStepBuilder.CongratsState.call_FOR_AUTH)
        callFAuthCell.fillCell(paymentMehtod: self.viewModel.paymentMethod!)
        return callFAuthCell
    }
}
class CongratsViewModel : NSObject, MPPaymentTrackInformer{
    var payment: Payment!
    var paymentMethod: PaymentMethod?
    var callback: (_ payment : Payment, _ status : MPStepBuilder.CongratsState) -> Void
    
    init(payment: Payment, paymentMethod : PaymentMethod, callback : @escaping (_ payment : Payment, _ status : MPStepBuilder.CongratsState) -> Void) {
        
        self.payment = payment
        self.paymentMethod = paymentMethod
        self.callback = callback
    }
    open func methodId() -> String!{
        return payment!.paymentMethodId
    }
    open func status() -> String!{
        return payment!.status
    }
    open func statusDetail() -> String!{
        return payment!.statusDetail
    }
    open func typeId() -> String!{
        return payment!.paymentTypeId
    }
    open func installments() -> String!{
        return String(payment!.installments)
    }
    open func issuerId() -> String!{
        return String(payment!.issuerId)
    }
    
    func getColor() -> UIColor{
        if approved() {
            return UIColor(red: 59, green: 194, blue: 128)
        } else if inProcess() {
            return UIColor(red: 255, green: 161, blue: 90)
        } else if callForAuth() {
            return UIColor(red: 58, green: 184, blue: 239)
        } else if rejected(){
            return UIColor(red: 255, green: 89, blue: 89)
        }
        return UIColor()
    }
    func callForAuth() ->Bool{
        if self.payment.statusDetail == "cc_rejected_call_for_authorize" {
            return true
        } else {
            return false
        }
    }
    func approved() -> Bool{
        if self.payment.status == PaymentStatus.APPROVED.rawValue {
            return true
        } else {
            return false
        }
    }
    func inProcess() -> Bool{
        if self.payment.status == PaymentStatus.IN_PROCESS.rawValue {
            return true
        } else {
            return false
        }
    }
    func rejected() -> Bool{
        if self.payment.status == PaymentStatus.REJECTED.rawValue {
            return true
        } else {
            return false
        }
    }
    internal func getLayoutName() -> String! {
        
        if payment.status == PaymentStatus.REJECTED.rawValue {
            if payment.statusDetail != nil && payment.statusDetail == "cc_rejected_call_for_authorize" {
                return "authorize" //C4A
            } else if payment.statusDetail != nil && payment.statusDetail.contains("cc_rejected_bad_filled")  {
                return "recovery" //bad fill something
            }
        }
        
        return payment.status
    }
    
    func setCallbackWithTracker(cellName: String) -> (_ payment : Payment, _ status : MPStepBuilder.CongratsState) -> Void{
        let callbackWithTracker : (_ payment : Payment, _ status : MPStepBuilder.CongratsState) -> Void = {(payment ,status) in
            let paymentAction: PaymentActions
            if self.payment.statusDetail.contains("cc_rejected_bad_filled"){
                paymentAction = PaymentActions.RECOVER_PAYMENT
            } else if payment.status == PaymentStatus.REJECTED.rawValue{
                paymentAction = PaymentActions.SELECTED_OTHER_PM
            } else if cellName == "rejected" {
                paymentAction = PaymentActions.RECOVER_PAYMENT
            } else {
                paymentAction = PaymentActions.RECOVER_TOKEN
            }
            MPTracker.trackEvent(MercadoPagoContext.sharedInstance, screen: self.getLayoutName(), action: paymentAction.rawValue, result: nil)
            self.callback(payment, status)
        }
        return callbackWithTracker
    }
    enum PaymentStatus : String {
        case APPROVED = "approved"
        case REJECTED = "rejected"
        case RECOVERY = "recovery"
        case IN_PROCESS = "in_process"
    }
    enum PaymentActions : String {
        case RECOVER_PAYMENT = "RECOVER_PAYMENT"
        case RECOVER_TOKEN = "RECOVER_TOKEN"
        case SELECTED_OTHER_PM = "SELECT_OTHER_PAYMENT_METHOD"
    }
    
    func isHeaderCellFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 0
    }
    
    func isFooterCellFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 2
    }
    
    func isApprovedBodyCellFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 && indexPath.row == 0 && approved()
    }
    
    func isEmailCellFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 && indexPath.row == 1 && approved()
    }
    
    func isCallForAuthFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 && indexPath.row == 0 && callForAuth()
    }
    func isSelectOtherPaymentMethodCellFor(indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 && (rejected() || inProcess() || (indexPath.row == 1 && callForAuth()))
    }
}

