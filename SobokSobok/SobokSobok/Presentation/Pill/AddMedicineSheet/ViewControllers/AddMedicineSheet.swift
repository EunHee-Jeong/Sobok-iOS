//
//  AddMedicineSheet.swift
//  SobokSobok
//
//  Created by 김승찬 on 2022/01/09.
//

import UIKit

protocol AddMedicineSheetDismiss: AnyObject {
    func addMedicineSheetDismiss()
    func pushAddFirstViewController()
}

protocol AddMedicineProtocol: StyleProtocol {}

final class AddMedicineSheet: UIViewController, AddMedicineProtocol {

    // MARK: Properties
    var pillNumber: Int = 10
    
    let addPillManager: PillCountServiceable = PillCountManager(apiService: APIManager(),
                                                            environment: .development)

    weak var delegate: AddMedicineSheetDismiss?
    private let targetListForMedicine = [
        (image: Image.icMyFillPlus, text: "내 약 추가"),
        (image: Image.icFillSend, text: "다른 사람에게 약 전송")
    ]
 
    // MARK: @IBOutlet Properties
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var medicineTableView: UITableView!
    @IBOutlet var sheetHeight: NSLayoutConstraint!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
        getMyPillCount()
        getFriendPillCount()
    }
    
    func style() {
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        sheetHeight.constant = 0
    }
    
    // MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {
            self.delegate?.addMedicineSheetDismiss()
        }
    }

    func assignDelegation() {
        medicineTableView.dataSource = self
        medicineTableView.delegate = self
        medicineTableView.register(AddMedicineTableViewCell.self)
    }
    
    func sheetWithAnimation() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.sheetHeight.constant = 258
            self?.view.layoutIfNeeded()
        }
    }
    
    private func pushMedicineFirstViewController(style: PillStyle) {
        // 바텀시트 dismiss 후에 push를 해줘야 함.
        // presentingViewController가 탭바
        // 탭바의 selectedViewController를 사용하기 위해 타입 캐스팅
        self.dismiss(animated: true)
        guard let viewController = self.presentingViewController as? UITabBarController else { return }
        guard let selectedViewController = viewController.selectedViewController as? UINavigationController else { return }
        let addMyMedicineViewController = AddPillFirstViewController.instanceFromNib()
        addMyMedicineViewController.divide(style: .myPill)
        selectedViewController.pushViewController(addMyMedicineViewController, animated: true)
    }
    
    private func pushNicknameViewController(tossPill: TossPill) {
        // 바텀시트 dismiss 후에 push를 해줘야 함.
        // presentingViewController가 탭바
        // 탭바의 selectedViewController를 사용하기 위해 타입 캐스팅
        self.dismiss(animated: true)
        guard let viewController = self.presentingViewController as? UITabBarController else { return }
        guard let selectedViewController = viewController.selectedViewController as? UINavigationController else { return }
        let sendPillFirstViewController = SendPillFirstViewController.instanceFromNib()
        sendPillFirstViewController.type = tossPill
        selectedViewController.pushViewController(sendPillFirstViewController, animated: true)
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate?.addMedicineSheetDismiss()
        }
    }
}

// MARK: - UITableViewDelegate
extension AddMedicineSheet: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension AddMedicineSheet: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return targetListForMedicine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let medicineCell = medicineTableView.dequeueReusableCell(for: indexPath, cellType: AddMedicineTableViewCell.self)
        // 셀이 선택 되었을 때 배경색 변하지 않게
        medicineCell.selectionStyle = .none
        
        medicineCell.medicineImageView.image = targetListForMedicine[indexPath.row].image
        medicineCell.medicineTextLabel.text = targetListForMedicine[indexPath.row].text
        return medicineCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if pillNumber < 0 {
                self.dismiss(animated: true)
                guard let viewController = self.presentingViewController as? UITabBarController else { return }
                guard let selectedViewController = viewController.selectedViewController as? UINavigationController else { return }
                let pillLimitViewController = PillLimitViewController.instanceFromNib()
                selectedViewController.pushViewController(pillLimitViewController, animated: true)
            } else if pillNumber == 0 {
                pushMedicineFirstViewController(style: .myPill)
            } else {
                pushMedicineFirstViewController(style: .myPill)
            }
        } else {
            pushNicknameViewController(tossPill: .friendPill)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}

extension AddMedicineSheet {
    func getMyPillCount() {
        Task {
            do {
                let result = try await addPillManager.getMyPillCount()
                print("getMyPill", result?.pillCount)
            }
        }
    }
    
    func getFriendPillCount() {
        Task {
            do {
                let result = try await addPillManager.getFriendPillCount(for: 24)
                print("getFriendPill", result?.pillCount)
            }
        }
    }
}
