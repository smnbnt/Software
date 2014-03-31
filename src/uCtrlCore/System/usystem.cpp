#include "usystem.h"

USystem::USystem(QObject *parent) : QAbstractListModel(parent)
{
}

USystem::~USystem()
{
}

QVariant USystem::data(const QModelIndex &index, int role) const
{
    return QVariant();
}

int USystem::rowCount(const QModelIndex &parent) const
{
    return 0;
}

void USystem::read(const QJsonObject &jsonObj)
{
    QJsonArray platformsArray = jsonObj["platforms"].toArray();
    foreach(QJsonValue platformJson, platformsArray)
    {
        UPlatform* p = new UPlatform(this);
        p->read(platformJson.toObject());
        this->m_platforms.append(p);
    }
}

void USystem::write(QJsonObject &jsonObj) const
{
    QJsonArray platformsArray;
    foreach(UPlatform* p, this->m_platforms)
    {
        QJsonObject platformJson;
        p->write(platformJson);
        platformsArray.append(platformJson);
    }

    jsonObj["platforms"] = platformsArray;
}