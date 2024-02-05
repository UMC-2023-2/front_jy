//
//  PhotoCardCollectionViewCell.swift
//  tabbarcustom
//
//  Created by 신지연 on 2024/02/04.
//

import UIKit

class PhotoCardCollectionViewCell: UICollectionViewCell {
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .back01
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목제목제목ㅈㅁㅈㅁㅈㅁㅈㅁㅈㅈㅁ"
        label.font = UIFont(name: "Pretendard", size: 14)
        label.textColor = .gray700
        label.numberOfLines = 2
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 22
        
        return label
    }()
    
    private let heartBtn: UIButton = {
        let button = UIButton()
        button.setImage(.icoHeartNFill, for: .normal)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        // 이미지뷰를 셀에 추가하고 제약 조건 설정
        addSubview(photoImage)
        photoImage.snp.makeConstraints { make in
            make.width.height.equalTo(166)
            make.top.leading.trailing.equalToSuperview()
            
        }
        
        addSubview(heartBtn)
        heartBtn.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(photoImage.snp.top).offset(12)
            make.trailing.equalTo(photoImage.snp.trailing).offset(-12)
        }

        // 제목 라벨을 셀에 추가하고 제약 조건 설정
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.bottom.equalToSuperview()
            make.width.equalTo(158)
            make.height.equalTo(44)
        }
        
        
        
        layer.masksToBounds = true
    }
    
    
}
