//
//  Category.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/06/08.
//

import Foundation

enum Category: String, CaseIterable {
    case fishes = "Fishes"
    case seaCreatures = "Sea Creatures"
    case bugs = "Bugs"
    case fossils = "Fossils"
    case art = "Art"
    case housewares = "Housewares"
    case miscellaneous = "Miscellaneous"
    case wallMounted = "Wall mounted"
    case wallpaper = "Wallpaper"
    case floors = "Floors"
    case rugs = "Rugs"
    case other = "Other"
    case ceilingDecor = "Ceiling Decor"
    case recipes = "Recipes"
    case songs = "Songs"
    case photos = "Photos"
    case fencing = "Fencing"
    case tops = "Tops"
    case bottoms = "Bottoms"
    case dressUp = "Dress-Up"
    case headwear = "Headwear"
    case accessories = "Accessories"
    case socks = "Socks"
    case shoes = "Shoes"
    case bags = "Bags"
    case umbrellas = "Umbrellas"
    case wetSuit = "Wet Suit"
    case reactions = "Reactions"
    case gyroids = "Gyroids"
    case tools = "Tools"
    case villager = "Villager"
    case npc = "NPC"

    var iconName: String {
        switch self {
        case .bugs: return "Ins13"
        case .fishes: return "Fish6"
        case .seaCreatures: return "div25"
        case .fossils: return "icon-fossil"
        case .art: return "icon-board"
        case .housewares: return "icon-housewares"
        case .miscellaneous: return "icon-miscellaneous"
        case .wallMounted: return "icon-wallmounted"
        case .wallpaper: return "icon-wallpaper"
        case .floors: return "icon-floor"
        case .rugs: return "icon-rug"
        case .other: return "icon-leaf"
        case .ceilingDecor: return "icon-ceiling"
        case .recipes: return "icon-recipe"
        case .songs: return "icon-song"
        case .photos: return "icon-photos"
        case .fencing: return "icon-fence"
        case .tops: return "icon-top"
        case .bottoms: return "icon-pant"
        case .dressUp: return "icon-top"
        case .headwear: return "icon-helm"
        case .accessories: return "icon-glasses"
        case .socks: return "icon-socks"
        case .shoes: return "icon-shoes"
        case .bags: return "icon-bag"
        case .umbrellas: return "icon-umbrella"
        case .wetSuit: return "icon-wetsuit"
        case .reactions: return "icon-reactions"
        case .gyroids: return "icon-gyroids"
        case .tools: return "icon-tool"
        case .villager: return "icon-raymond"
        case .npc: return "icon-kk"
        }
    }

    var progressIconName: String {
        switch self {
        case .bugs: return "Ins1"
        case .fishes: return "Fish6"
        case .seaCreatures: return "div11"
        case .fossils: return "icon-fossil"
        case .art: return "icon-board"
        case .housewares: return "icon-housewares"
        case .miscellaneous: return "icon-miscellaneous"
        case .wallMounted: return "icon-wallmounted"
        case .wallpaper: return "icon-wallpaper"
        case .floors: return "icon-floor"
        case .rugs: return "icon-rug"
        case .other: return "icon-leaf"
        case .ceilingDecor: return "icon-ceiling"
        case .recipes: return "icon-recipe"
        case .songs: return "icon-song"
        case .photos: return "icon-photos"
        case .fencing: return "icon-fence"
        case .tops: return "icon-top"
        case .bottoms: return "icon-pant"
        case .dressUp: return "icon-top"
        case .headwear: return "icon-helm"
        case .accessories: return "icon-glasses"
        case .socks: return "icon-socks"
        case .shoes: return "icon-shoes"
        case .bags: return "icon-bag"
        case .umbrellas: return "icon-umbrella"
        case .wetSuit: return "icon-wetsuit"
        case .reactions: return "icon-reactions"
        case .gyroids: return "icon-gyroids"
        case .tools: return "icon-tool"
        case .villager: return "icon-raymond"
        case .npc: return "icon-kk"
        }
    }

    static func items() -> [Category] {
        [
            .fishes, .seaCreatures, .bugs,
            .fossils, .art, .tools, .housewares,
            .miscellaneous, .wallMounted, .ceilingDecor,
            .wallpaper, .floors, .rugs,
            .other, .recipes, .songs, .photos, .fencing,
            .tops, .bottoms, .dressUp, .headwear, .accessories, .socks, .shoes, .bags, .umbrellas, .wetSuit,
            .reactions, .gyroids
        ]
    }

    static func progress() -> [Category] {
        [.fishes, .bugs, .seaCreatures, .fossils, .art]
    }

    static var critters: [Category] {
        [.fishes, .seaCreatures, .bugs]
    }

    static func furniture() -> [Category] {
        [
            .tools, .housewares, .miscellaneous, .wallMounted,
            .ceilingDecor, .wallpaper, .floors,
            .rugs, .other, .songs, .photos, .fencing,
            .tops, .bottoms, .dressUp, .headwear, .accessories, .socks, .shoes, .bags, .umbrellas, .wetSuit,
            .reactions, .gyroids
        ]
    }
    
    static func animals() -> [Category] {
        [.npc, .villager]
    }
}

extension Category: Comparable {

    private var sortOrder: Int {
        switch self {
        case .fishes: return 0
        case .seaCreatures: return 1
        case .bugs: return 2
        case .fossils: return 3
        case .art: return 4
        case .tools: return 5
        case .housewares: return 6
        case .miscellaneous: return 7
        case .wallMounted: return 8
        case .wallpaper: return 9
        case .floors: return 10
        case .rugs: return 11
        case .other: return 12
        case .ceilingDecor: return 13
        case .recipes: return 14
        case .songs: return 15
        case .fencing: return 16
        case .photos: return 17
        case .tops: return 18
        case .bottoms: return 19
        case .dressUp: return 20
        case .headwear: return 21
        case .accessories: return 22
        case .socks: return 23
        case .shoes: return 24
        case .bags: return 25
        case .umbrellas: return 26
        case .wetSuit: return 27
        case .reactions: return 28
        case .gyroids: return 29
    
        case .villager: return 0
        case .npc: return 1
        }
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }

}
