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
    
    private let albumTitleView: UILabel = {
        let label = UILabel()
        label.text = "미묘한 사진 앨범"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let photoIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icoImg
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    private let photoNum: UILabel = {
        let titleView = UILabel()
        titleView.text = "20"
        titleView.font = UIFont(name: "Pretendard", size: 12)
        titleView.textColor = .white
        titleView.clipsToBounds = true
        return titleView
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        // 이미지에 시스템에서 제공하는 ellipsis 사용
        let ellipsisImage = UIImage(systemName: "ellipsis")
        button.setImage(ellipsisImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleInfoView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    
    
    private func loadDataForNoSharedAlbum(){
        
        
        contentView.addSubview(titleInfoView)
        titleInfoView.addSubview(albumTitleView)
        titleInfoView.addSubview(photoIconView)
        titleInfoView.addSubview(photoNum)
        
        titleInfoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(moreButton.snp.leading).offset(-12)
            make.height.equalTo(52)
            make.bottom.equalToSuperview().offset(-20)
        }
        albumTitleView.snp.makeConstraints { make in
            make.leading.bottom.equalTo(titleInfoView)
            make.height.equalTo(26)
        }
        photoIconView.snp.makeConstraints { make in
            make.leading.top.equalTo(titleInfoView)
            make.height.width.equalTo(18)
        }
        photoNum.snp.makeConstraints { make in
            make.leading.equalTo(photoIconView.snp.trailing).offset(3)
            make.centerY.equalTo(photoIconView)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadDataForNoSharedAlbum()
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

       
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-20)
            
            make.height.width.equalTo(24)
        }
        
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }

    
}
