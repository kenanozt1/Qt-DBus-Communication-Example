import QtQuick 2.10
import QtQuick.Window 2.10
import com.example.dbus 1.0
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    SendMessage{
        id:sendMessage
    }
    TakeMessage{
        id:takeMessage
    }
    Rectangle{
        anchors.centerIn: parent
        width: parent.width/3
        height: parent.height/3
        color:"yellow"
        radius: 15
        Text {
            id: name
            text: qsTr("Tıkla")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                sendMessage.sendMessage("Bu Send message Sınıfından gönderilen Yazıdır");
            }
        }
    }
    Connections {
        target: takeMessage
        function onMessageReceived(msg) {
            console.log("Sinyal alındı: " + msg);
        }
    }
}
//qdbus --literal org.example.dbus /message org.freedesktop.DBus.Introspectable.Introspect  //xml formatında görüntülemek için
//dbus-monitor --session "type='signal',interface='org.example.dbus'"   //mesajı dinleme için

