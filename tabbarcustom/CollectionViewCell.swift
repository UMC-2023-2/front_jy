//
//  CollectionViewCell.swift
//  tabbarcustom
//
//  Created by 신지연 on 2024/01/28.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .back01
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HELLO"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
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
        addSubview(albumImageView)
        albumImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // 제목 라벨을 셀에 추가하고 제약 조건 설정
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }

    
}
