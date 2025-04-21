#ifndef TAKEMESSAGE_H
#define TAKEMESSAGE_H

#include <QObject>

class TakeMessage : public QObject
{
    Q_OBJECT
public:
    explicit TakeMessage(QObject *parent = nullptr);

signals:
    void messageReceived(const QString &msg);

public slots:
    void takeMessage(QString msg);
};

#endif // TAKEMESSAGE_H
