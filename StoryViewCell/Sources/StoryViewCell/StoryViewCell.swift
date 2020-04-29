import UIKit

public class  StoryViewCell: UITableViewCell {
    
    public let titleTextLabel = UILabel()
    public let detailLabel = UILabel()
    
    // MARK: Initalizers
  override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure titleTextLabel
        contentView.addSubview(titleTextLabel)
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleTextLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleTextLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleTextLabel.lineBreakMode = .byWordWrapping
        titleTextLabel.numberOfLines = 0
        titleTextLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        
        // configure detailLabel
        contentView.addSubview(detailLabel)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 5).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        detailLabel.textColor = UIColor.lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSeparator() {
        for sv in self.contentView.subviews where 977 == sv.tag {
            sv.removeFromSuperview()
        }
        let separatorView = UIView()
        separatorView.tag = 977
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        self.contentView.addSubview(separatorView)
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-(offset)-[separator]|",
                                                      options: [],
                                                      metrics: ["offset": 1.0],
                                                      views: ["separator": separatorView])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[separator(1)]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["separator": separatorView])
        
        NSLayoutConstraint.activate(constraints)
    }
}
