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
    description: nil, seasons: [],
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
        description: nil, seasons: [],
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
        description: "Взмахни волшебной палочкой, произнеси заклинание — так делаются все дела в мире магии, от работы по дому до сражений за судьбу мира. Кажется, что всё должно быть легко и занимательно в этом мире, где каждый сам себе волшебник, способный наколдовать счастья и денег. Но не тут-то было. Социальное неравенство никуда не делось, только теперь статус человека определяет не происхождение, богатство или связи, а количество магии.А что если магии нет совсем? Тогда ты не просто ноль без палочки, ты — опасная аномалия, от которой необходимо избавиться. Так что если природа на тебе отдохнула, перед тобой встаёт вопрос: готов ли ты откинуть копыта в мире магии во цвете лет? Нет? Тогда последуй примеру Мэша Бёрндэда — восполни отсутствие магии мускулами и живи согласно девизу «Сила есть — магии не надо!».", seasons: [],
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
        description: "Юи Хирасава — молодая и беззаботная девушка, только-только поступившая в старшую школу. В первый же день учёбы она замечает рекламный плакат «клуба лёгкой музыки» и, загоревшись желанием вступить туда, отправляется записываться в участники.Она приходит в комнату клуба, где её тепло встречают находящиеся там девушки: Рицу Тайнака, Мио Акияма и Цумуги Котобуки. Когда выясняется, что Юи не умеет играть ни на одном музыкальном инструменте, её, несмотря на это, убеждают вступить хотя бы для того, чтобы предотвратить роспуск клуба. А после прослушивания небольшой композиции интерес у Юи разгорается лишь сильнее, и она решает научиться играть на гитаре.Пролетают неделя за неделей; наряду со школьными занятиями и домашней работой Юи учится игре на гитаре, попутно сталкиваясь со множеством проблем и с различным успехом решая их — не без помощи новообретённых подруг. Ей ещё далеко до совершенства, а школьный фестиваль всё ближе и ближе... Успеет ли «клуб лёгкой музыки» подготовиться к своему дебютному выступлению?", seasons: [], genres: [.comedy], nameRu: "Кэйон!",
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
        description: "Говорят, время лечит, но для Кэйсукэ Нидзимы это лишь пустые слова. Уже десять лет прошло со смерти его дорогой жены, но они не принесли ему ни капли утешения. Его жизнь кончилась в тот день, когда её не стало. Кэйсукэ больше ничего не радует и не беспокоит, даже на единственную дочь Маи он еле обращает внимание. Закончив школу, девушка прочно засела дома и работает удалённо. Отец и дочь живут в одной квартире, но почти не общаются. Однажды на их пороге объявляется десятилетняя Марика Сираиси и говорит, что она реинкарнация Такаэ — покойной жены Кэйсукэ. И самое ужасное —  похоже, она не врёт!Это местами грустная, местами забавная, а иногда трагичная история, которая учит ценить каждый день, проведённый вместе с родными людьми.", seasons: [],
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
    animeID: 2,
    title: "Добро пожаловать в класс превосходства",
    season: "Добро пожаловать в класс превосходства 4: Второй год — Первый семестр",
    playerProvider: .native(episodeID: 2706)
)

let previewWatchHistoryItem = WatchHistoryItem(
    season: 1,
    episode: 1,
    stoppedAtSeconds: 111,
    titleID: 1102,
    playerProvider: .native(episodeID: 2710)
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

let previewWatchHistory: [WatchHistoryCardModel] = [
    WatchHistoryCardModel(
        title: "История о перекуре за супермаркетом",
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"),
        season: 1, seasonName: "fdsf",
        episode: 4,
        stoppedAtSeconds: 556,
        titleID: 1102,
        playerProvider: .native(episodeID: 2710)
    ),
    WatchHistoryCardModel(
        title: "Добро пожаловать в класс превосходства",
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"),
        season: 4, seasonName: "sdfsdf",
        episode: 13,
        stoppedAtSeconds: 1200,
        titleID: 2,
        playerProvider: .native(episodeID: 2706)
    ),
    WatchHistoryCardModel(
        title: "Кэйон!",
        imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"),
        season: 1, seasonName: "sgsg",
        episode: 1,
        stoppedAtSeconds: 420,
        titleID: 1098,
        playerProvider: .native(episodeID: 2641)
    )
]

let previewSeasons: [Season] = [
    Season(
        id: 1126,
        titleID: 1075,
        name: "Ванпанчмен",
        seasonName: "1-сезон",
        seasonNumber: 1,
        sortOrder: 1,
        type: "TV",
        episodesCount: 12,
        releaseDate: "С 5 октября 2015 г. по 21 декабря 2015 г.",
        status: "Finished",
        // swiftlint:disable:next line_length
        description: "Вы устали от запоминания суператак и бесконечных доспехов, но душа просит адреналина и драк? Тогда эта новая экшен-комедия от студии Madhouse для вас!Главный герой не размахивает мечом, не выкрикивает боевой клич и вообще не отличается ничем, особенно героическим. Всё в этом молодом человеке по имени Сайтама так и вопит: «заурядный» — и его лысая голова, и его хилое телосложение. Однако у этого среднестатистического по всем параметрам парня совсем не среднестатистические проблемы... Потому что на самом деле он — супергерой, жаждущий битвы с суперкрутыми противниками. Загвоздка в том, что, отыскав наконец перспективного кандидата на роль главного врага, Сайтама выносит его с одного удара. Сможет ли Сайтама заиметь себе могучего злодея, который смог бы достойно противостоять ему? Следите за Ванпанчменом в его уморительных приключениях, пока среди многочисленных плохих парней он, несмотря ни на что, будет пытаться найти «своего»!",
        episodes: [
            Episode(
                id: 1,
                seasonID: 1126,
                animeID: 1102,
                number: 1,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/1/1080/4c5ec6d26457611fef4853bfa7053746.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "720P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/1/720/4c5ec6d26457611fef4853bfa7053746.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "480P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/1/480/17bf178a174d4c9e8b5f09739ed0f381.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            ),
            Episode(
                id: 2,
                seasonID: 1126,
                animeID: 1102,
                number: 20,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/2/1080/5d6fc7d37568722fef5964cfb8164857.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "720P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/2/720/5d6fc7d37568722fef5964cfb8164857.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            ),
            Episode(
                id: 3,
                seasonID: 1126,
                animeID: 1102,
                number: 300,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/3/1080/6e7ad8e48679833fef6075dc99275968.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "720P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/1210/3/720/6e7ad8e48679833fef6075dc99275968.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            )
        ],
        shikimoriID: "z30276"
    ),
    Season(
        id: 1127,
        titleID: 1075,
        name: "Ванпанчмен: Путь к становлению героем",
        seasonName: "OVA 1",
        seasonNumber: 1,
        sortOrder: 2,
        type: "OVA",
        episodesCount: 1,
        releaseDate: "4 дек. 2015 г.",
        status: "Finished",
        // swiftlint:disable:next line_length
        description: "Дополнительный эпизод, идущий в комплекте с десятым томом манги.В начале своего тернистого пути к становлению полноценным героем Сайтаме приходилось нелегко: после каждой стычки, даже с самым слабым монстром, его спортивный, на тот момент геройский, костюм рвался, причиняя знакомому портному всё больше хлопот. Ну а как иначе? Не всем дано владеть миллионами, вот и Сайтама дорожил костюмом, ведь на новый денег всё равно не было.И всё было хорошо ровно до того момента, пока к портному не пришли несколько страшных якудза, вымогая оплатить огромные проценты по кредиту, иначе его собственная лавка должна будет перейти во владение организации «Кредит Ня-Ня».Так как Сайтама был одним из немногих клиентов, которого к тому же портной обслуживает бесплатно, он решает помочь и разузнать, что это за организация.",
        episodes: [
            Episode(
                id: 1,
                seasonID: 1127,
                animeID: 1102,
                number: 1,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/8763/1/1080/92bf8d059729a7d670c14a955a535742.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "720P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/8763/1/720/92bf8d059729a7d670c14a955a535742.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            )
        ],
        shikimoriID: "z31704"
    ),
    Season(
        id: 1128,
        titleID: 1075,
        name: "Ванпанчмен: Спецвыпуски",
        seasonName: "TV Спецвыпуск-1",
        seasonNumber: 1,
        sortOrder: 3,
        type: "TV Спецвыпуск",
        episodesCount: 6,
        releaseDate: "С 24 декабря 2015 г. по 27 мая 2016 г.",
        status: "Finished",
        // swiftlint:disable:next line_length
        description: "Спецвыпуски, включённые в Blu-ray и DVD издания аниме-сериала «Ванпанчмен».Первый эпизод поведает зрителям историю о том, как Генос пытался узнать секрет силы Сайтамы после нападения Женщины-Комара.Во втором эпизоде Генос выполняет поручение Сайтамы и попадает в неприятности.Третий эпизод — история о том, чем занимался Соник после встречи с Сайтамой.В четвёртом эпизоде Бэнг пытается заманить Сайтаму и Геноса в своё додзё.В пятом спецвыпуске описывается знакомство с Адской Метелью. Очередное приключение Геноса.Шестой эпизод — расследование загадочного убийства на горячих источниках.",
        episodes: [
            Episode(
                id: 1,
                seasonID: 1128,
                animeID: 1102,
                number: 1,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/8764/1/1080/1a2b3c4d5e6f7g8h9i0j.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    ),
                    Video(
                        dubberName: "AniLibria",
                        resolution: "720P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/8764/1/720/1a2b3c4d5e6f7g8h9i0j.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            ),
            Episode(
                id: 1,
                seasonID: 1128,
                animeID: 1102,
                number: 2,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/8764/2/1080/2b3c4d5e6f7g8h9i0j1a.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            )
        ],
        shikimoriID: "y31772"
    ),
    Season(
        id: 1130,
        titleID: 1075,
        name: "Ванпанчмен 3",
        seasonName: "3-сезон",
        seasonNumber: 3,
        sortOrder: 5,
        type: "TV",
        episodesCount: 13,
        releaseDate: "С 12 октября 2025 г. по 28 декабря 2025 г.",
        status: "Finished",
        description: "Нет описания",
        episodes: [
            Episode(
                id: 2,
                seasonID: 1130,
                animeID: 1102,
                number: 1,
                videos: [
                    Video(
                        dubberName: "AniLibria",
                        resolution: "1080P",
                        url: URL(string: "https://cache.libria.fun/videos/media/ts/9900/1/1080/3c4d5e6f7g8h9i0j1a2b.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
                    )
                ]
            )
        ],
        shikimoriID: "52807"
    )
]

let previewEpisode: Episode = Episode(
    id: 2,
    seasonID: 1130,
    animeID: 1102,
    number: 1,
    videos: [
        Video(
            dubberName: "AniLibria",
            resolution: "1080P",
            url: URL(string: "https://cache.libria.fun/videos/media/ts/9900/1/1080/3c4d5e6f7g8h9i0j1a2b.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1")
        )
    ]
)

