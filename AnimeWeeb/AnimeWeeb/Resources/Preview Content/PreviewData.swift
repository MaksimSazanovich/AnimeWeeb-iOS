//
//  PreviewData.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

let previewNewReleasesAnimeModel = NewReleasesAnimeModel(
    imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"),
    titleID: 2,
    title: "Добро пожаловать в класс превосходства",
    season: 4,
    seasonName: "Добро пожаловать в класс превосходства 4: Второй год — Первый семестр",
    episode: 13,
    episodeID: 2706,
    format: .tv
)

let previewNewReleasesAnimeModels: [NewReleasesAnimeModel] = (0..<5).flatMap { _ in [
    NewReleasesAnimeModel(
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"),
        titleID: 2,
        title: "Добро пожаловать в класс превосходства",
        season: 4,
        seasonName: "Добро пожаловать в класс превосходства 4: Второй год — Первый семестр",
        episode: 13,
        episodeID: 2706,
        format: .tv
    ),
    NewReleasesAnimeModel(
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
        titleID: 1102,
        title: "История о перекуре за супермаркетом",
        season: 1,
        seasonName: "История о перекуре за супермаркетом",
        episode: 4,
        episodeID: 2710,
        format: .tv
    ),
    NewReleasesAnimeModel(
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"),
        titleID: 1098,
        title: "Кэйон!",
        season: 1,
        seasonName: "Кэйон!",
        episode: 1,
        episodeID: 2641,
        format: .tv
    )
]}

let previewAnimeModel = AnimeModel(
    id: UUID().hashValue,
    imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
    title: "История о перекуре за супермаркетом",
    description: nil,
    genres: [.seinen, .romance],
    nameRu: "История о перекуре за супермаркетом",
    nameEn: "The History of Searing at the Supermarket",
    nameJp: "スーパーマーケットで焼かれる歴史",
    altNamesRu: [],
    altNamesEn: []
)

let previewAnimeModels: [AnimeModel] = (0..<5).flatMap { _ in [
    AnimeModel(
        id: UUID().hashValue,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
        title: "История о перекуре за супермаркетом",
        description: nil,
        genres: [.seinen, .romance],
        nameRu: "История о перекуре за супермаркетом",
        nameEn: "The History of Searing at the Supermarket",
        nameJp: "スーパーマーケットで焼かれる歴史",
        altNamesRu: [],
        altNamesEn: []
    ),
    AnimeModel(
        id: UUID().hashValue,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/52211/main_alt-deed3b52403287a438a160008242560f.jpeg"),
        title: "Магия и мускулы",
        // swiftlint:disable:next line_length
        description: "Взмахни волшебной палочкой, произнеси заклинание — так делаются все дела в мире магии, от работы по дому до сражений за судьбу мира. Кажется, что всё должно быть легко и занимательно в этом мире, где каждый сам себе волшебник, способный наколдовать счастья и денег. Но не тут-то было. Социальное неравенство никуда не делось, только теперь статус человека определяет не происхождение, богатство или связи, а количество магии.А что если магии нет совсем? Тогда ты не просто ноль без палочки, ты — опасная аномалия, от которой необходимо избавиться. Так что если природа на тебе отдохнула, перед тобой встаёт вопрос: готов ли ты откинуть копыта в мире магии во цвете лет? Нет? Тогда последуй примеру Мэша Бёрндэда — восполни отсутствие магии мускулами и живи согласно девизу «Сила есть — магии не надо!».",
        genres: [.shounen, .fantasy, .action, .comedy],
        nameRu: "Магия и мускулы",
        nameEn: "Magical Muscles",
        nameJp: "魔法と筋肉",
        altNamesRu: [],
        altNamesEn: []
    ),
    AnimeModel(
        id: UUID().hashValue,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"),
        title: "Кэйон!",
        // swiftlint:disable:next line_length
        description: "Юи Хирасава — молодая и беззаботная девушка, только-только поступившая в старшую школу. В первый же день учёбы она замечает рекламный плакат «клуба лёгкой музыки» и, загоревшись желанием вступить туда, отправляется записываться в участники.Она приходит в комнату клуба, где её тепло встречают находящиеся там девушки: Рицу Тайнака, Мио Акияма и Цумуги Котобуки. Когда выясняется, что Юи не умеет играть ни на одном музыкальном инструменте, её, несмотря на это, убеждают вступить хотя бы для того, чтобы предотвратить роспуск клуба. А после прослушивания небольшой композиции интерес у Юи разгорается лишь сильнее, и она решает научиться играть на гитаре.Пролетают неделя за неделей; наряду со школьными занятиями и домашней работой Юи учится игре на гитаре, попутно сталкиваясь со множеством проблем и с различным успехом решая их — не без помощи новообретённых подруг. Ей ещё далеко до совершенства, а школьный фестиваль всё ближе и ближе... Успеет ли «клуб лёгкой музыки» подготовиться к своему дебютному выступлению?", genres: [.comedy], nameRu: "Кэйон!",
        nameEn: "K-ON!",
        nameJp: "けいおん!",
        altNamesRu: [],
        altNamesEn: []
    ),
    AnimeModel(
        id: UUID().hashValue,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/54726/main_alt-bee018ad113099c1d16dd9fc77dd3057.jpeg"),
        title: "Если бы моя жена стала младшеклассницей",
        // swiftlint:disable:next line_length
        description: "Говорят, время лечит, но для Кэйсукэ Нидзимы это лишь пустые слова. Уже десять лет прошло со смерти его дорогой жены, но они не принесли ему ни капли утешения. Его жизнь кончилась в тот день, когда её не стало. Кэйсукэ больше ничего не радует и не беспокоит, даже на единственную дочь Маи он еле обращает внимание. Закончив школу, девушка прочно засела дома и работает удалённо. Отец и дочь живут в одной квартире, но почти не общаются. Однажды на их пороге объявляется десятилетняя Марика Сираиси и говорит, что она реинкарнация Такаэ — покойной жены Кэйсукэ. И самое ужасное —  похоже, она не врёт!Это местами грустная, местами забавная, а иногда трагичная история, которая учит ценить каждый день, проведённый вместе с родными людьми.",
        genres: [.comedy, .seinen, .romance],
        nameRu: "Если бы моя жена стала младшеклассницей",
        nameEn: "TsumaSho",
        nameJp: "妻、小学生になる。",

        altNamesRu: [],
        altNamesEn: []
    )
]}

let previewUserAvatarURL = URL(string: "https://lh3.googleusercontent.com/a/ACg8ocKLZtHNr6Zmas68qSITdLdEioxLLnmJZQZ6vNukWls6ZPzQTsA9=s96-c")

let previewUser = User(id: 1, email: "test@gmail.com", name: "User", avatarPath: previewUserAvatarURL, level: 1)

let previewWatchModel = WatchModel(
    titleID: 2,
    title: "Добро пожаловать в класс превосходства",
    season: "Добро пожаловать в класс превосходства 4: Второй год — Первый семестр",
    episodeID: 2706
)

let previewWatchHistoryItem = WatchHistoryItem(
    title: "История о перекуре за супермаркетом",
    imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
    season: 1,
    episode: 1,
    stoppedAtSeconds: 111,
    titleID: 1102,
    episodeID: 2710
)

let previewUserList: [UserAnimeListItem] = [
    UserAnimeListItem(
        titleID: 1102,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
        title: "История о перекуре за супермаркетом",
        status: .watching
    ),
    UserAnimeListItem(
        titleID: 2,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"),
        title: "Добро пожаловать в класс превосходства",
        status: .watching
    ),
    UserAnimeListItem(
        titleID: 1098,
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"),
        title: "Кэйон!",
        status: .planned
    )
]
