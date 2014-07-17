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

ActiveRecord::Schema.define(version: 20140715113346) do

  create_table "books", force: true do |t|
    t.text     "book_title",  limit: 50,              null: false
    t.string   "author",      limit: 50
    t.decimal  "price"
    t.string   "course_name", limit: 20,              null: false
    t.integer  "number",                  default: 0, null: false
    t.string   "user1",       limit: 100
    t.string   "user2",       limit: 100
    t.string   "user3",       limit: 100
    t.string   "user4",       limit: 100
    t.string   "user5",       limit: 100
    t.string   "user6",       limit: 100
    t.string   "user7",       limit: 100
    t.string   "user8",       limit: 100
    t.string   "user9",       limit: 100
    t.string   "user10",      limit: 100
    t.string   "user11",      limit: 100
    t.string   "user12",      limit: 100
    t.string   "user13",      limit: 100
    t.string   "user14",      limit: 100
    t.string   "user15",      limit: 100
    t.string   "user16",      limit: 100
    t.string   "user17",      limit: 100
    t.string   "user18",      limit: 100
    t.string   "user19",      limit: 100
    t.string   "user20",      limit: 100
    t.string   "user21",      limit: 100
    t.string   "user22",      limit: 100
    t.string   "user23",      limit: 100
    t.string   "user24",      limit: 100
    t.string   "user25",      limit: 100
    t.string   "user26",      limit: 100
    t.string   "user27",      limit: 100
    t.string   "user28",      limit: 100
    t.string   "user29",      limit: 100
    t.string   "user30",      limit: 100
    t.string   "user31",      limit: 100
    t.string   "user32",      limit: 100
    t.string   "user33",      limit: 100
    t.string   "user34",      limit: 100
    t.string   "user35",      limit: 100
    t.string   "user36",      limit: 100
    t.string   "user37",      limit: 100
    t.string   "user38",      limit: 100
    t.string   "user39",      limit: 100
    t.string   "user40",      limit: 100
    t.string   "user41",      limit: 100
    t.string   "user42",      limit: 100
    t.string   "user43",      limit: 100
    t.string   "user44",      limit: 100
    t.string   "user45",      limit: 100
    t.string   "user46",      limit: 100
    t.string   "user47",      limit: 100
    t.string   "user48",      limit: 100
    t.string   "user49",      limit: 100
    t.string   "user50",      limit: 100
    t.string   "user51",      limit: 100
    t.string   "user52",      limit: 100
    t.string   "user53",      limit: 100
    t.string   "user54",      limit: 100
    t.string   "user55",      limit: 100
    t.string   "user56",      limit: 100
    t.string   "user57",      limit: 100
    t.string   "user58",      limit: 100
    t.string   "user59",      limit: 100
    t.string   "user60",      limit: 100
    t.string   "user61",      limit: 100
    t.string   "user62",      limit: 100
    t.string   "user63",      limit: 100
    t.string   "user64",      limit: 100
    t.string   "user65",      limit: 100
    t.string   "user66",      limit: 100
    t.string   "user67",      limit: 100
    t.string   "user68",      limit: 100
    t.string   "user69",      limit: 100
    t.string   "user70",      limit: 100
    t.string   "user71",      limit: 100
    t.string   "user72",      limit: 100
    t.string   "user73",      limit: 100
    t.string   "user74",      limit: 100
    t.string   "user75",      limit: 100
    t.string   "user76",      limit: 100
    t.string   "user77",      limit: 100
    t.string   "user78",      limit: 100
    t.string   "user79",      limit: 100
    t.string   "user80",      limit: 100
    t.string   "user81",      limit: 100
    t.string   "user82",      limit: 100
    t.string   "user83",      limit: 100
    t.string   "user84",      limit: 100
    t.string   "user85",      limit: 100
    t.string   "user86",      limit: 100
    t.string   "user87",      limit: 100
    t.string   "user88",      limit: 100
    t.string   "user89",      limit: 100
    t.string   "user90",      limit: 100
    t.string   "user91",      limit: 100
    t.string   "user92",      limit: 100
    t.string   "user93",      limit: 100
    t.string   "user94",      limit: 100
    t.string   "user95",      limit: 100
    t.string   "user96",      limit: 100
    t.string   "user97",      limit: 100
    t.string   "user98",      limit: 100
    t.string   "user99",      limit: 100
    t.string   "user100",     limit: 100
    t.string   "user101",     limit: 100
    t.string   "user102",     limit: 100
    t.string   "user103",     limit: 100
    t.string   "user104",     limit: 100
    t.string   "user105",     limit: 100
    t.string   "user106",     limit: 100
    t.string   "user107",     limit: 100
    t.string   "user108",     limit: 100
    t.string   "user109",     limit: 100
    t.string   "user110",     limit: 100
    t.string   "user111",     limit: 100
    t.string   "user112",     limit: 100
    t.string   "user113",     limit: 100
    t.string   "user114",     limit: 100
    t.string   "user115",     limit: 100
    t.string   "user116",     limit: 100
    t.string   "user117",     limit: 100
    t.string   "user118",     limit: 100
    t.string   "user119",     limit: 100
    t.string   "user120",     limit: 100
    t.string   "user121",     limit: 100
    t.string   "user122",     limit: 100
    t.string   "user123",     limit: 100
    t.string   "user124",     limit: 100
    t.string   "user125",     limit: 100
    t.string   "user126",     limit: 100
    t.string   "user127",     limit: 100
    t.string   "user128",     limit: 100
    t.string   "user129",     limit: 100
    t.string   "user130",     limit: 100
    t.string   "user131",     limit: 100
    t.string   "user132",     limit: 100
    t.string   "user133",     limit: 100
    t.string   "user134",     limit: 100
    t.string   "user135",     limit: 100
    t.string   "user136",     limit: 100
    t.string   "user137",     limit: 100
    t.string   "user138",     limit: 100
    t.string   "user139",     limit: 100
    t.string   "user140",     limit: 100
    t.string   "user141",     limit: 100
    t.string   "user142",     limit: 100
    t.string   "user143",     limit: 100
    t.string   "user144",     limit: 100
    t.string   "user145",     limit: 100
    t.string   "user146",     limit: 100
    t.string   "user147",     limit: 100
    t.string   "user148",     limit: 100
    t.string   "user149",     limit: 100
    t.string   "user150",     limit: 100
    t.string   "user151",     limit: 100
    t.string   "user152",     limit: 100
    t.string   "user153",     limit: 100
    t.string   "user154",     limit: 100
    t.string   "user155",     limit: 100
    t.string   "user156",     limit: 100
    t.string   "user157",     limit: 100
    t.string   "user158",     limit: 100
    t.string   "user159",     limit: 100
    t.string   "user160",     limit: 100
    t.string   "user161",     limit: 100
    t.string   "user162",     limit: 100
    t.string   "user163",     limit: 100
    t.string   "user164",     limit: 100
    t.string   "user165",     limit: 100
    t.string   "user166",     limit: 100
    t.string   "user167",     limit: 100
    t.string   "user168",     limit: 100
    t.string   "user169",     limit: 100
    t.string   "user170",     limit: 100
    t.string   "user171",     limit: 100
    t.string   "user172",     limit: 100
    t.string   "user173",     limit: 100
    t.string   "user174",     limit: 100
    t.string   "user175",     limit: 100
    t.string   "user176",     limit: 100
    t.string   "user177",     limit: 100
    t.string   "user178",     limit: 100
    t.string   "user179",     limit: 100
    t.string   "user180",     limit: 100
    t.string   "user181",     limit: 100
    t.string   "user182",     limit: 100
    t.string   "user183",     limit: 100
    t.string   "user184",     limit: 100
    t.string   "user185",     limit: 100
    t.string   "user186",     limit: 100
    t.string   "user187",     limit: 100
    t.string   "user188",     limit: 100
    t.string   "user189",     limit: 100
    t.string   "user190",     limit: 100
    t.string   "user191",     limit: 100
    t.string   "user192",     limit: 100
    t.string   "user193",     limit: 100
    t.string   "user194",     limit: 100
    t.string   "user195",     limit: 100
    t.string   "user196",     limit: 100
    t.string   "user197",     limit: 100
    t.string   "user198",     limit: 100
    t.string   "user199",     limit: 100
    t.string   "user200",     limit: 100
    t.string   "user201",     limit: 100
    t.string   "user202",     limit: 100
    t.string   "user203",     limit: 100
    t.string   "user204",     limit: 100
    t.string   "user205",     limit: 100
    t.string   "user206",     limit: 100
    t.string   "user207",     limit: 100
    t.string   "user208",     limit: 100
    t.string   "user209",     limit: 100
    t.string   "user210",     limit: 100
    t.string   "user211",     limit: 100
    t.string   "user212",     limit: 100
    t.string   "user213",     limit: 100
    t.string   "user214",     limit: 100
    t.string   "user215",     limit: 100
    t.string   "user216",     limit: 100
    t.string   "user217",     limit: 100
    t.string   "user218",     limit: 100
    t.string   "user219",     limit: 100
    t.string   "user220",     limit: 100
    t.string   "user221",     limit: 100
    t.string   "user222",     limit: 100
    t.string   "user223",     limit: 100
    t.string   "user224",     limit: 100
    t.string   "user225",     limit: 100
    t.string   "user226",     limit: 100
    t.string   "user227",     limit: 100
    t.string   "user228",     limit: 100
    t.string   "user229",     limit: 100
    t.string   "user230",     limit: 100
    t.string   "user231",     limit: 100
    t.string   "user232",     limit: 100
    t.string   "user233",     limit: 100
    t.string   "user234",     limit: 100
    t.string   "user235",     limit: 100
    t.string   "user236",     limit: 100
    t.string   "user237",     limit: 100
    t.string   "user238",     limit: 100
    t.string   "user239",     limit: 100
    t.string   "user240",     limit: 100
    t.string   "user241",     limit: 100
    t.string   "user242",     limit: 100
    t.string   "user243",     limit: 100
    t.string   "user244",     limit: 100
    t.string   "user245",     limit: 100
    t.string   "user246",     limit: 100
    t.string   "user247",     limit: 100
    t.string   "user248",     limit: 100
    t.string   "user249",     limit: 100
    t.string   "user250",     limit: 100
    t.string   "user251",     limit: 100
    t.string   "user252",     limit: 100
    t.string   "user253",     limit: 100
    t.string   "user254",     limit: 100
    t.string   "user255",     limit: 100
    t.string   "user256",     limit: 100
    t.string   "user257",     limit: 100
    t.string   "user258",     limit: 100
    t.string   "user259",     limit: 100
    t.string   "user260",     limit: 100
    t.string   "user261",     limit: 100
    t.string   "user262",     limit: 100
    t.string   "user263",     limit: 100
    t.string   "user264",     limit: 100
    t.string   "user265",     limit: 100
    t.string   "user266",     limit: 100
    t.string   "user267",     limit: 100
    t.string   "user268",     limit: 100
    t.string   "user269",     limit: 100
    t.string   "user270",     limit: 100
    t.string   "user271",     limit: 100
    t.string   "user272",     limit: 100
    t.string   "user273",     limit: 100
    t.string   "user274",     limit: 100
    t.string   "user275",     limit: 100
    t.string   "user276",     limit: 100
    t.string   "user277",     limit: 100
    t.string   "user278",     limit: 100
    t.string   "user279",     limit: 100
    t.string   "user280",     limit: 100
    t.string   "user281",     limit: 100
    t.string   "user282",     limit: 100
    t.string   "user283",     limit: 100
    t.string   "user284",     limit: 100
    t.string   "user285",     limit: 100
    t.string   "user286",     limit: 100
    t.string   "user287",     limit: 100
    t.string   "user288",     limit: 100
    t.string   "user289",     limit: 100
    t.string   "user290",     limit: 100
    t.string   "user291",     limit: 100
    t.string   "user292",     limit: 100
    t.string   "user293",     limit: 100
    t.string   "user294",     limit: 100
    t.string   "user295",     limit: 100
    t.string   "user296",     limit: 100
    t.string   "user297",     limit: 100
    t.string   "user298",     limit: 100
    t.string   "user299",     limit: 100
    t.string   "user300",     limit: 100
    t.string   "user301",     limit: 100
    t.string   "user302",     limit: 100
    t.string   "user303",     limit: 100
    t.string   "user304",     limit: 100
    t.string   "user305",     limit: 100
    t.string   "user306",     limit: 100
    t.string   "user307",     limit: 100
    t.string   "user308",     limit: 100
    t.string   "user309",     limit: 100
    t.string   "user310",     limit: 100
    t.string   "user311",     limit: 100
    t.string   "user312",     limit: 100
    t.string   "user313",     limit: 100
    t.string   "user314",     limit: 100
    t.string   "user315",     limit: 100
    t.string   "user316",     limit: 100
    t.string   "user317",     limit: 100
    t.string   "user318",     limit: 100
    t.string   "user319",     limit: 100
    t.string   "user320",     limit: 100
    t.string   "user321",     limit: 100
    t.string   "user322",     limit: 100
    t.string   "user323",     limit: 100
    t.string   "user324",     limit: 100
    t.string   "user325",     limit: 100
    t.string   "user326",     limit: 100
    t.string   "user327",     limit: 100
    t.string   "user328",     limit: 100
    t.string   "user329",     limit: 100
    t.string   "user330",     limit: 100
    t.string   "user331",     limit: 100
    t.string   "user332",     limit: 100
    t.string   "user333",     limit: 100
    t.string   "user334",     limit: 100
    t.string   "user335",     limit: 100
    t.string   "user336",     limit: 100
    t.string   "user337",     limit: 100
    t.string   "user338",     limit: 100
    t.string   "user339",     limit: 100
    t.string   "user340",     limit: 100
    t.string   "user341",     limit: 100
    t.string   "user342",     limit: 100
    t.string   "user343",     limit: 100
    t.string   "user344",     limit: 100
    t.string   "user345",     limit: 100
    t.string   "user346",     limit: 100
    t.string   "user347",     limit: 100
    t.string   "user348",     limit: 100
    t.string   "user349",     limit: 100
    t.string   "user350",     limit: 100
    t.string   "user351",     limit: 100
    t.string   "user352",     limit: 100
    t.string   "user353",     limit: 100
    t.string   "user354",     limit: 100
    t.string   "user355",     limit: 100
    t.string   "user356",     limit: 100
    t.string   "user357",     limit: 100
    t.string   "user358",     limit: 100
    t.string   "user359",     limit: 100
    t.string   "user360",     limit: 100
    t.string   "user361",     limit: 100
    t.string   "user362",     limit: 100
    t.string   "user363",     limit: 100
    t.string   "user364",     limit: 100
    t.string   "user365",     limit: 100
    t.string   "user366",     limit: 100
    t.string   "user367",     limit: 100
    t.string   "user368",     limit: 100
    t.string   "user369",     limit: 100
    t.string   "user370",     limit: 100
    t.string   "user371",     limit: 100
    t.string   "user372",     limit: 100
    t.string   "user373",     limit: 100
    t.string   "user374",     limit: 100
    t.string   "user375",     limit: 100
    t.string   "user376",     limit: 100
    t.string   "user377",     limit: 100
    t.string   "user378",     limit: 100
    t.string   "user379",     limit: 100
    t.string   "user380",     limit: 100
    t.string   "user381",     limit: 100
    t.string   "user382",     limit: 100
    t.string   "user383",     limit: 100
    t.string   "user384",     limit: 100
    t.string   "user385",     limit: 100
    t.string   "user386",     limit: 100
    t.string   "user387",     limit: 100
    t.string   "user388",     limit: 100
    t.string   "user389",     limit: 100
    t.string   "user390",     limit: 100
    t.string   "user391",     limit: 100
    t.string   "user392",     limit: 100
    t.string   "user393",     limit: 100
    t.string   "user394",     limit: 100
    t.string   "user395",     limit: 100
    t.string   "user396",     limit: 100
    t.string   "user397",     limit: 100
    t.string   "user398",     limit: 100
    t.string   "user399",     limit: 100
    t.string   "user400",     limit: 100
    t.string   "user401",     limit: 100
    t.string   "user402",     limit: 100
    t.string   "user403",     limit: 100
    t.string   "user404",     limit: 100
    t.string   "user405",     limit: 100
    t.string   "user406",     limit: 100
    t.string   "user407",     limit: 100
    t.string   "user408",     limit: 100
    t.string   "user409",     limit: 100
    t.string   "user410",     limit: 100
    t.string   "user411",     limit: 100
    t.string   "user412",     limit: 100
    t.string   "user413",     limit: 100
    t.string   "user414",     limit: 100
    t.string   "user415",     limit: 100
    t.string   "user416",     limit: 100
    t.string   "user417",     limit: 100
    t.string   "user418",     limit: 100
    t.string   "user419",     limit: 100
    t.string   "user420",     limit: 100
    t.string   "user421",     limit: 100
    t.string   "user422",     limit: 100
    t.string   "user423",     limit: 100
    t.string   "user424",     limit: 100
    t.string   "user425",     limit: 100
    t.string   "user426",     limit: 100
    t.string   "user427",     limit: 100
    t.string   "user428",     limit: 100
    t.string   "user429",     limit: 100
    t.string   "user430",     limit: 100
    t.string   "user431",     limit: 100
    t.string   "user432",     limit: 100
    t.string   "user433",     limit: 100
    t.string   "user434",     limit: 100
    t.string   "user435",     limit: 100
    t.string   "user436",     limit: 100
    t.string   "user437",     limit: 100
    t.string   "user438",     limit: 100
    t.string   "user439",     limit: 100
    t.string   "user440",     limit: 100
    t.string   "user441",     limit: 100
    t.string   "user442",     limit: 100
    t.string   "user443",     limit: 100
    t.string   "user444",     limit: 100
    t.string   "user445",     limit: 100
    t.string   "user446",     limit: 100
    t.string   "user447",     limit: 100
    t.string   "user448",     limit: 100
    t.string   "user449",     limit: 100
    t.string   "user450",     limit: 100
    t.string   "user451",     limit: 100
    t.string   "user452",     limit: 100
    t.string   "user453",     limit: 100
    t.string   "user454",     limit: 100
    t.string   "user455",     limit: 100
    t.string   "user456",     limit: 100
    t.string   "user457",     limit: 100
    t.string   "user458",     limit: 100
    t.string   "user459",     limit: 100
    t.string   "user460",     limit: 100
    t.string   "user461",     limit: 100
    t.string   "user462",     limit: 100
    t.string   "user463",     limit: 100
    t.string   "user464",     limit: 100
    t.string   "user465",     limit: 100
    t.string   "user466",     limit: 100
    t.string   "user467",     limit: 100
    t.string   "user468",     limit: 100
    t.string   "user469",     limit: 100
    t.string   "user470",     limit: 100
    t.string   "user471",     limit: 100
    t.string   "user472",     limit: 100
    t.string   "user473",     limit: 100
    t.string   "user474",     limit: 100
    t.string   "user475",     limit: 100
    t.string   "user476",     limit: 100
    t.string   "user477",     limit: 100
    t.string   "user478",     limit: 100
    t.string   "user479",     limit: 100
    t.string   "user480",     limit: 100
    t.string   "user481",     limit: 100
    t.string   "user482",     limit: 100
    t.string   "user483",     limit: 100
    t.string   "user484",     limit: 100
    t.string   "user485",     limit: 100
    t.string   "user486",     limit: 100
    t.string   "user487",     limit: 100
    t.string   "user488",     limit: 100
    t.string   "user489",     limit: 100
    t.string   "user490",     limit: 100
    t.string   "user491",     limit: 100
    t.string   "user492",     limit: 100
    t.string   "user493",     limit: 100
    t.string   "user494",     limit: 100
    t.string   "user495",     limit: 100
    t.string   "user496",     limit: 100
    t.string   "user497",     limit: 100
    t.string   "user498",     limit: 100
    t.string   "user499",     limit: 100
    t.string   "user500",     limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["book_title"], name: "index_books_on_book_title", unique: true

  create_table "channels", force: true do |t|
    t.string  "channel_name",              null: false
    t.integer "total_message", default: 0, null: false
    t.integer "first_side",    default: 0, null: false
    t.integer "second_side",   default: 0, null: false
  end

  add_index "channels", ["channel_name"], name: "index_channels_on_channel_name", unique: true

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

  add_index "courses", ["course_name"], name: "index_courses_on_course_name", unique: true

  create_table "messages", force: true do |t|
    t.string   "sender",     null: false
    t.string   "receiver",   null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "msgcounts", force: true do |t|
    t.string  "username",             null: false
    t.integer "count",    default: 0, null: false
    t.integer "unread",   default: 0, null: false
  end

  add_index "msgcounts", ["username"], name: "index_msgcounts_on_username", unique: true

  create_table "userbooks", force: true do |t|
    t.string   "email",                                  null: false
    t.string   "username",                               null: false
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

  add_index "userbooks", ["email"], name: "index_userbooks_on_email", unique: true
  add_index "userbooks", ["username"], name: "index_userbooks_on_username", unique: true

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
    t.string   "email",                                 null: false
    t.string   "username",                              null: false
    t.integer  "traded",                    default: 0, null: false
    t.text     "tradedbook1",   limit: 100
    t.text     "tradedbook2",   limit: 100
    t.text     "tradedbook3",   limit: 100
    t.text     "tradedbook4",   limit: 100
    t.text     "tradedbook5",   limit: 100
    t.text     "tradedbook6",   limit: 100
    t.text     "tradedbook7",   limit: 100
    t.text     "tradedbook8",   limit: 100
    t.text     "tradedbook9",   limit: 100
    t.text     "tradedbook10",  limit: 100
    t.text     "tradedbook11",  limit: 100
    t.text     "tradedbook12",  limit: 100
    t.text     "tradedbook13",  limit: 100
    t.text     "tradedbook14",  limit: 100
    t.text     "tradedbook15",  limit: 100
    t.text     "tradedbook16",  limit: 100
    t.text     "tradedbook17",  limit: 100
    t.text     "tradedbook18",  limit: 100
    t.text     "tradedbook19",  limit: 100
    t.text     "tradedbook20",  limit: 100
    t.text     "tradedbook21",  limit: 100
    t.text     "tradedbook22",  limit: 100
    t.text     "tradedbook23",  limit: 100
    t.text     "tradedbook24",  limit: 100
    t.text     "tradedbook25",  limit: 100
    t.text     "tradedbook26",  limit: 100
    t.text     "tradedbook27",  limit: 100
    t.text     "tradedbook28",  limit: 100
    t.text     "tradedbook29",  limit: 100
    t.text     "tradedbook30",  limit: 100
    t.text     "tradedbook31",  limit: 100
    t.text     "tradedbook32",  limit: 100
    t.text     "tradedbook33",  limit: 100
    t.text     "tradedbook34",  limit: 100
    t.text     "tradedbook35",  limit: 100
    t.text     "tradedbook36",  limit: 100
    t.text     "tradedbook37",  limit: 100
    t.text     "tradedbook38",  limit: 100
    t.text     "tradedbook39",  limit: 100
    t.text     "tradedbook40",  limit: 100
    t.text     "tradedbook41",  limit: 100
    t.text     "tradedbook42",  limit: 100
    t.text     "tradedbook43",  limit: 100
    t.text     "tradedbook44",  limit: 100
    t.text     "tradedbook45",  limit: 100
    t.text     "tradedbook46",  limit: 100
    t.text     "tradedbook47",  limit: 100
    t.text     "tradedbook48",  limit: 100
    t.text     "tradedbook49",  limit: 100
    t.text     "tradedbook50",  limit: 100
    t.text     "tradedbook51",  limit: 100
    t.text     "tradedbook52",  limit: 100
    t.text     "tradedbook53",  limit: 100
    t.text     "tradedbook54",  limit: 100
    t.text     "tradedbook55",  limit: 100
    t.text     "tradedbook56",  limit: 100
    t.text     "tradedbook57",  limit: 100
    t.text     "tradedbook58",  limit: 100
    t.text     "tradedbook59",  limit: 100
    t.text     "tradedbook60",  limit: 100
    t.text     "tradedbook61",  limit: 100
    t.text     "tradedbook62",  limit: 100
    t.text     "tradedbook63",  limit: 100
    t.text     "tradedbook64",  limit: 100
    t.text     "tradedbook65",  limit: 100
    t.text     "tradedbook66",  limit: 100
    t.text     "tradedbook67",  limit: 100
    t.text     "tradedbook68",  limit: 100
    t.text     "tradedbook69",  limit: 100
    t.text     "tradedbook70",  limit: 100
    t.text     "tradedbook71",  limit: 100
    t.text     "tradedbook72",  limit: 100
    t.text     "tradedbook73",  limit: 100
    t.text     "tradedbook74",  limit: 100
    t.text     "tradedbook75",  limit: 100
    t.text     "tradedbook76",  limit: 100
    t.text     "tradedbook77",  limit: 100
    t.text     "tradedbook78",  limit: 100
    t.text     "tradedbook79",  limit: 100
    t.text     "tradedbook80",  limit: 100
    t.text     "tradedbook81",  limit: 100
    t.text     "tradedbook82",  limit: 100
    t.text     "tradedbook83",  limit: 100
    t.text     "tradedbook84",  limit: 100
    t.text     "tradedbook85",  limit: 100
    t.text     "tradedbook86",  limit: 100
    t.text     "tradedbook87",  limit: 100
    t.text     "tradedbook88",  limit: 100
    t.text     "tradedbook89",  limit: 100
    t.text     "tradedbook90",  limit: 100
    t.text     "tradedbook91",  limit: 100
    t.text     "tradedbook92",  limit: 100
    t.text     "tradedbook93",  limit: 100
    t.text     "tradedbook94",  limit: 100
    t.text     "tradedbook95",  limit: 100
    t.text     "tradedbook96",  limit: 100
    t.text     "tradedbook97",  limit: 100
    t.text     "tradedbook98",  limit: 100
    t.text     "tradedbook99",  limit: 100
    t.text     "tradedbook100", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usertradeds", ["email"], name: "index_usertradeds_on_email", unique: true
  add_index "usertradeds", ["username"], name: "index_usertradeds_on_username", unique: true

end
