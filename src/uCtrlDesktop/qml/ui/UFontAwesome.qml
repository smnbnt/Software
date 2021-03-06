import QtQuick 2.0

import "../label" as ULabel
import "UColors.js" as Colors

Item {
    property string iconId: "Ok"
    property int iconSize: 16
    property color iconColor: Colors.uBlack

    property variant fontawesome: {
        "Glass"             : "\uf000",
        "Music"             : "\uf001",
        "Search"            : "\uf002",
        "Envelope"          : "\uf003",
        "Heart"             : "\uf004",
        "Star"              : "\uf005",
        "StarEmpty"         : "\uf006",
        "User"              : "\uf007",
        "Film"              : "\uf008",
        "ThLarge"           : "\uf009",
        "Th"                : "\uf00a",
        "ThList"            : "\uf00b",
        "Ok"                : "\uf00c",
        "Remove"            : "\uf00d",
        "ZoomIn"            : "\uf00e",
        "ZoomOut"           : "\uf010",
        "Off"               : "\uf011",
        "Signal"            : "\uf012",
        "Cog"               : "\uf013",
        "Trash"             : "\uf014",
        "Home"              : "\uf015",
        "File"              : "\uf016",
        "Time"              : "\uf017",
        "Road"              : "\uf018",
        "DownloadAlt"       : "\uf019",
        "Download"          : "\uf01a",
        "Upload"            : "\uf01b",
        "Inbox"             : "\uf01c",
        "PlayCircle"        : "\uf01d",
        "Repeat"            : "\uf01e",
        "Refresh"           : "\uf021",
        "ListAlt"           : "\uf022",
        "Lock"              : "\uf023",
        "Flag"              : "\uf024",
        "Headphones"		: "\uf025",
        "VolumeOff"         : "\uf026",
        "VolumeDown"        : "\uf027",
        "VolumeUp"          : "\uf028",
        "Qrcode"            : "\uf029",
        "Barcode"           : "\uf02a",
        "Tag"               : "\uf02b",
        "Tags"              : "\uf02c",
        "Book"              : "\uf02d",
        "Bookmark"          : "\uf02e",
        "Print"             : "\uf02f",
        "Camera"            : "\uf030",
        "Font"              : "\uf031",
        "Bold"              : "\uf032",
        "Italic"            : "\uf033",
        "TextHeight"        : "\uf034",
        "TextWidth"         : "\uf035",
        "AlignLeft"         : "\uf036",
        "AlignCenter"       : "\uf037",
        "AlignRight"        : "\uf038",
        "AlignJustify"      : "\uf039",
        "List"              : "\uf03a",
        "IndentLeft"        : "\uf03b",
        "IndentRight"       : "\uf03c",
        "FacetimeVideo"     : "\uf03d",
        "Picture"           : "\uf03e",
        "Pencil"            : "\uf040",
        "MapMarker"         : "\uf041",
        "Adjust"            : "\uf042",
        "Tint"              : "\uf043",
        "Edit"              : "\uf044",
        "Share"             : "\uf045",
        "Check"             : "\uf046",
        "Move"              : "\uf047",
        "StepBackward"      : "\uf048",
        "StepForward"       : "\uf049",
        "Backward"          : "\uf04a",
        "Play"              : "\uf04b",
        "Pause"             : "\uf04c",
        "Stop"              : "\uf04d",
        "Forward"           : "\uf04e",
        "FastForward"       : "\uf050",
        "StepForward"       : "\uf051",
        "Eject"             : "\uf052",
        "ChevronLeft"       : "\uf053",
        "ChevronRight"      : "\uf054",
        "PlusSign"          : "\uf055",
        "MinusSign"         : "\uf056",
        "RemoveSign"        : "\uf057",
        "OkSign"            : "\uf058",
        "QuestionSign"      : "\uf059",
        "InfoSign"          : "\uf05a",
        "Screenshot"        : "\uf05b",
        "RemoveCircle"      : "\uf05c",
        "OkCircle"          : "\uf05d",
        "BanCircle"         : "\uf05e",
        "ArrowLeft"         : "\uf060",
        "ArrowRight"        : "\uf061",
        "ArrowUp"           : "\uf062",
        "ArrowDown"         : "\uf063",
        "ShareAlt"          : "\uf064",
        "ResizeFull"        : "\uf065",
        "ResizeSmall"       : "\uf066",
        "Plus"              : "\uf067",
        "Minus"             : "\uf068",
        "Asterish"          : "\uf069",
        "ExclamationSign"   : "\uf06a",
        "Gift"              : "\uf06b",
        "Leave"             : "\uf06c",
        "Fire"              : "\uf06d",
        "EyeOpen"           : "\uf06e",
        "EyeClose"          : "\uf070",
        "WarningSign"       : "\uf071",
        "Plane"             : "\uf072",
        "Calendar"          : "\uf073",
        "Random"            : "\uf074",
        "Comment"           : "\uf075",
        "Magnet"            : "\uf076",
        "ChevronUp"         : "\uf077",
        "ChevronDown"       : "\uf078",
        "Retweet"           : "\uf079",
        "ShoppingCart"      : "\uf07a",
        "FolderClose"       : "\uf07b",
        "FolderOpen"        : "\uf07c",
        "ResizeVertical"    : "\uf07d",
        "ResizeHorizontal"  : "\uf07e",
        "BarChart"          : "\uf080",
        "TwitterSign"       : "\uf081",
        "FacebookSign"      : "\uf082",
        "CameraRetro"       : "\uf083",
        "Key"               : "\uf084",
        "Cogs"              : "\uf085",
        "Comments"          : "\uf086",
        "ThumbsUp"          : "\uf087",
        "ThumbsDown"        : "\uf088",
        "StarHalf"          : "\uf089",
        "HeartEmpty"        : "\uf08a",
        "Signout"           : "\uf08b",
        "LinkedinSign"      : "\uf08c",
        "Pushpin"           : "\uf08d",
        "ExternalLink"      : "\uf08e",
        "Signin"            : "\uf090",
        "Trophy"            : "\uf091",
        "GithubSign"        : "\uf092",
        "UploadAlt"         : "\uf093",
        "Lemon"             : "\uf094",
        "Phone"             : "\uf095",
        "CheckEmpty"        : "\uf096",
        "BookmarkEmpty"     : "\uf097",
        "PhoneSign"         : "\uf098",
        "Twitter"           : "\uf099",
        "Facebook"          : "\uf09a",
        "Github"            : "\uf09b",
        "Unlock"            : "\uf09c",
        "CreditCard"        : "\uf09d",
        "Rss"               : "\uf09e",
        "Hdd"               : "\uf0a0",
        "Bullhorn"          : "\uf0a1",
        "Bell"              : "\uf0a2",
        "Certificate"       : "\uf0a3",
        "HandRight"         : "\uf0a4",
        "HandLeft"          : "\uf0a5",
        "HandUp"            : "\uf0a6",
        "HandDown"          : "\uf0a7",
        "CircleArrowLeft"   : "\uf0a8",
        "CircleArrowRight"  : "\uf0a9",
        "CircleArrowUp"     : "\uf0aa",
        "CircleArrowDown"   : "\uf0ab",
        "Globe"             : "\uf0ac",
        "Wrench"            : "\uf0ad",
        "Tasks"             : "\uf0ae",
        "Filter"            : "\uf0b0",
        "Briefcase"         : "\uf0b1",
        "Fullscreen"        : "\uf0b2",
        "Group"             : "\uf0c0",
        "Link"              : "\uf0c1",
        "Cloud"             : "\uf0c2",
        "Beaker"            : "\uf0c3",
        "Cut"               : "\uf0c4",
        "Copy"              : "\uf0c5",
        "PaperClip"         : "\uf0c6",
        "Save"              : "\uf0c7",
        "SignBlank"         : "\uf0c8",
        "Reorder"           : "\uf0c9",
        "ListUl"            : "\uf0ca",
        "ListOl"            : "\uf0cb",
        "Strikethrough"     : "\uf0cc",
        "Underline"         : "\uf0cd",
        "Table"             : "\uf0ce",
        "Magic"             : "\uf0d0",
        "Truck"             : "\uf0d1",
        "Pinterest"         : "\uf0d2",
        "PinterestSign"     : "\uf0d3",
        "GooglePlusSign"    : "\uf0d4",
        "GooglePlus"        : "\uf0d5",
        "Money"             : "\uf0d6",
        "CaretDown"         : "\uf0d7",
        "CaretUp"           : "\uf0d8",
        "CaretLeft"         : "\uf0d9",
        "CaretRight"        : "\uf0da",
        "Columns"           : "\uf0db",
        "Sort"              : "\uf0dc",
        "SortDown"          : "\uf0dd",
        "SortUp"            : "\uf0de",
        "EnvelopeAlt"       : "\uf0e0",
        "Linkedin"          : "\uf0e1",
        "Undo"              : "\uf0e2",
        "Legal"             : "\uf0e3",
        "Dashboard"         : "\uf0e4",
        "CommentAlt"        : "\uf0e5",
        "CommentsAlt"       : "\uf0e6",
        "Bolt"              : "\uf0e7",
        "Sitemap"           : "\uf0e8",
        "Umbrella"          : "\uf0e9",
        "Paste"             : "\uf0ea",
        "LocationArrow"     : "\uf124",
        "Microphone"        : "\uf130",
        "CalendarEmpty"     : "\uf133",
        "SortAlphabetical"  : "\uf15d",
        "UserMd"            : "\uf200",
        "Plug"              : "\uf1e6",
        "Lightbulb"         : "\uf0eb",
        "ToggleOn"          : "\uf205",
        "QuestionMark"      : "\uf128",
        ""                  : "",
    }

    property variant icomoon: {
        "home": "\ue600",
        "home2": "\ue601",
        "home3": "\ue602",
        "office": "\ue603",
        "newspaper": "\ue604",
        "pencil": "\ue605",
        "pencil2": "\ue606",
        "quill": "\ue607",
        "pen": "\ue608",
        "blog": "\ue609",
        "droplet": "\ue60a",
        "paint-format": "\ue60b",
        "image": "\ue60c",
        "image2": "\ue60d",
        "images": "\ue60e",
        "camera": "\ue60f",
        "music": "\ue610",
        "headphones": "\ue611",
        "play": "\ue612",
        "film": "\ue613",
        "camera2": "\ue614",
        "dice": "\ue615",
        "pacman": "\ue616",
        "spades": "\ue617",
        "clubs": "\ue618",
        "diamonds": "\ue619",
        "pawn": "\ue61a",
        "bullhorn": "\ue61b",
        "connection": "\ue61c",
        "podcast": "\ue61d",
        "feed": "\ue61e",
        "book": "\ue61f",
        "books": "\ue620",
        "library": "\ue621",
        "file": "\ue622",
        "profile": "\ue623",
        "file2": "\ue624",
        "file3": "\ue625",
        "file4": "\ue626",
        "copy": "\ue627",
        "copy2": "\ue628",
        "copy3": "\ue629",
        "paste": "\ue62a",
        "paste2": "\ue62b",
        "paste3": "\ue62c",
        "stack": "\ue62d",
        "folder": "\ue62e",
        "folder-open": "\ue62f",
        "tag": "\ue630",
        "tags": "\ue631",
        "barcode": "\ue632",
        "qrcode": "\ue633",
        "ticket": "\ue634",
        "cart": "\ue635",
        "cart2": "\ue636",
        "cart3": "\ue637",
        "coin": "\ue638",
        "credit": "\ue639",
        "calculate": "\ue63a",
        "support": "\ue63b",
        "phone": "\ue63c",
        "phone-hang-up": "\ue63d",
        "address-book": "\ue63e",
        "notebook": "\ue63f",
        "envelope": "\ue640",
        "pushpin": "\ue641",
        "location": "\ue642",
        "location2": "\ue643",
        "compass": "\ue644",
        "map": "\ue645",
        "map2": "\ue646",
        "history": "\ue647",
        "clock": "\ue648",
        "clock2": "\ue649",
        "alarm": "\ue64a",
        "alarm2": "\ue64b",
        "bell": "\ue64c",
        "stopwatch": "\ue64d",
        "calendar": "\ue64e",
        "calendar2": "\ue64f",
        "print": "\ue650",
        "keyboard": "\ue651",
        "screen": "\ue652",
        "laptop": "\ue653",
        "mobile": "\ue654",
        "mobile2": "\ue655",
        "tablet": "\ue656",
        "tv": "\ue657",
        "cabinet": "\ue658",
        "drawer": "\ue659",
        "drawer2": "\ue65a",
        "drawer3": "\ue65b",
        "box-add": "\ue65c",
        "box-remove": "\ue65d",
        "download": "\ue65e",
        "upload": "\ue65f",
        "disk": "\ue660",
        "storage": "\ue661",
        "undo": "\ue662",
        "redo": "\ue663",
        "flip": "\ue664",
        "flip2": "\ue665",
        "undo2": "\ue666",
        "redo2": "\ue667",
        "forward": "\ue668",
        "reply": "\ue669",
        "bubble": "\ue66a",
        "bubbles": "\ue66b",
        "bubbles2": "\ue66c",
        "bubble2": "\ue66d",
        "bubbles3": "\ue66e",
        "bubbles4": "\ue66f",
        "user": "\ue670",
        "users": "\ue671",
        "user2": "\ue672",
        "users2": "\ue673",
        "user3": "\ue674",
        "user4": "\ue675",
        "quotes-left": "\ue676",
        "busy": "\ue677",
        "spinner": "\ue678",
        "spinner2": "\ue679",
        "spinner3": "\ue67a",
        "spinner4": "\ue67b",
        "spinner5": "\ue67c",
        "spinner6": "\ue67d",
        "binoculars": "\ue67e",
        "search": "\ue67f",
        "zoomin": "\ue680",
        "zoomout": "\ue681",
        "expand": "\ue682",
        "contract": "\ue683",
        "expand2": "\ue684",
        "contract2": "\ue685",
        "key": "\ue686",
        "key2": "\ue687",
        "lock": "\ue688",
        "lock2": "\ue689",
        "unlocked": "\ue7b8",
        "wrench": "\ue7b9",
        "settings": "\ue7ba",
        "equalizer": "\ue7bb",
        "cog": "\ue7bc",
        "cogs": "\ue68a",
        "cog2": "\ue68b",
        "hammer": "\ue68c",
        "wand": "\ue68d",
        "aid": "\ue68e",
        "bug": "\ue68f",
        "pie": "\ue690",
        "stats": "\ue691",
        "bars": "\ue692",
        "bars2": "\ue693",
        "gift": "\ue7bd",
        "trophy": "\ue694",
        "glass": "\ue695",
        "mug": "\ue696",
        "food": "\ue697",
        "leaf": "\ue698",
        "rocket": "\ue699",
        "meter": "\ue7be",
        "meter2": "\ue7bf",
        "dashboard": "\ue7c0",
        "hammer2": "\ue7c1",
        "fire": "\ue7c2",
        "lab": "\ue69a",
        "magnet": "\ue69b",
        "remove": "\ue69c",
        "remove2": "\ue69d",
        "briefcase": "\ue69e",
        "airplane": "\ue69f",
        "truck": "\ue6a0",
        "road": "\ue6a1",
        "accessibility": "\ue6a2",
        "target": "\ue6a3",
        "shield": "\ue6a4",
        "lightning": "\ue6a5",
        "switch": "\ue6a6",
        "powercord": "\ue6a7",
        "signup": "\ue6a8",
        "list": "\ue6a9",
        "list2": "\ue6aa",
        "numbered-list": "\ue6ab",
        "menu": "\ue6ac",
        "menu2": "\ue6ad",
        "tree": "\ue6ae",
        "cloud": "\ue6af",
        "cloud-download": "\ue6b0",
        "cloud-upload": "\ue6b1",
        "download2": "\ue6b2",
        "upload2": "\ue6b3",
        "download3": "\ue6b4",
        "upload3": "\ue6b5",
        "globe": "\ue6b6",
        "earth": "\ue6b7",
        "link": "\ue6b8",
        "flag": "\ue6b9",
        "attachment": "\ue6ba",
        "eye": "\ue6bb",
        "eye-blocked": "\ue6bc",
        "eye2": "\ue6bd",
        "bookmark": "\ue6be",
        "bookmarks": "\ue6bf",
        "brightness-medium": "\ue6c0",
        "brightness-contrast": "\ue6c1",
        "contrast": "\ue6c2",
        "star": "\ue6c3",
        "star2": "\ue6c4",
        "star3": "\ue6c5",
        "heart": "\ue6c6",
        "heart2": "\ue6c7",
        "heart-broken": "\ue6c8",
        "thumbs-up": "\ue6c9",
        "thumbs-up2": "\ue6ca",
        "happy": "\ue6cb",
        "happy2": "\ue6cc",
        "smiley": "\ue6cd",
        "smiley2": "\ue6ce",
        "tongue": "\ue6cf",
        "tongue2": "\ue6d0",
        "sad": "\ue6d1",
        "sad2": "\ue6d2",
        "wink": "\ue6d3",
        "wink2": "\ue6d4",
        "grin": "\ue6d5",
        "grin2": "\ue6d6",
        "cool": "\ue6d7",
        "cool2": "\ue6d8",
        "angry": "\ue6d9",
        "angry2": "\ue6da",
        "evil": "\ue6db",
        "evil2": "\ue6dc",
        "shocked": "\ue6dd",
        "shocked2": "\ue6de",
        "confused": "\ue6df",
        "confused2": "\ue6e0",
        "neutral": "\ue6e1",
        "neutral2": "\ue6e2",
        "wondering": "\ue6e3",
        "wondering2": "\ue6e4",
        "point-up": "\ue6e5",
        "point-right": "\ue6e6",
        "point-down": "\ue6e7",
        "point-left": "\ue6e8",
        "warning": "\ue6e9",
        "notification": "\ue6ea",
        "question": "\ue6eb",
        "info": "\ue6ec",
        "info2": "\ue6ed",
        "blocked": "\ue6ee",
        "cancel-circle": "\ue6ef",
        "checkmark-circle": "\ue6f0",
        "spam": "\ue6f1",
        "close": "\ue6f2",
        "checkmark": "\ue6f3",
        "checkmark2": "\ue6f4",
        "spell-check": "\ue6f5",
        "minus": "\ue6f6",
        "plus": "\ue6f7",
        "enter": "\ue6f8",
        "exit": "\ue6f9",
        "play2": "\ue6fa",
        "pause": "\ue6fb",
        "stop": "\ue6fc",
        "backward": "\ue6fd",
        "forward2": "\ue6fe",
        "play3": "\ue6ff",
        "pause2": "\ue700",
        "stop2": "\ue701",
        "backward2": "\ue702",
        "forward3": "\ue703",
        "first": "\ue704",
        "last": "\ue705",
        "previous": "\ue706",
        "next": "\ue707",
        "eject": "\ue708",
        "volume-high": "\ue709",
        "volume-medium": "\ue70a",
        "volume-low": "\ue70b",
        "volume-mute": "\ue70c",
        "volume-mute2": "\ue70d",
        "volume-increase": "\ue70e",
        "volume-decrease": "\ue70f",
        "loop": "\ue710",
        "loop2": "\ue711",
        "loop3": "\ue712",
        "shuffle": "\ue713",
        "arrow-up-left": "\ue714",
        "arrow-up": "\ue715",
        "arrow-up-right": "\ue716",
        "arrow-right": "\ue717",
        "arrow-down-right": "\ue718",
        "arrow-down": "\ue719",
        "arrow-down-left": "\ue71a",
        "arrow-left": "\ue71b",
        "arrow-up-left2": "\ue71c",
        "arrow-up2": "\ue71d",
        "arrow-up-right2": "\ue71e",
        "arrow-right2": "\ue71f",
        "arrow-down-right2": "\ue720",
        "arrow-down2": "\ue721",
        "arrow-down-left2": "\ue722",
        "arrow-left2": "\ue723",
        "arrow-up-left3": "\ue724",
        "arrow-up3": "\ue725",
        "arrow-up-right3": "\ue726",
        "arrow-right3": "\ue727",
        "arrow-down-right3": "\ue728",
        "arrow-down3": "\ue729",
        "arrow-down-left3": "\ue72a",
        "arrow-left3": "\ue72b",
        "tab": "\ue72c",
        "checkbox-checked": "\ue72d",
        "checkbox-unchecked": "\ue72e",
        "checkbox-partial": "\ue72f",
        "radio-checked": "\ue730",
        "radio-unchecked": "\ue731",
        "crop": "\ue732",
        "scissors": "\ue733",
        "filter": "\ue734",
        "filter2": "\ue735",
        "font": "\ue736",
        "text-height": "\ue737",
        "text-width": "\ue738",
        "bold": "\ue739",
        "underline": "\ue73a",
        "italic": "\ue73b",
        "strikethrough": "\ue73c",
        "omega": "\ue73d",
        "sigma": "\ue73e",
        "table": "\ue73f",
        "table2": "\ue740",
        "insert-template": "\ue741",
        "pilcrow": "\ue742",
        "lefttoright": "\ue743",
        "righttoleft": "\ue744",
        "paragraph-left": "\ue745",
        "paragraph-center": "\ue746",
        "paragraph-right": "\ue747",
        "paragraph-justify": "\ue748",
        "paragraph-left2": "\ue749",
        "paragraph-center2": "\ue74a",
        "paragraph-right2": "\ue74b",
        "paragraph-justify2": "\ue74c",
        "indent-increase": "\ue74d",
        "indent-decrease": "\ue74e",
        "newtab": "\ue74f",
        "embed": "\ue750",
        "code": "\ue751",
        "console": "\ue752",
        "share": "\ue753",
        "mail": "\ue754",
        "mail2": "\ue755",
        "mail3": "\ue756",
        "mail4": "\ue757",
        "google": "\ue758",
        "googleplus": "\ue759",
        "googleplus2": "\ue75a",
        "googleplus3": "\ue75b",
        "googleplus4": "\ue75c",
        "google-drive": "\ue75d",
        "facebook": "\ue75e",
        "facebook2": "\ue75f",
        "facebook3": "\ue760",
        "instagram": "\ue761",
        "twitter": "\ue762",
        "twitter2": "\ue763",
        "twitter3": "\ue764",
        "feed2": "\ue765",
        "feed3": "\ue766",
        "feed4": "\ue767",
        "youtube": "\ue768",
        "youtube2": "\ue769",
        "vimeo": "\ue76a",
        "vimeo2": "\ue76b",
        "vimeo3": "\ue76c",
        "lanyrd": "\ue76d",
        "flickr": "\ue76e",
        "flickr2": "\ue76f",
        "flickr3": "\ue770",
        "flickr4": "\ue771",
        "picassa": "\ue772",
        "picassa2": "\ue773",
        "dribbble": "\ue774",
        "dribbble2": "\ue775",
        "dribbble3": "\ue776",
        "forrst": "\ue777",
        "forrst2": "\ue778",
        "deviantart": "\ue779",
        "deviantart2": "\ue77a",
        "steam": "\ue77b",
        "steam2": "\ue77c",
        "github": "\ue77d",
        "github2": "\ue77e",
        "github3": "\ue77f",
        "github4": "\ue780",
        "github5": "\ue781",
        "wordpress": "\ue782",
        "wordpress2": "\ue783",
        "joomla": "\ue784",
        "blogger": "\ue785",
        "blogger2": "\ue786",
        "tumblr": "\ue787",
        "tumblr2": "\ue788",
        "yahoo": "\ue789",
        "tux": "\ue78a",
        "apple": "\ue78b",
        "finder": "\ue78c",
        "android": "\ue78d",
        "windows": "\ue78e",
        "windows8": "\ue78f",
        "soundcloud": "\ue790",
        "soundcloud2": "\ue791",
        "skype": "\ue792",
        "reddit": "\ue793",
        "linkedin": "\ue794",
        "lastfm": "\ue795",
        "lastfm2": "\ue796",
        "delicious": "\ue797",
        "stumbleupon": "\ue798",
        "stumbleupon2": "\ue799",
        "stackoverflow": "\ue79a",
        "pinterest": "\ue79b",
        "pinterest2": "\ue79c",
        "xing": "\ue79d",
        "xing2": "\ue79e",
        "flattr": "\ue79f",
        "foursquare": "\ue7a0",
        "foursquare2": "\ue7a1",
        "paypal": "\ue7a2",
        "paypal2": "\ue7a3",
        "paypal3": "\ue7a4",
        "yelp": "\ue7a5",
        "libreoffice": "\ue7a6",
        "file-pdf": "\ue7a7",
        "file-openoffice": "\ue7a8",
        "file-word": "\ue7a9",
        "file-excel": "\ue7aa",
        "file-zip": "\ue7ab",
        "file-powerpoint": "\ue7ac",
        "file-xml": "\ue7ad",
        "file-css": "\ue7ae",
        "html5": "\ue7af",
        "html52": "\ue7b0",
        "css3": "\ue7b1",
        "chrome": "\ue7b2",
        "firefox": "\ue7b3",
        "IE": "\ue7b4",
        "opera": "\ue7b5",
        "safari": "\ue7b6",
        "thermometer": "\ue600",
        "IcoMoon": "\ue7b7",
        "": "",
    }

    FontLoader {
        id: fontAwesome
        source: "../fonts/fontawesome-webfont.ttf"
    }

    FontLoader {
        id: icoMoon
        source: "../fonts/icomoon.ttf"
    }

    ULabel.Default {
        id: labelFontAwesome
        renderType: Text.QtRendering

        anchors.centerIn: parent
        font.pointSize: iconSize
        font.family: (icomoon[iconId] ? icoMoon.name : fontAwesome.name)
        text: (icomoon[iconId] ? icomoon[iconId] : fontawesome[iconId])
        color: iconColor
    }

    function refresh(iconId) {
        try {
            if (iconId !== null) {
                labelFontAwesome.font.family = (icomoon[iconId] ? icoMoon.name : fontAwesome.name)
                labelFontAwesome.text = (icomoon[iconId] ? icomoon[iconId] : fontawesome[iconId])
            }
        } catch(err) {

        }
    }
}
