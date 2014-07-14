# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140714095646) do

  create_table "books", force: true do |t|
    t.text     "book_title",  limit: 50,              null: false
    t.text     "author",      limit: 50
    t.string   "course_name", limit: 20,              null: false
    t.integer  "number",                  default: 0, null: false
    t.text     "user1",       limit: 100
    t.text     "user2",       limit: 100
    t.text     "user3",       limit: 100
    t.text     "user4",       limit: 100
    t.text     "user5",       limit: 100
    t.text     "user6",       limit: 100
    t.text     "user7",       limit: 100
    t.text     "user8",       limit: 100
    t.text     "user9",       limit: 100
    t.text     "user10",      limit: 100
    t.text     "user11",      limit: 100
    t.text     "user12",      limit: 100
    t.text     "user13",      limit: 100
    t.text     "user14",      limit: 100
    t.text     "user15",      limit: 100
    t.text     "user16",      limit: 100
    t.text     "user17",      limit: 100
    t.text     "user18",      limit: 100
    t.text     "user19",      limit: 100
    t.text     "user20",      limit: 100
    t.text     "user21",      limit: 100
    t.text     "user22",      limit: 100
    t.text     "user23",      limit: 100
    t.text     "user24",      limit: 100
    t.text     "user25",      limit: 100
    t.text     "user26",      limit: 100
    t.text     "user27",      limit: 100
    t.text     "user28",      limit: 100
    t.text     "user29",      limit: 100
    t.text     "user30",      limit: 100
    t.text     "user31",      limit: 100
    t.text     "user32",      limit: 100
    t.text     "user33",      limit: 100
    t.text     "user34",      limit: 100
    t.text     "user35",      limit: 100
    t.text     "user36",      limit: 100
    t.text     "user37",      limit: 100
    t.text     "user38",      limit: 100
    t.text     "user39",      limit: 100
    t.text     "user40",      limit: 100
    t.text     "user41",      limit: 100
    t.text     "user42",      limit: 100
    t.text     "user43",      limit: 100
    t.text     "user44",      limit: 100
    t.text     "user45",      limit: 100
    t.text     "user46",      limit: 100
    t.text     "user47",      limit: 100
    t.text     "user48",      limit: 100
    t.text     "user49",      limit: 100
    t.text     "user50",      limit: 100
    t.text     "user51",      limit: 100
    t.text     "user52",      limit: 100
    t.text     "user53",      limit: 100
    t.text     "user54",      limit: 100
    t.text     "user55",      limit: 100
    t.text     "user56",      limit: 100
    t.text     "user57",      limit: 100
    t.text     "user58",      limit: 100
    t.text     "user59",      limit: 100
    t.text     "user60",      limit: 100
    t.text     "user61",      limit: 100
    t.text     "user62",      limit: 100
    t.text     "user63",      limit: 100
    t.text     "user64",      limit: 100
    t.text     "user65",      limit: 100
    t.text     "user66",      limit: 100
    t.text     "user67",      limit: 100
    t.text     "user68",      limit: 100
    t.text     "user69",      limit: 100
    t.text     "user70",      limit: 100
    t.text     "user71",      limit: 100
    t.text     "user72",      limit: 100
    t.text     "user73",      limit: 100
    t.text     "user74",      limit: 100
    t.text     "user75",      limit: 100
    t.text     "user76",      limit: 100
    t.text     "user77",      limit: 100
    t.text     "user78",      limit: 100
    t.text     "user79",      limit: 100
    t.text     "user80",      limit: 100
    t.text     "user81",      limit: 100
    t.text     "user82",      limit: 100
    t.text     "user83",      limit: 100
    t.text     "user84",      limit: 100
    t.text     "user85",      limit: 100
    t.text     "user86",      limit: 100
    t.text     "user87",      limit: 100
    t.text     "user88",      limit: 100
    t.text     "user89",      limit: 100
    t.text     "user90",      limit: 100
    t.text     "user91",      limit: 100
    t.text     "user92",      limit: 100
    t.text     "user93",      limit: 100
    t.text     "user94",      limit: 100
    t.text     "user95",      limit: 100
    t.text     "user96",      limit: 100
    t.text     "user97",      limit: 100
    t.text     "user98",      limit: 100
    t.text     "user99",      limit: 100
    t.text     "user100",     limit: 100
    t.text     "user101",     limit: 100
    t.text     "user102",     limit: 100
    t.text     "user103",     limit: 100
    t.text     "user104",     limit: 100
    t.text     "user105",     limit: 100
    t.text     "user106",     limit: 100
    t.text     "user107",     limit: 100
    t.text     "user108",     limit: 100
    t.text     "user109",     limit: 100
    t.text     "user110",     limit: 100
    t.text     "user111",     limit: 100
    t.text     "user112",     limit: 100
    t.text     "user113",     limit: 100
    t.text     "user114",     limit: 100
    t.text     "user115",     limit: 100
    t.text     "user116",     limit: 100
    t.text     "user117",     limit: 100
    t.text     "user118",     limit: 100
    t.text     "user119",     limit: 100
    t.text     "user120",     limit: 100
    t.text     "user121",     limit: 100
    t.text     "user122",     limit: 100
    t.text     "user123",     limit: 100
    t.text     "user124",     limit: 100
    t.text     "user125",     limit: 100
    t.text     "user126",     limit: 100
    t.text     "user127",     limit: 100
    t.text     "user128",     limit: 100
    t.text     "user129",     limit: 100
    t.text     "user130",     limit: 100
    t.text     "user131",     limit: 100
    t.text     "user132",     limit: 100
    t.text     "user133",     limit: 100
    t.text     "user134",     limit: 100
    t.text     "user135",     limit: 100
    t.text     "user136",     limit: 100
    t.text     "user137",     limit: 100
    t.text     "user138",     limit: 100
    t.text     "user139",     limit: 100
    t.text     "user140",     limit: 100
    t.text     "user141",     limit: 100
    t.text     "user142",     limit: 100
    t.text     "user143",     limit: 100
    t.text     "user144",     limit: 100
    t.text     "user145",     limit: 100
    t.text     "user146",     limit: 100
    t.text     "user147",     limit: 100
    t.text     "user148",     limit: 100
    t.text     "user149",     limit: 100
    t.text     "user150",     limit: 100
    t.text     "user151",     limit: 100
    t.text     "user152",     limit: 100
    t.text     "user153",     limit: 100
    t.text     "user154",     limit: 100
    t.text     "user155",     limit: 100
    t.text     "user156",     limit: 100
    t.text     "user157",     limit: 100
    t.text     "user158",     limit: 100
    t.text     "user159",     limit: 100
    t.text     "user160",     limit: 100
    t.text     "user161",     limit: 100
    t.text     "user162",     limit: 100
    t.text     "user163",     limit: 100
    t.text     "user164",     limit: 100
    t.text     "user165",     limit: 100
    t.text     "user166",     limit: 100
    t.text     "user167",     limit: 100
    t.text     "user168",     limit: 100
    t.text     "user169",     limit: 100
    t.text     "user170",     limit: 100
    t.text     "user171",     limit: 100
    t.text     "user172",     limit: 100
    t.text     "user173",     limit: 100
    t.text     "user174",     limit: 100
    t.text     "user175",     limit: 100
    t.text     "user176",     limit: 100
    t.text     "user177",     limit: 100
    t.text     "user178",     limit: 100
    t.text     "user179",     limit: 100
    t.text     "user180",     limit: 100
    t.text     "user181",     limit: 100
    t.text     "user182",     limit: 100
    t.text     "user183",     limit: 100
    t.text     "user184",     limit: 100
    t.text     "user185",     limit: 100
    t.text     "user186",     limit: 100
    t.text     "user187",     limit: 100
    t.text     "user188",     limit: 100
    t.text     "user189",     limit: 100
    t.text     "user190",     limit: 100
    t.text     "user191",     limit: 100
    t.text     "user192",     limit: 100
    t.text     "user193",     limit: 100
    t.text     "user194",     limit: 100
    t.text     "user195",     limit: 100
    t.text     "user196",     limit: 100
    t.text     "user197",     limit: 100
    t.text     "user198",     limit: 100
    t.text     "user199",     limit: 100
    t.text     "user200",     limit: 100
    t.text     "user201",     limit: 100
    t.text     "user202",     limit: 100
    t.text     "user203",     limit: 100
    t.text     "user204",     limit: 100
    t.text     "user205",     limit: 100
    t.text     "user206",     limit: 100
    t.text     "user207",     limit: 100
    t.text     "user208",     limit: 100
    t.text     "user209",     limit: 100
    t.text     "user210",     limit: 100
    t.text     "user211",     limit: 100
    t.text     "user212",     limit: 100
    t.text     "user213",     limit: 100
    t.text     "user214",     limit: 100
    t.text     "user215",     limit: 100
    t.text     "user216",     limit: 100
    t.text     "user217",     limit: 100
    t.text     "user218",     limit: 100
    t.text     "user219",     limit: 100
    t.text     "user220",     limit: 100
    t.text     "user221",     limit: 100
    t.text     "user222",     limit: 100
    t.text     "user223",     limit: 100
    t.text     "user224",     limit: 100
    t.text     "user225",     limit: 100
    t.text     "user226",     limit: 100
    t.text     "user227",     limit: 100
    t.text     "user228",     limit: 100
    t.text     "user229",     limit: 100
    t.text     "user230",     limit: 100
    t.text     "user231",     limit: 100
    t.text     "user232",     limit: 100
    t.text     "user233",     limit: 100
    t.text     "user234",     limit: 100
    t.text     "user235",     limit: 100
    t.text     "user236",     limit: 100
    t.text     "user237",     limit: 100
    t.text     "user238",     limit: 100
    t.text     "user239",     limit: 100
    t.text     "user240",     limit: 100
    t.text     "user241",     limit: 100
    t.text     "user242",     limit: 100
    t.text     "user243",     limit: 100
    t.text     "user244",     limit: 100
    t.text     "user245",     limit: 100
    t.text     "user246",     limit: 100
    t.text     "user247",     limit: 100
    t.text     "user248",     limit: 100
    t.text     "user249",     limit: 100
    t.text     "user250",     limit: 100
    t.text     "user251",     limit: 100
    t.text     "user252",     limit: 100
    t.text     "user253",     limit: 100
    t.text     "user254",     limit: 100
    t.text     "user255",     limit: 100
    t.text     "user256",     limit: 100
    t.text     "user257",     limit: 100
    t.text     "user258",     limit: 100
    t.text     "user259",     limit: 100
    t.text     "user260",     limit: 100
    t.text     "user261",     limit: 100
    t.text     "user262",     limit: 100
    t.text     "user263",     limit: 100
    t.text     "user264",     limit: 100
    t.text     "user265",     limit: 100
    t.text     "user266",     limit: 100
    t.text     "user267",     limit: 100
    t.text     "user268",     limit: 100
    t.text     "user269",     limit: 100
    t.text     "user270",     limit: 100
    t.text     "user271",     limit: 100
    t.text     "user272",     limit: 100
    t.text     "user273",     limit: 100
    t.text     "user274",     limit: 100
    t.text     "user275",     limit: 100
    t.text     "user276",     limit: 100
    t.text     "user277",     limit: 100
    t.text     "user278",     limit: 100
    t.text     "user279",     limit: 100
    t.text     "user280",     limit: 100
    t.text     "user281",     limit: 100
    t.text     "user282",     limit: 100
    t.text     "user283",     limit: 100
    t.text     "user284",     limit: 100
    t.text     "user285",     limit: 100
    t.text     "user286",     limit: 100
    t.text     "user287",     limit: 100
    t.text     "user288",     limit: 100
    t.text     "user289",     limit: 100
    t.text     "user290",     limit: 100
    t.text     "user291",     limit: 100
    t.text     "user292",     limit: 100
    t.text     "user293",     limit: 100
    t.text     "user294",     limit: 100
    t.text     "user295",     limit: 100
    t.text     "user296",     limit: 100
    t.text     "user297",     limit: 100
    t.text     "user298",     limit: 100
    t.text     "user299",     limit: 100
    t.text     "user300",     limit: 100
    t.text     "user301",     limit: 100
    t.text     "user302",     limit: 100
    t.text     "user303",     limit: 100
    t.text     "user304",     limit: 100
    t.text     "user305",     limit: 100
    t.text     "user306",     limit: 100
    t.text     "user307",     limit: 100
    t.text     "user308",     limit: 100
    t.text     "user309",     limit: 100
    t.text     "user310",     limit: 100
    t.text     "user311",     limit: 100
    t.text     "user312",     limit: 100
    t.text     "user313",     limit: 100
    t.text     "user314",     limit: 100
    t.text     "user315",     limit: 100
    t.text     "user316",     limit: 100
    t.text     "user317",     limit: 100
    t.text     "user318",     limit: 100
    t.text     "user319",     limit: 100
    t.text     "user320",     limit: 100
    t.text     "user321",     limit: 100
    t.text     "user322",     limit: 100
    t.text     "user323",     limit: 100
    t.text     "user324",     limit: 100
    t.text     "user325",     limit: 100
    t.text     "user326",     limit: 100
    t.text     "user327",     limit: 100
    t.text     "user328",     limit: 100
    t.text     "user329",     limit: 100
    t.text     "user330",     limit: 100
    t.text     "user331",     limit: 100
    t.text     "user332",     limit: 100
    t.text     "user333",     limit: 100
    t.text     "user334",     limit: 100
    t.text     "user335",     limit: 100
    t.text     "user336",     limit: 100
    t.text     "user337",     limit: 100
    t.text     "user338",     limit: 100
    t.text     "user339",     limit: 100
    t.text     "user340",     limit: 100
    t.text     "user341",     limit: 100
    t.text     "user342",     limit: 100
    t.text     "user343",     limit: 100
    t.text     "user344",     limit: 100
    t.text     "user345",     limit: 100
    t.text     "user346",     limit: 100
    t.text     "user347",     limit: 100
    t.text     "user348",     limit: 100
    t.text     "user349",     limit: 100
    t.text     "user350",     limit: 100
    t.text     "user351",     limit: 100
    t.text     "user352",     limit: 100
    t.text     "user353",     limit: 100
    t.text     "user354",     limit: 100
    t.text     "user355",     limit: 100
    t.text     "user356",     limit: 100
    t.text     "user357",     limit: 100
    t.text     "user358",     limit: 100
    t.text     "user359",     limit: 100
    t.text     "user360",     limit: 100
    t.text     "user361",     limit: 100
    t.text     "user362",     limit: 100
    t.text     "user363",     limit: 100
    t.text     "user364",     limit: 100
    t.text     "user365",     limit: 100
    t.text     "user366",     limit: 100
    t.text     "user367",     limit: 100
    t.text     "user368",     limit: 100
    t.text     "user369",     limit: 100
    t.text     "user370",     limit: 100
    t.text     "user371",     limit: 100
    t.text     "user372",     limit: 100
    t.text     "user373",     limit: 100
    t.text     "user374",     limit: 100
    t.text     "user375",     limit: 100
    t.text     "user376",     limit: 100
    t.text     "user377",     limit: 100
    t.text     "user378",     limit: 100
    t.text     "user379",     limit: 100
    t.text     "user380",     limit: 100
    t.text     "user381",     limit: 100
    t.text     "user382",     limit: 100
    t.text     "user383",     limit: 100
    t.text     "user384",     limit: 100
    t.text     "user385",     limit: 100
    t.text     "user386",     limit: 100
    t.text     "user387",     limit: 100
    t.text     "user388",     limit: 100
    t.text     "user389",     limit: 100
    t.text     "user390",     limit: 100
    t.text     "user391",     limit: 100
    t.text     "user392",     limit: 100
    t.text     "user393",     limit: 100
    t.text     "user394",     limit: 100
    t.text     "user395",     limit: 100
    t.text     "user396",     limit: 100
    t.text     "user397",     limit: 100
    t.text     "user398",     limit: 100
    t.text     "user399",     limit: 100
    t.text     "user400",     limit: 100
    t.text     "user401",     limit: 100
    t.text     "user402",     limit: 100
    t.text     "user403",     limit: 100
    t.text     "user404",     limit: 100
    t.text     "user405",     limit: 100
    t.text     "user406",     limit: 100
    t.text     "user407",     limit: 100
    t.text     "user408",     limit: 100
    t.text     "user409",     limit: 100
    t.text     "user410",     limit: 100
    t.text     "user411",     limit: 100
    t.text     "user412",     limit: 100
    t.text     "user413",     limit: 100
    t.text     "user414",     limit: 100
    t.text     "user415",     limit: 100
    t.text     "user416",     limit: 100
    t.text     "user417",     limit: 100
    t.text     "user418",     limit: 100
    t.text     "user419",     limit: 100
    t.text     "user420",     limit: 100
    t.text     "user421",     limit: 100
    t.text     "user422",     limit: 100
    t.text     "user423",     limit: 100
    t.text     "user424",     limit: 100
    t.text     "user425",     limit: 100
    t.text     "user426",     limit: 100
    t.text     "user427",     limit: 100
    t.text     "user428",     limit: 100
    t.text     "user429",     limit: 100
    t.text     "user430",     limit: 100
    t.text     "user431",     limit: 100
    t.text     "user432",     limit: 100
    t.text     "user433",     limit: 100
    t.text     "user434",     limit: 100
    t.text     "user435",     limit: 100
    t.text     "user436",     limit: 100
    t.text     "user437",     limit: 100
    t.text     "user438",     limit: 100
    t.text     "user439",     limit: 100
    t.text     "user440",     limit: 100
    t.text     "user441",     limit: 100
    t.text     "user442",     limit: 100
    t.text     "user443",     limit: 100
    t.text     "user444",     limit: 100
    t.text     "user445",     limit: 100
    t.text     "user446",     limit: 100
    t.text     "user447",     limit: 100
    t.text     "user448",     limit: 100
    t.text     "user449",     limit: 100
    t.text     "user450",     limit: 100
    t.text     "user451",     limit: 100
    t.text     "user452",     limit: 100
    t.text     "user453",     limit: 100
    t.text     "user454",     limit: 100
    t.text     "user455",     limit: 100
    t.text     "user456",     limit: 100
    t.text     "user457",     limit: 100
    t.text     "user458",     limit: 100
    t.text     "user459",     limit: 100
    t.text     "user460",     limit: 100
    t.text     "user461",     limit: 100
    t.text     "user462",     limit: 100
    t.text     "user463",     limit: 100
    t.text     "user464",     limit: 100
    t.text     "user465",     limit: 100
    t.text     "user466",     limit: 100
    t.text     "user467",     limit: 100
    t.text     "user468",     limit: 100
    t.text     "user469",     limit: 100
    t.text     "user470",     limit: 100
    t.text     "user471",     limit: 100
    t.text     "user472",     limit: 100
    t.text     "user473",     limit: 100
    t.text     "user474",     limit: 100
    t.text     "user475",     limit: 100
    t.text     "user476",     limit: 100
    t.text     "user477",     limit: 100
    t.text     "user478",     limit: 100
    t.text     "user479",     limit: 100
    t.text     "user480",     limit: 100
    t.text     "user481",     limit: 100
    t.text     "user482",     limit: 100
    t.text     "user483",     limit: 100
    t.text     "user484",     limit: 100
    t.text     "user485",     limit: 100
    t.text     "user486",     limit: 100
    t.text     "user487",     limit: 100
    t.text     "user488",     limit: 100
    t.text     "user489",     limit: 100
    t.text     "user490",     limit: 100
    t.text     "user491",     limit: 100
    t.text     "user492",     limit: 100
    t.text     "user493",     limit: 100
    t.text     "user494",     limit: 100
    t.text     "user495",     limit: 100
    t.text     "user496",     limit: 100
    t.text     "user497",     limit: 100
    t.text     "user498",     limit: 100
    t.text     "user499",     limit: 100
    t.text     "user500",     limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name", limit: 20,              null: false
    t.integer  "number",                  default: 0, null: false
    t.text     "book1",       limit: 100
    t.text     "book2",       limit: 100
    t.text     "book3",       limit: 100
    t.text     "book4",       limit: 100
    t.text     "book5",       limit: 100
    t.text     "book6",       limit: 100
    t.text     "book7",       limit: 100
    t.text     "book8",       limit: 100
    t.text     "book9",       limit: 100
    t.text     "book10",      limit: 100
    t.text     "book11",      limit: 100
    t.text     "book12",      limit: 100
    t.text     "book13",      limit: 100
    t.text     "book14",      limit: 100
    t.text     "book15",      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userbooks", force: true do |t|
    t.string   "email",                                  null: false
    t.integer  "own",                        default: 0, null: false
    t.integer  "borrow",                     default: 0, null: false
    t.text     "ownedbook1",     limit: 100
    t.text     "ownedbook2",     limit: 100
    t.text     "ownedbook3",     limit: 100
    t.text     "ownedbook4",     limit: 100
    t.text     "ownedbook5",     limit: 100
    t.text     "ownedbook6",     limit: 100
    t.text     "ownedbook7",     limit: 100
    t.text     "ownedbook8",     limit: 100
    t.text     "ownedbook9",     limit: 100
    t.text     "ownedbook10",    limit: 100
    t.text     "ownedbook11",    limit: 100
    t.text     "ownedbook12",    limit: 100
    t.text     "ownedbook13",    limit: 100
    t.text     "ownedbook14",    limit: 100
    t.text     "ownedbook15",    limit: 100
    t.text     "borrowedbook1",  limit: 100
    t.text     "borrowedbook2",  limit: 100
    t.text     "borrowedbook3",  limit: 100
    t.text     "borrowedbook4",  limit: 100
    t.text     "borrowedbook5",  limit: 100
    t.text     "borrowedbook6",  limit: 100
    t.text     "borrowedbook7",  limit: 100
    t.text     "borrowedbook8",  limit: 100
    t.text     "borrowedbook9",  limit: 100
    t.text     "borrowedbook10", limit: 100
    t.text     "borrowedbook11", limit: 100
    t.text     "borrowedbook12", limit: 100
    t.text     "borrowedbook13", limit: 100
    t.text     "borrowedbook14", limit: 100
    t.text     "borrowedbook15", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "usertradeds", force: true do |t|
    t.string   "email",                                null: false
    t.integer  "traded",                   default: 0, null: false
    t.text     "tradedbook1",  limit: 100
    t.text     "tradedbook2",  limit: 100
    t.text     "tradedbook3",  limit: 100
    t.text     "tradedbook4",  limit: 100
    t.text     "tradedbook5",  limit: 100
    t.text     "tradedbook6",  limit: 100
    t.text     "tradedbook7",  limit: 100
    t.text     "tradedbook8",  limit: 100
    t.text     "tradedbook9",  limit: 100
    t.text     "tradedbook10", limit: 100
    t.text     "tradedbook11", limit: 100
    t.text     "tradedbook12", limit: 100
    t.text     "tradedbook13", limit: 100
    t.text     "tradedbook14", limit: 100
    t.text     "tradedbook15", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
