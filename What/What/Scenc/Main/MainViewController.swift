import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

let classTitle: [String] = ["수학", "과학", "영어", "국어","수학", "과학", "영어", "국어","수학", "과학", "영어", "국어","수학", "과학", "영어", "국어","수학", "과학", "영어", "국어"]
let subTitle: [String] = ["수학은 재미있죠", "과학은 노잼이죠", "영어는 좀;", "국어는..제일 재밌죠","수학은 재미있죠", "과학은 노잼이죠", "영어는 좀;", "국어는..제일 재밌죠","수학은 재미있죠", "과학은 노잼이죠", "영어는 좀;", "국어는..제일 재밌죠","수학은 재미있죠", "과학은 노잼이죠", "영어는 좀;", "국어는..제일 재밌죠","수학은 재미있죠", "과학은 노잼이죠", "영어는 좀;", "국어는..제일 재밌죠"]



class MainViewController: UIViewController {
    
    let stackView = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .equalCentering
        $0.axis = .vertical
        $0.backgroundColor = .gray
    }
    
    let lable1 = UILabel().then {
        $0.text = "dsafasdf"
    }
    
    let lable2 = UILabel().then {
        $0.text = "d233232332222"
    }
    
    let lable3 = UILabel().then {
        $0.text = "333333"
    }
    
    let lable4 = UILabel().then {
        $0.text = "444444"
    }
    
    let mainTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewSetting()
    }
    
    override func viewWillLayoutSubviews() {
        addSubview()
        makeConstraints()
    }
    
    func tableViewSetting() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }
    
    func addSubview() {
        view.addSubview(mainTableView)
        view.addSubview(stackView)
        [lable1, lable2, lable3, lable4].forEach({
            stackView.addArrangedSubview($0)
        })
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalToSuperview().inset(100)
        }
        
        mainTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.mainLabel.text = classTitle[indexPath.row]
        cell.subLabel.text = subTitle[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
