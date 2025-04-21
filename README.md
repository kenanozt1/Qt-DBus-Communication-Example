# QtDBusCommunication

Bu proje, Qt ve D-Bus teknolojilerini kullanarak basit bir mesajlaşma uygulaması gerçekleştirmektedir. QML arayüzü ve D-Bus iletişim altyapısı ile oluşturulmuş, öğrenme amaçlı bir çalışmadır.

## Proje Hakkında

QtDBusCommunication, Qt Framework ve D-Bus IPC (Inter-Process Communication) sistemini kullanarak nasıl mesaj alışverişi yapılabileceğini gösteren örnek bir uygulamadır. Proje, bir QML arayüzünden D-Bus servisine mesaj göndermeyi ve bu servisten sinyalleri yakalamayı amaçlamaktadır.

## Özellikler

- QML tabanlı kullanıcı arayüzü
- D-Bus üzerinden mesaj gönderme
- D-Bus üzerinden sinyal yakalama
- Session Bus kullanımı

## Kullanım

Uygulamayı çalıştırdıktan sonra, ekranda görünen sarı kutuya tıklayarak D-Bus üzerinden bir mesaj gönderebilirsiniz. Bu mesaj D-Bus üzerinden yayınlanacak ve dinleyen bileşenler tarafından yakalanacaktır.

### Yararlı D-Bus Komutları

Proje ile çalışırken aşağıdaki komutlar faydalı olacaktır:

```bash
# D-Bus servisinin XML yapısını görüntülemek için
qdbus --literal org.example.dbus /message org.freedesktop.DBus.Introspectable.Introspect

# D-Bus üzerinden yayınlanan mesajları dinlemek için
dbus-monitor --session "type='signal',interface='org.example.dbus'"

# Servis üzerindeki metotları ve sinyalleri listelemek için
qdbus --literal org.example.dbus /message
```

## Geliştirme Notları

Bu proje, Qt ve D-Bus entegrasyonunu öğrenmek amacıyla geliştirilmiştir. Gerçek bir uygulama için daha kapsamlı hata yönetimi ve güvenlik önlemleri eklenmelidir.

---

# QtDBusCommunication (English)

This project implements a simple messaging application using Qt and D-Bus technologies. It's created with QML interface and D-Bus communication infrastructure for learning purposes.

## About the Project

QtDBusCommunication is a sample application that demonstrates how to exchange messages using the Qt Framework and D-Bus IPC (Inter-Process Communication) system. The project aims to send messages from a QML interface to a D-Bus service and catch signals from this service.

## Features

- QML-based user interface
- Message sending via D-Bus
- Signal catching via D-Bus
- Session Bus usage

## Usage

After running the application, you can send a message via D-Bus by clicking on the yellow box shown on the screen. This message will be published over D-Bus and caught by listening components.

### Useful D-Bus Commands

The following commands will be useful when working with the project:

```bash
# To view the XML structure of the D-Bus service
qdbus --literal org.example.dbus /message org.freedesktop.DBus.Introspectable.Introspect

# To listen to messages published over D-Bus
dbus-monitor --session "type='signal',interface='org.example.dbus'"

# To list methods and signals on the service
qdbus --literal org.example.dbus /message
```

## Development Notes

This project was developed for the purpose of learning Qt and D-Bus integration. More comprehensive error handling and security measures should be added for a real application.
