// [WriteFile Name=PortalUserInfo, Category=CloudAndPortal]
// [Legal]
// Copyright 2016 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// [Legal]

import QtQuick 2.6
import QtQuick.Controls 1.4
import Esri.Samples 1.0
import Esri.ArcGISExtras 1.1
import Esri.ArcGISRuntime.Toolkit.Dialogs 100.1

PortalUserInfoSample {
    id: rootRectangle
    clip: true

    width: 800
    height: 600

    property double scaleFactor: System.displayScaleFactor

    BusyIndicator {
        id: loadingIndicator
        anchors.centerIn: parent
        running: !loaded
    }

    property var detailNames: ["Full name", "Username", "Email", "Bio", "Who can see your profile?"]
    property var detailValue: ["fullName", "username", "email", "bio", "access"]

    Column {
        id: userDetailsColumn
        visible: loaded
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 10 * scaleFactor
        }
        spacing: 10 * scaleFactor

        Text {
            text: fullName.length > 0 ? fullName + " Profile" : ("????")
            font.bold: true
            font.pointSize: 15
        }

        Image {
            source : thumbnailUrl.toString().length > 0 ? thumbnailUrl : "qrc:/Samples/CloudAndPortal/PortalUserInfo/placeholder_img.png"
            height: 32 * scaleFactor
            width: 32 * scaleFactor
        }
    }

    ListView {
        visible: loaded
        anchors {
            top: userDetailsColumn.bottom
            bottom: midLine.top
            left: parent.left
            right: parent.right
            margins: 10 * scaleFactor
        }
        spacing: 10 * scaleFactor
        clip: true
        model: detailNames.length

        delegate: Column {
            Text {
                text: detailNames[index]
                font.bold: true
            }

            Text {
                text: rootRectangle[detailValue[index]]
                color: "grey"
            }
        }
    }

    Rectangle {
        id: midLine
        anchors {
            verticalCenter: parent.verticalCenter
            margins: 8 * scaleFactor
            left: parent.left
            right: parent.right
        }
        height: 4 * scaleFactor
        visible: loaded
        color: "lightgrey"
    }

    Column {
        id: portalDetailsColumn
        visible: loaded
        anchors {
            top: midLine.bottom
            left: parent.left
            right: parent.right
            margins: 10 * scaleFactor
        }
        spacing: 10 * scaleFactor

        Text {
            text: orgTitle
            font.bold: true
            font.pointSize: 15
        }

        Image {
            source : orgThumbnailUrl
            height: 32 * scaleFactor
            width: 32 * scaleFactor
        }
    }

    property var infoLabels: ["Description", "Can Find External Content", "Can Share Items Externally"]
    property var infoValues: ["orgDescription", "canSearchPublic", "canSharePublic"]

    ListView {
        id: infoList
        visible: loaded
        anchors {
            top: portalDetailsColumn.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: 10 * scaleFactor
        }
        spacing: 10 * scaleFactor
        clip: true
        model: infoValues.length

        delegate: Column {
            Text {
                text: loaded ? infoLabels[index] : ""
                font.bold: true
            }

            Text {
                text: rootRectangle[infoValues[index]]
                color: "grey"
            }
        }
    }

    AuthenticationView {
        id: authView
        authenticationManager: authManager
    }

    // Neatline rectangle
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border {
            width: 0.5 * scaleFactor
            color: "black"
        }
    }
}
