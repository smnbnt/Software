import QtQuick 2.0

Text {
    id: dflt
    font.family: "Calibri"
    font.pointSize: 12
    wrapMode: Text.WordWrap
    color: _colors.uBlack

    onTextChanged: {
        var newValue = dflt.text.replace(/(\n|\r)/, "").replace(/\s+/g, " ")
        dflt.text = newValue
    }
}