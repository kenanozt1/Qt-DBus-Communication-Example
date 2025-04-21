#ifndef SENDMESSAGE_H
#define SENDMESSAGE_H

#include <QObject>
#include <QDebug>
#define SERVER_INTERFACE "org.example.dbus"
class SendMessage : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface","org.example.dbus")
public:
    explicit SendMessage(QObject *parent = nullptr);

    Q_SCRIPTABLE void sendMessage(QString msg);
signals:
    Q_SCRIPTABLE void sendMessageSignals(const QString msg);
public slots:
    Q_SCRIPTABLE QString getMessage(){
        emit sendMessageSignals("test");
        return "Hello D-Bus! (sendMessage.h->getMessage())";
    }
};

#endif // SENDMESSAGE_H
