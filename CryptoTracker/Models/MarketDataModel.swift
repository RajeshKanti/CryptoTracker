//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by Rajesh Ghosh on 2023-02-26.
//

import Foundation

// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentageString()
        }
        return ""
    }
}


/*
 Create Response model on this website https://app.quicktype.io/
 URL: https://api.coingecko.com/api/v3/global
 Response:
 {
   "data": {
     "active_cryptocurrencies": 12306,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 667,
     "total_market_cap": {
       "btc": 48044399.11862269,
       "eth": 689694448.7401048,
       "ltc": 11920930200.255316,
       "bch": 8298271298.906536,
       "bnb": 3659738541.3865867,
       "eos": 1008332946714.2927,
       "xrp": 2986933277036.4927,
       "xlm": 12717212900294.08,
       "link": 151290513848.23343,
       "dot": 169617269050.456,
       "yfi": 114166942.57707244,
       "usd": 1125295887274.327,
       "aed": 4133088011411.012,
       "ars": 220422224706376.9,
       "aud": 1671968005199.8577,
       "bdt": 120416061785491.44,
       "bhd": 424230923022.9856,
       "bmd": 1125295887274.327,
       "brl": 5842545249095.416,
       "cad": 1531274511005.723,
       "chf": 1058463439233.217,
       "clp": 923102122466169.6,
       "cny": 7827670721468.953,
       "czk": 25239180434372.06,
       "dkk": 7941376244398.612,
       "eur": 1066862647735.8331,
       "gbp": 941748875101.0146,
       "hkd": 8831318747441.258,
       "huf": 405437839161552.5,
       "idr": 17177470970220570,
       "ils": 4126589427662,
       "inr": 93323657436172.67,
       "jpy": 153513465073513.66,
       "krw": 1479555964915502.5,
       "kwd": 345510849228.7098,
       "lkr": 410496436903115.4,
       "mmk": 2361764155159408,
       "mxn": 20700369241396.023,
       "myr": 4991249908005.272,
       "ngn": 517865905944627.7,
       "nok": 11671481169730.117,
       "nzd": 1825668794554.9983,
       "php": 61940673164243.766,
       "pkr": 290102883285961.44,
       "pln": 5035604570698.08,
       "rub": 85541319259522.31,
       "sar": 4222110169053.2812,
       "sek": 11820470345205.273,
       "sgd": 1519301362765.1255,
       "thb": 39346079852247.99,
       "try": 21228684407512.47,
       "twd": 34514850395300.79,
       "uah": 41332394762374.35,
       "vef": 112675877192.77834,
       "vnd": 26776830113425656,
       "zar": 20736806322225.98,
       "xdr": 845234497441.269,
       "xag": 54199797639.85591,
       "xau": 618980255.7541181,
       "bits": 48044399118622.69,
       "sats": 4804439911862269
     },
     "total_volume": {
       "btc": 2063333.243681309,
       "eth": 29619883.070122752,
       "ltc": 511960853.4818201,
       "bch": 356380750.9350984,
       "bnb": 157172539.0295851,
       "eos": 43304254560.82543,
       "xrp": 128277985368.29796,
       "xlm": 546158316588.84534,
       "link": 6497380598.016237,
       "dot": 7284448475.880442,
       "yfi": 4903057.427508143,
       "usd": 48327389993.123825,
       "aed": 177501187431.845,
       "ars": 9466337642394.832,
       "aud": 71804981033.95341,
       "bdt": 5171434504607.655,
       "bhd": 18219184390.45775,
       "bmd": 48327389993.123825,
       "brl": 250916195463.4194,
       "cad": 65762704117.89311,
       "chf": 45457177974.042206,
       "clp": 39643898800660.55,
       "cny": 336170157531.169,
       "czk": 1083931550583.6976,
       "dkk": 341053398653.02527,
       "eur": 45817893612.9509,
       "gbp": 40444709411.345535,
       "hkd": 379273211683.86597,
       "huf": 17412089382632.887,
       "idr": 737710275191860.6,
       "ils": 177222096754.63458,
       "inr": 4007913686974.2505,
       "jpy": 6592848316342.325,
       "krw": 63541579545196.51,
       "kwd": 14838441823.48876,
       "lkr": 17629337866911.09,
       "mmk": 101429231803763.42,
       "mxn": 889006019344.6101,
       "myr": 214356138314.50055,
       "ngn": 22240468381474.9,
       "nok": 501247919472.26117,
       "nzd": 78405874250.9443,
       "php": 2660127973715.1333,
       "pkr": 12458870006758.088,
       "pln": 216261010718.46964,
       "rub": 3673690398348.943,
       "sar": 181324367254.2009,
       "sek": 507646465907.35223,
       "sgd": 65248500688.36633,
       "thb": 1689771878866.408,
       "try": 911695245672.4829,
       "twd": 1482288040391.0994,
       "uah": 1775076922985.3792,
       "vef": 4839021560.011488,
       "vnd": 1149968045120631.2,
       "zar": 890570860232.5881,
       "xdr": 36299765826.415245,
       "xag": 2327685356.1015124,
       "xau": 26582964.13961777,
       "bits": 2063333243681.309,
       "sats": 206333324368130.9
     },
     "market_cap_percentage": {
       "btc": 40.176833000535936,
       "eth": 17.44787756999026,
       "usdt": 6.291761397010859,
       "bnb": 4.31637273396316,
       "usdc": 3.800103101617457,
       "xrp": 1.70652775269345,
       "okb": 1.1567469158267991,
       "ada": 1.1407336317508556,
       "matic": 1.019541430466879,
       "doge": 1.0050113349729024
     },
     "market_cap_change_percentage_24h_usd": 2.6500170340083034,
     "updated_at": 1677451454
   }
 }
 */
