// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

const Color LightThemeColor = Colors.white;
const Color DarkThemeColor = Colors.black;

const Color lSubPrimaryColor = Color.fromARGB(255, 224, 248, 235);
const Color lPrimaryColor = Color(0xFF1FB39B);
const Color lPrimaryColor1 = Color(0xFF0A98A8);
const Color lSecondaryColor = Color(0xFF09B7CA);
const Color lSecondaryColor1 = Color(0xFF0190BD);
const Color lSubSecondaryColor = Color.fromARGB(255, 16, 92, 139);

ThemeData LightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: lPrimaryColor,
    onBackground: lPrimaryColor1,
    onError: LightThemeColor,
    onSecondary: lSecondaryColor1,
    onSurface: lSubPrimaryColor,
    background: lSubPrimaryColor,
    secondary: lSecondaryColor,
    surface: lSubSecondaryColor,
    // secondaryVariant: Colors.white,
    error: Colors.red,
    // primaryVariant: Color(0xFF0A0E21),
    onPrimary: lPrimaryColor1,
    brightness: Brightness.dark,
  ),
);

const Color dSubPrimaryColor = Color.fromARGB(255, 156, 181, 222);
const Color dPrimaryColor = Color(0xFF92acd2);
const Color dPrimaryColor1 = Color(0xFF34517e);
const Color dSecondaryColor = Color(0xFF3e6297);
const Color dSecondaryColor1 = Color.fromARGB(255, 27, 85, 144);
const Color dSubSecondaryColor = Color(0xFF1c2c44);

ThemeData DarkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: dPrimaryColor,
    onBackground: dPrimaryColor1,
    onError: LightThemeColor,
    onSecondary: dSecondaryColor1,
    onSurface: dSubSecondaryColor,
    background: dSubSecondaryColor,
    secondary: dSecondaryColor,
    surface: dSubPrimaryColor,
    // secondaryVariant: Colors.white,
    error: Colors.red,
    // primaryVariant: Color(0xFF0A0E21),
    onPrimary: lPrimaryColor1,
    brightness: Brightness.dark,
  ),
);

const InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  prefixText: ' ',
  filled: true,
  hintStyle: TextStyle(
    color: lSubSecondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  labelStyle: TextStyle(
    color: lSubSecondaryColor,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lSecondaryColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lPrimaryColor1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: lSecondaryColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
);

const Map<String, String> countryCodes = {
  "AED": "United Arab Emirates Dirham",
  "AUD": "Australian Dollar",
  "AWG": "Aruban Florin",
  "AZN": "Azerbaijani Manat",
  "BBD": "Barbadian Dollar",
  "BDT": "Bangladeshi Taka",
  "BGN": "Bulgarian Lev",
  "BHD": "Bahraini Dinar",
  "BIF": "Burundian Franc",
  "BMD": "Bermudan Dollar",
  "BND": "Brunei Dollar",
  "BOB": "Bolivian Boliviano",
  "BRL": "Brazilian Real",
  "BSD": "Bahamian Dollar",
  "BTC": "Bitcoin",
  "BTN": "Bhutanese Ngultrum",
  "BWP": "Botswanan Pula",
  "BYN": "New Belarusian Ruble",
  "BYR": "Belarusian Ruble",
  "BZD": "Belize Dollar",
  "CAD": "Canadian Dollar",
  "CDF": "Congolese Franc",
  "CHF": "Swiss Franc",
  "CLP": "Chilean Peso",
  "CNY": "Chinese Yuan",
  "COP": "Colombian Peso",
  "CUP": "Cuban Peso",
  "DJF": "Djiboutian Franc",
  "DKK": "Danish Krone",
  "DOP": "Dominican Peso",
  "DZD": "Algerian Dinar",
  "EGP": "Egyptian Pound",
  "EUR": "Euro",
  "FJD": "Fijian Dollar",
  "GBP": "British Pound Sterling",
  "GEL": "Georgian Lari",
  "GGP": "Guernsey Pound",
  "GHS": "Ghanaian Cedi",
  "GIP": "Gibraltar Pound",
  "GMD": "Gambian Dalasi",
  "GNF": "Guinean Franc",
  "GTQ": "Guatemalan Quetzal",
  "GYD": "Guyanaese Dollar",
  "HKD": "Hong Kong Dollar",
  "HNL": "Honduran Lempira",
  "HRK": "Croatian Kuna",
  "HTG": "Haitian Gourde",
  "HUF": "Hungarian Forint",
  "IDR": "Indonesian Rupiah",
  "ILS": "Israeli New Sheqel",
  "IMP": "Manx pound",
  "INR": "Indian Rupee",
  "IQD": "Iraqi Dinar",
  "IRR": "Iranian Rial",
  "ISK": "Icelandic Króna",
  "JEP": "Jersey Pound",
  "JMD": "Jamaican Dollar",
  "JOD": "Jordanian Dinar",
  "JPY": "Japanese Yen",
  "KES": "Kenyan Shilling",
  "KGS": "Kyrgystani Som",
  "KHR": "Cambodian Riel",
  "KMF": "Comorian Franc",
  "KPW": "North Korean Won",
  "KRW": "South Korean Won",
  "KWD": "Kuwaiti Dinar",
  "KYD": "Cayman Islands Dollar",
  "KZT": "Kazakhstani Tenge",
  "LAK": "Laotian Kip",
  "LBP": "Lebanese Pound",
  "LKR": "Sri Lankan Rupee",
  "LRD": "Liberian Dollar",
  "LSL": "Lesotho Loti",
  "LTL": "Lithuanian Litas",
  "LVL": "Latvian Lats",
  "LYD": "Libyan Dinar",
  "MAD": "Moroccan Dirham",
  "MDL": "Moldovan Leu",
  "MGA": "Malagasy Ariary",
  "MKD": "Macedonian Denar",
  "MMK": "Myanma Kyat",
  "MNT": "Mongolian Tugrik",
  "MOP": "Macanese Pataca",
  "MRO": "Mauritanian Ouguiya",
  "MUR": "Mauritian Rupee",
  "MVR": "Maldivian Rufiyaa",
  "MWK": "Malawian Kwacha",
  "MXN": "Mexican Peso",
  "MYR": "Malaysian Ringgit",
  "MZN": "Mozambican Metical",
  "NAD": "Namibian Dollar",
  "NGN": "Nigerian Naira",
  "NIO": "Nicaraguan Córdoba",
  "NOK": "Norwegian Krone",
  "NPR": "Nepalese Rupee",
  "NZD": "New Zealand Dollar",
  "OMR": "Omani Rial",
  "PAB": "Panamanian Balboa",
  "PEN": "Peruvian Nuevo Sol",
  "PGK": "Papua New Guinean Kina",
  "PHP": "Philippine Peso",
  "PKR": "Pakistani Rupee",
  "PLN": "Polish Zloty",
  "PYG": "Paraguayan Guarani",
  "QAR": "Qatari Rial",
  "RON": "Romanian Leu",
  "RSD": "Serbian Dinar",
  "RUB": "Russian Ruble",
  "RWF": "Rwandan Franc",
  "SAR": "Saudi Riyal",
  "SBD": "Solomon Islands Dollar",
  "SCR": "Seychellois Rupee",
  "SDG": "Sudanese Pound",
  "SEK": "Swedish Krona",
  "SGD": "Singapore Dollar",
  "SHP": "Saint Helena Pound",
  "SOS": "Somali Shilling",
  "SRD": "Surinamese Dollar",
  "SSP": "South Sudanese Pound",
  "SVC": "Salvadoran Colón",
  "SYP": "Syrian Pound",
  "SZL": "Swazi Lilangeni",
  "THB": "Thai Baht",
  "TJS": "Tajikistani Somoni",
  "TMT": "Turkmenistani Manat",
  "TND": "Tunisian Dinar",
  "TOP": "Tongan Paʻanga",
  "TRY": "Turkish Lira",
  "TWD": "New Taiwan Dollar",
  "TZS": "Tanzanian Shilling",
  "UAH": "Ukrainian Hryvnia",
  "UGX": "Ugandan Shilling",
  "USD": "United States Dollar",
  "VES": "Sovereign Bolivar",
  "VND": "Vietnamese Dong",
  "VUV": "Vanuatu Vatu",
  "WST": "Samoan Tala",
  "XAF": "CFA Franc BEAC",
  "XAG": "Silver (troy ounce)",
  "XAU": "Gold (troy ounce)",
  "XCD": "East Caribbean Dollar",
  "XDR": "Special Drawing Rights",
  "XOF": "CFA Franc BCEAO",
  "XPF": "CFP Franc",
  "YER": "Yemeni Rial",
  "ZAR": "South African Rand",
  "ZMW": "Zambian Kwacha",
  "ZWL": "Zimbabwean Dollar"
};

Map<String, String> currencyToCountry = {
  'nzd': 'tk',
  'aud': 'tv',
  'eur': 'pm',
  'gbp': 'sh',
  'usd': 'us',
  'hkd': 'hk',
  'cad': 'ca',
  'jpy': 'jp',
  'afn': 'af',
  'all': 'al',
  'dzd': 'dz',
  'xcd': 'vc',
  'ars': 'ar',
  'amd': 'am',
  'ang': 'mf',
  'azn': 'az',
  'bsd': 'bs',
  'bhd': 'bh',
  'bdt': 'bd',
  'bbd': 'bb',
  'byr': 'by',
  'bzd': 'bz',
  'xof': 'tg',
  'bmd': 'bm',
  'inr': 'in',
  'bob': 'bo',
  'bwp': 'bw',
  'nok': 'sj',
  'brl': 'br',
  'bnd': 'bn',
  'bgn': 'bg',
  'bif': 'bi',
  'khr': 'kh',
  'xaf': 'ga',
  'cve': 'cv',
  'kyd': 'ky',
  'clp': 'cl',
  'cny': 'cn',
  'cop': 'co',
  'kmf': 'km',
  'cdf': 'cd',
  'crc': 'cr',
  'hrk': 'hr',
  'cup': 'cu',
  'cyp': 'cy',
  'czk': 'cz',
  'dkk': 'gl',
  'djf': 'dj',
  'dop': 'do',
  'idr': 'id',
  'ecs': 'ec',
  'egp': 'eg',
  'svc': 'sv',
  'etb': 'et',
  'eek': 'ee',
  'fkp': 'fk',
  'fjd': 'fj',
  'xpf': 'wf',
  'gmd': 'gm',
  'gel': 'ge',
  'gip': 'gi',
  'gtq': 'gt',
  'gnf': 'gn',
  'gyd': 'gy',
  'htg': 'ht',
  'hnl': 'hn',
  'huf': 'hu',
  'isk': 'is',
  'irr': 'ir',
  'iqd': 'iq',
  'ils': 'il',
  'jmd': 'jm',
  'jod': 'ps',
  'kzt': 'kz',
  'kes': 'ke',
  'kpw': 'kp',
  'krw': 'kr',
  'kwd': 'kw',
  'kgs': 'kg',
  'lak': 'la',
  'lvl': 'lv',
  'lbp': 'lb',
  'lsl': 'ls',
  'lrd': 'lr',
  'lyd': 'ly',
  'chf': 'ch',
  'ltl': 'lt',
  'mop': 'mo',
  'mkd': 'mk',
  'mga': 'mg',
  'mwk': 'mw',
  'myr': 'my',
  'mvr': 'mv',
  'mtl': 'mt',
  'mro': 'mr',
  'mur': 'mu',
  'mxn': 'mx',
  'mdl': 'md',
  'mnt': 'mn',
  'mad': 'eh',
  'mzn': 'mz',
  'mmk': 'mm',
  'nad': 'na',
  'npr': 'np',
  'nio': 'ni',
  'ngn': 'ng',
  'omr': 'om',
  'pkr': 'pk',
  'pab': 'pa',
  'pgk': 'pg',
  'pyg': 'py',
  'pen': 'pe',
  'php': 'ph',
  'pln': 'pl',
  'qar': 'qa',
  'ron': 'ro',
  'rub': 'ru',
  'rwf': 'rw',
  'std': 'st',
  'sar': 'sa',
  'scr': 'sc',
  'sll': 'sl',
  'sgd': 'sg',
  'skk': 'sk',
  'sbd': 'sb',
  'sos': 'so',
  'zar': 'za',
  'lkr': 'lk',
  'sdg': 'sd',
  'srd': 'sr',
  'szl': 'sz',
  'sek': 'se',
  'syp': 'sy',
  'twd': 'tw',
  'tjs': 'tj',
  'tzs': 'tz',
  'thb': 'th',
  'top': 'to',
  'ttd': 'tt',
  'tnd': 'tn',
  'try': 'tr',
  'tmt': 'tm',
  'ugx': 'ug',
  'uah': 'ua',
  'aed': 'ae',
  'uyu': 'uy',
  'uzs': 'uz',
  'vuv': 'vu',
  'vef': 've',
  'vnd': 'vn',
  'yer': 'ye',
  'zmk': 'zm',
  'zwd': 'zw',
  'aoa': 'ao',
  'aqd': 'aq',
  'bam': 'ba',
  'ghs': 'gh',
  'ggp': 'gg',
  'rsd': 'rs'
};
