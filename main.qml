import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import com.example.dbus 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("D-Bus Example")
    color: "#f5f5f5"

    minimumWidth: 480
    minimumHeight: 400

    SendMessage {
        id: sendMessage
    }

    TakeMessage {
        id: takeMessage
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        Label {
            Layout.fillWidth: true
            text: qsTr("D-Bus Example")
            font.pixelSize: 24
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            color: "#2c3e50"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height * 0.6
            radius: 8
            color: "#ffffff"
            border.color: "#e0e0e0"
            border.width: 1

            ScrollView {
                id: scrollView
                anchors.fill: parent
                anchors.margins: 10
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"

                    Text {
                        id: showDBusMessage
                        anchors.fill: parent
                        text: qsTr("Henüz mesaj alınmadı")
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                        color: "#555555"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                radius: 8
                color: "#ffffff"
                border.color: messageInput.activeFocus ? "#3498db" : "#e0e0e0"
                border.width: 1

                TextInput {
                    id: messageInput
                    anchors.fill: parent
                    anchors.margins: 10
                    font.pixelSize: 16
                    clip: true
                    verticalAlignment: TextInput.AlignVCenter
                    color: "#333333"

                    property string placeholderText: "Mesajınızı buraya yazın..."

                    Text {
                        anchors.fill: parent
                        text: messageInput.placeholderText
                        color: "#aaaaaa"
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        visible: messageInput.text.length === 0 && !messageInput.activeFocus
                    }

                    Keys.onReturnPressed: {
                        if (messageInput.text.trim().length > 0) {
                            sendButton.clicked()
                        }
                    }
                }
            }

            Button {
                id: sendButton
                Layout.preferredWidth: 120
                Layout.preferredHeight: 50

                background: Rectangle {
                    radius: 8
                    color: sendButton.pressed ? "#2980b9" : sendButton.hovered ? "#3498db" : "#2c3e50"
                }

                contentItem: Text {
                    text: qsTr("Gönder")
                    font.pixelSize: 16
                    font.bold: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    if (messageInput.text.trim().length > 0) {
                        sendMessage.sendMessage(messageInput.text)
                        messageInput.text = ""
                        messageInput.focus = true
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            radius: 8
            color: "#ecf0f1"

            Text {
                id: statusText
                anchors.fill: parent
                anchors.margins: 10
                text: qsTr("Sistem hazır")
                font.pixelSize: 14
                color: "#7f8c8d"
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Connections {
        target: takeMessage
        function onMessageReceived(msg) {
            showDBusMessage.text = msg
            console.log("Mesaj alındı: " + msg)
            statusText.text = qsTr("Son mesaj alındı: ") + new Date().toLocaleTimeString(Qt.locale("tr_TR"))
        }
    }
}
