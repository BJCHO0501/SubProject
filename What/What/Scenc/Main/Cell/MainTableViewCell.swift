import UIKit
import SnapKit
import Then

class MainTableViewCell: UITableViewCell {
    
    private let backGroundView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.backgroundColor = UIColor.CellBackgroundColor
        $0.layer.cornerRadius = 5
    }
    
    let mainLabel = UILabel().then {
        $0.text = "수업"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    let subLabel = UILabel().then {
        $0.text = "보조라벨"
        $0.textColor = UIColor.gray
        $0.font = UIFont.systemFont(ofSize: 10)
    }

    override func layoutSubviews() {
        cellAddSubview()
        cellMakeConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func cellAddSubview() {
        self.addSubview(backGroundView)
        [mainLabel, subLabel].forEach({ backGroundView.addSubview($0) })
    }
    
    func cellMakeConstraints() {
        backGroundView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(60)
        }
        
        mainLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(15)
        }
        
        subLabel.snp.makeConstraints {
            $0.left.equalTo(mainLabel.snp.left)
            $0.top.equalTo(mainLabel.snp.bottom)
        }
    }
}
