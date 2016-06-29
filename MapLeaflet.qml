import QtQuick 2.0

import QtWebEngine 1.1
import QtWebChannel 1.0

Item {
    id: root
    WebChannel.id: "qmlLeaflet"

    property double latitude : 42.34851
    property double longitude : -83.05680

    //external signals
    signal didUpdateCenterMap(double lat, double lng)

    //javascript signals
    signal setCenterMap(double lat,double lng)

    //public functions
    function updateCenterMap (lat,lng) {
        setCenterMap(lat,lng)
    }

    WebChannel {
        id: webChannel
        registeredObjects: [root]
    }

    WebEngineView {
        id: webview
        url: "qrc:/map.html"
        anchors.fill: parent
        webChannel: webChannel
    }

    Component.onCompleted: {

    }
}
