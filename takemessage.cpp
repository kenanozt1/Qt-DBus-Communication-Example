#include "takemessage.h"
#include <QDebug>
#include <QDBusConnection>
#include <QDBusError>
#include <QDBusInterface>
#include <QDBusReply>
TakeMessage::TakeMessage(QObject *parent) : QObject(parent)
{
    if(QDBusConnection::sessionBus().isConnected()){
        if(QDBusConnection::sessionBus().connect(
                "org.example.dbus",
                "/message",
                "org.example.dbus",
                "sendMessageSignals",
                this,
                SLOT(takeMessage(QString))
                ))
            qDebug() << "++Bağlantı Başarılı++";
        else
            qDebug() << "--Bağlantı Başarısız: " + QDBusConnection::sessionBus().lastError().message();
    } else {
        qDebug() << "ERROR: " + QDBusConnection::sessionBus().lastError().message();
    }
}

void TakeMessage::takeMessage(QString msg)
{
    //qDebug() << "Gelen Mesaj : "+msg;
    emit messageReceived(msg);
}
