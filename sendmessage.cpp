#include "sendmessage.h"
#include <QDBusConnection>
#include <QDBusError>
#include <QDebug>
#include <QDBusMessage>
SendMessage::SendMessage(QObject *parent) : QObject(parent)
{
}

void SendMessage::sendMessage(QString msg) {
    QDBusMessage signal = QDBusMessage::createSignal(
        "/message",
        "org.example.dbus",
        "sendMessageSignals");
    signal << msg;
    QDBusConnection::sessionBus().send(signal);
    emit sendMessageSignals(msg);
}
