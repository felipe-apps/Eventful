//
//  IngressoTableViewCell.swift
//  Eventful
//
//  Created by Felipe Ferreira on 03/06/22.
//

import UIKit

class IngressoTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
