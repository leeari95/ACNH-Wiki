//
//  NPCResponseDTO.swift
//  ACNH-wiki
//
//  Created by Ari on 11/23/24.
//

import Foundation

struct NPCResponseDTO: Decodable {
    let name: String
    let iconImage: String
    let photoImage: String?
    let gender: Gender
    let genderAsia: Gender
    let species: String
    let versionAdded: String?
    let npcID: String
    let internalID: Int
    let birthday: String
    let nameColor: String?
    let bubbleColor: String?
    let iconFilename: String?
    let photoFilename: String?
    let uniqueEntryID: String
    let appearanceLocation: [AppearanceLocation]?
    let translations: Translations

    enum CodingKeys: String, CodingKey {
        case name, iconImage, photoImage, gender, genderAsia, versionAdded,
             birthday, nameColor, bubbleColor, iconFilename, photoFilename,
             translations, species, appearanceLocation
        case npcID = "npcId"
        case internalID = "internalId"
        case uniqueEntryID = "uniqueEntryId"
    }
}

extension NPCResponseDTO {
    func toDomain() -> NPC {
        NPC(
            name: name,
            iconImage: iconImage,
            photoImage: photoImage,
            gender: gender,
            genderAsia: genderAsia,
            species: species,
            birthday: birthday,
            appearanceLocation: appearanceLocation,
            translations: translations
        )
    }
}
