#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "sendmessage.h"
#include "takemessage.h"
#include <QDBusConnection>
#include <QDBusError>
#include <QDebug>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SendMessage *sendmessage = new SendMessage();
    if(QDBusConnection::sessionBus().registerObject("/message",sendmessage,QDBusConnection::ExportAllSlots | QDBusConnection::ExportAllSignals | QDBusConnection::ExportAllInvokables | QDBusConnection::ExportNonScriptableSlots | QDBusConnection::ExportScriptableSignals)){
        qDebug() << "++Dbus Objesi Başarıyla Kaydedildi++";
    }else{
        qDebug() << "--Dbus Objesi Kaydedilemedi: "+QDBusConnection::sessionBus().lastError().message();
        return 1;
    }
    if(QDBusConnection::sessionBus().registerService("org.example.dbus")){
        qDebug() << "++Dbus Servis Kaydı Başarılı++";
    }else{
        qDebug() << "--Dbus Servis Kaydı Başarısız : "+QDBusConnection::sessionBus().lastError().message();
        return 1;
    }


    qmlRegisterType<SendMessage>("com.example.dbus",1,0,"SendMessage");
    qmlRegisterType<TakeMessage>("com.example.dbus",1,0,"TakeMessage");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
