import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "../Constants"

// Gradient
LinearGradient {
    anchors.fill: parent
    source: parent
    start: Qt.point(0, 0)
    end: Qt.point(parent.width, 0)
    gradient: Gradient {
        GradientStop { position: 0.0362; color: Style.colorGradient1 }
        GradientStop { position: 0.9984; color: Style.colorGradient2 }
    }
}