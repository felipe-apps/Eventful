//
//  EventoTableViewCell.swift
//  Eventful
//
//  Created by Felipe Ferreira on 29/05/22.
//

import UIKit

class EventoTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var imagemView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
