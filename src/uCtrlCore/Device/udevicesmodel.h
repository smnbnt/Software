#ifndef UDEVICESMODEL_H
#define UDEVICESMODEL_H

#include "Models/nestedlistmodel.h"
#include "udevice.h"

class UDevicesModel : public NestedListModel
{
public:
    UDevicesModel(QObject* parent = 0);

    // JsonSerializable
    void write(QJsonObject &jsonObj) const;
    void read(const QJsonObject &jsonObj);

    Q_INVOKABLE QObject* getHistoryWithId(const QString& id);
};

#endif // UDEVICESMODEL_H
