//
//  MovieListingDTO.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
struct MovieListResponse {
    let status : String?
    let statusMessage : String?
    let moviesData : MoviesData?
}

extension MovieListResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusMessage = "status_message"
        case moviesData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
        moviesData = try values.decodeIfPresent(MoviesData.self, forKey: .moviesData)
    }
}

//MARK: Extension Mock MovieListResponse

extension MovieListResponse {
    static var mock: MovieListResponse = MovieListResponse(status: "ok", statusMessage: "Mocking was successful", moviesData: MoviesData.mock)
}

struct MoviesData  {
    let movieCount : Int?
    let limit : Int?
    let pagenNumber : Int?
    let movies : [Movies]?
}

extension MoviesData: Codable {
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit = "limit"
        case pagenNumber = "page_number"
        case movies = "movies"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movieCount = try values.decodeIfPresent(Int.self, forKey: .movieCount)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        pagenNumber = try values.decodeIfPresent(Int.self, forKey: .pagenNumber)
        movies = try values.decodeIfPresent([Movies].self, forKey: .movies)
    }
}

//MARK: Extension Mock MoviesData

extension MoviesData {
    static var mock: MoviesData = MoviesData(movieCount: 5, limit: 20, pagenNumber: 1, movies: Movies.mock)
}



struct Movies {
    let id : Int?
    let url : String?
    let imdbCode : String?
    let title : String?
    let titleEnglish : String?
    let titleLong : String?
    let slug : String?
    let year : Int?
    let rating : Double?
    let runtime : Int?
    let genres : [String]?
    let summary : String?
    let descriptionFull : String?
    let synopsis : String?
    let ytTrailerCode : String?
    let language : String?
    let mpaRating : String?
    let backgroundImage : String?
    let backgroundImageOriginal : String?
    let smallCoverImage : String?
    let mediumCoverImage : String?
    let largeCoverImage : String?
    let state : String?
    let torrents : [Torrents]?
    let dateUploaded : String?
    let dateUploadedUnix : Int?
}
extension Movies: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case imdbCode = "imdb_code"
        case title = "title"
        case titleEnglish = "title_english"
        case titleLong = "title_long"
        case slug = "slug"
        case year = "year"
        case rating = "rating"
        case runtime = "runtime"
        case genres = "genres"
        case summary = "summary"
        case descriptionFull = "description_full"
        case synopsis = "synopsis"
        case ytTrailerCode = "yt_trailer_code"
        case language = "language"
        case mpaRating = "mpa_rating"
        case backgroundImage = "background_image"
        case backgroundImageOriginal = "background_image_original"
        case smallCoverImage = "small_cover_image"
        case mediumCoverImage = "medium_cover_image"
        case largeCoverImage = "large_cover_image"
        case state = "state"
        case torrents = "torrents"
        case dateUploaded = "date_uploaded"
        case dateUploadedUnix = "date_uploaded_unix"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        imdbCode = try values.decodeIfPresent(String.self, forKey: .imdbCode)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        titleEnglish = try values.decodeIfPresent(String.self, forKey: .titleEnglish)
        titleLong = try values.decodeIfPresent(String.self, forKey: .titleLong)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        descriptionFull = try values.decodeIfPresent(String.self, forKey: .descriptionFull)
        synopsis = try values.decodeIfPresent(String.self, forKey: .synopsis)
        ytTrailerCode = try values.decodeIfPresent(String.self, forKey: .ytTrailerCode)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        mpaRating = try values.decodeIfPresent(String.self, forKey: .mpaRating)
        backgroundImage = try values.decodeIfPresent(String.self, forKey: .backgroundImage)
        backgroundImageOriginal = try values.decodeIfPresent(String.self, forKey: .smallCoverImage)
        smallCoverImage = try values.decodeIfPresent(String.self, forKey: .smallCoverImage)
        mediumCoverImage = try values.decodeIfPresent(String.self, forKey: .mediumCoverImage)
        largeCoverImage = try values.decodeIfPresent(String.self, forKey: .largeCoverImage)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        torrents = try values.decodeIfPresent([Torrents].self, forKey: .torrents)
        dateUploaded = try values.decodeIfPresent(String.self, forKey: .dateUploaded)
        dateUploadedUnix = try values.decodeIfPresent(Int.self, forKey: .dateUploadedUnix)
    }
}

//MARK: Extention Mock Movies

extension Movies {
    static var mock: [Movies] = [ Movies(id: 33163, url: "https://yts.mx/movies/a-summers-tale-1996", imdbCode: "tt0115940", title: "A Summer's Tale", titleEnglish: "A Summer's Tale", titleLong: "A Summer's Tale (1996)", slug: "a-summers-tale-1996", year: 1996, rating: 7.6, runtime: 113, genres: ["Comedy", "Drama", "Romance"], summary: "A shy maths graduate takes a holiday in Dinard before starting his first job. He hopes his sort-of girlfriend will join him, but soon strikes up a friendship with another girl working in town. She in turn introduces him to a further young lady who fancies him. Thus the quiet young lad finds he is having to do some tricky juggling in territory new to him.", descriptionFull: "A shy maths graduate takes a holiday in Dinard before starting his first job. He hopes his sort-of girlfriend will join him, but soon strikes up a friendship with another girl working in town. She in turn introduces him to a further young lady who fancies him. Thus the quiet young lad finds he is having to do some tricky juggling in territory new to him.", synopsis: "A shy maths graduate takes a holiday in Dinard before starting his first job. He hopes his sort-of girlfriend will join him, but soon strikes up a friendship with another girl working in town. She in turn introduces him to a further young lady who fancies him. Thus the quiet young lad finds he is having to do some tricky juggling in territory new to him.", ytTrailerCode: "ZiaMpW1OVyA", language: "fr", mpaRating: "", backgroundImage: "https://yts.mx/assets/images/movies/a_summers_tale_1996/background.jpg", backgroundImageOriginal: "https://yts.mx/assets/images/movies/a_summers_tale_1996/background.jpg", smallCoverImage: "https://yts.mx/assets/images/movies/a_summers_tale_1996/small-cover.jpg", mediumCoverImage: "https://yts.mx/assets/images/movies/a_summers_tale_1996/medium-cover.jpg", largeCoverImage: "https://yts.mx/assets/images/movies/a_summers_tale_1996/large-cover.jpg", state: "ok", torrents: Torrents.mock, dateUploaded: "2021-06-23 03:09:25", dateUploadedUnix: 1624410565),Movies(id: 33161, url: "https://yts.mx/movies/lacombe-lucien-1974", imdbCode: "tt0071733", title: "Lacombe, Lucien", titleEnglish: "Lacombe, Lucien", titleLong: "Lacombe, Lucien (1974)", slug: "lacombe-lucien-1974", year: 1974, rating: 7.7, runtime: 138, genres: ["War", "Drama", "Romance"], summary: "A small town in the south-west of France, summer of 1944. Having failed to join the resistance, the 18 year old Lucien Lacombe, whose father is a prisoner in Germany and whose mother dates her employer, works for the German police. He then meets France Horn, the daughter of a rich jewish tailor. —Vincent Merlaud", descriptionFull: "A small town in the south-west of France, summer of 1944. Having failed to join the resistance, the 18 year old Lucien Lacombe, whose father is a prisoner in Germany and whose mother dates her employer, works for the German police. He then meets France Horn, the daughter of a rich jewish tailor. —Vincent Merlaud", synopsis: "A small town in the south-west of France, summer of 1944. Having failed to join the resistance, the 18 year old Lucien Lacombe, whose father is a prisoner in Germany and whose mother dates her employer, works for the German police. He then meets France Horn, the daughter of a rich jewish tailor. —Vincent Merlaud", ytTrailerCode: "ekSHBWYlJao", language: "fr", mpaRating: "", backgroundImage: "https://yts.mx/assets/images/movies/lacombe_lucien_1974/background.jpg", backgroundImageOriginal: "https://yts.mx/assets/images/movies/lacombe_lucien_1974/background.jpg", smallCoverImage: "https://yts.mx/assets/images/movies/lacombe_lucien_1974/small-cover.jpg", mediumCoverImage: "https://yts.mx/assets/images/movies/lacombe_lucien_1974/medium-cover.jpg", largeCoverImage: "https://yts.mx/assets/images/movies/lacombe_lucien_1974/large-cover.jpg", state: "ok", torrents: Torrents.mock, dateUploaded: "2021-06-23 07:12:29", dateUploadedUnix: 1624425149) ]
}

struct Torrents {
    let url : String?
    let hash : String?
    let quality : String?
    let type : String?
    let seeds : Int?
    let peers : Int?
    let size : String?
    let sizeBytes : Int?
    let dateUploaded : String?
    let dateUploadedUnix : Int?
}

extension Torrents: Codable {

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case hash = "hash"
        case quality = "quality"
        case type = "type"
        case seeds = "seeds"
        case peers = "peers"
        case size = "size"
        case sizeBytes = "size_bytes"
        case dateUploaded = "date_uploaded"
        case dateUploadedUnix = "date_uploaded_unix"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        hash = try values.decodeIfPresent(String.self, forKey: .hash)
        quality = try values.decodeIfPresent(String.self, forKey: .quality)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        seeds = try values.decodeIfPresent(Int.self, forKey: .seeds)
        peers = try values.decodeIfPresent(Int.self, forKey: .peers)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        sizeBytes = try values.decodeIfPresent(Int.self, forKey: .sizeBytes)
        dateUploaded = try values.decodeIfPresent(String.self, forKey: .dateUploaded)
        dateUploadedUnix = try values.decodeIfPresent(Int.self, forKey: .dateUploadedUnix)
    }
}

//MARK: Extension Mock Torrents

extension Torrents {
    static var mock:[Torrents] = [ Torrents(url: "https://yts.mx/torrent/download/1515159AF322AF1ECF1D45BE87173581260B4A23", hash: "1515159AF322AF1ECF1D45BE87173581260B4A23", quality: "720p", type: "bluray", seeds: 0, peers: 0, size: "1.02 GB", sizeBytes: 1095216660, dateUploaded: "2021-06-23 03:09:25", dateUploadedUnix: 1624410565), Torrents(url: "https://yts.mx/torrent/download/464FF34945949CC712944CE360385E20CD45B36D", hash: "464FF34945949CC712944CE360385E20CD45B36D", quality: "1080p", type: "bluray", seeds: 0, peers: 0, size: "1.9 GB", sizeBytes: 2040109466, dateUploaded: "", dateUploadedUnix: 1624419869)]
}

