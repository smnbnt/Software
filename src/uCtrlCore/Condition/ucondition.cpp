#include "ucondition.h"

UCondition::UCondition(QObject* parent) : ListItem(parent)
{
}

UCondition::~UCondition()
{
}

QVariant UCondition::data(int role) const
{
    switch (role)
    {
    case idRole:
        return id();
    case typeRole:
        return type();
    case comparisonTypeRole:
        return comparisonType();
    case beginValueRole:
        return beginValue();
    case endValueRole:
        return endValue();
    case deviceIdRole:
        return deviceId();
    case deviceValueRole:
        return deviceValue();
    case enabledRole:
        return enabled();
    case lastUpdatedRole:
        return lastUpdated();
    default:
        return QVariant();
    }
}

bool UCondition::setData(const QVariant& value, int role)
{
    switch (role)
    {
    case idRole:
        id(value.toString());
        break;
    case typeRole:
        type(value.toInt());
        break;
    case comparisonTypeRole:
        comparisonType(value.toInt());
        break;
    case beginValueRole:
        beginValue(value.toString());
        break;
    case endValueRole:
        endValue(value.toString());
        break;
    case deviceIdRole:
        deviceId(value.toString());
        break;
    case deviceValueRole:
        deviceValue(value.toString());
        break;
    case enabledRole:
        enabled(value.toBool());
        break;
    case lastUpdatedRole:
        lastUpdated(value.toUInt());
        break;
    default:
        return false;
    }
    return true;
}

QHash<int, QByteArray> UCondition::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[idRole] = "id";
    roles[typeRole] = "type";
    roles[comparisonTypeRole] = "comparisonType";
    roles[beginValueRole] = "beginValue";
    roles[endValueRole] = "endValue";
    roles[deviceIdRole] = "deviceId";
    roles[deviceValueRole] = "deviceValue";
    roles[enabledRole] = "isEnabled";
    roles[lastUpdatedRole] = "lastUpdated";

    return roles;
}

void UCondition::write(QJsonObject &jsonObj) const
{
    jsonObj["id"] = this->id();
    jsonObj["type"] = this->type();
    jsonObj["comparisonType"] = this->comparisonType();
    jsonObj["beginValue"] = this->beginValue();
    jsonObj["endValue"] = this->endValue();
    jsonObj["deviceId"] = this->deviceId();
    jsonObj["deviceValue"] = this->deviceValue();
    jsonObj["enabled"] = this->enabled();
    jsonObj["lastUpdated"] = QString::number(this->lastUpdated());
}

void UCondition::read(const QJsonObject &jsonObj)
{
    this->id(jsonObj["id"].toString());
    this->type(jsonObj["type"].toInt());
    this->comparisonType(jsonObj["comparisonType"].toInt());
    this->beginValue(jsonObj["beginValue"].toString());
    this->endValue(jsonObj["endValue"].toString());
    this->deviceId(jsonObj["deviceId"].toString());
    this->deviceValue(jsonObj["deviceValue"].toString());
    this->enabled(jsonObj["enabled"].toBool());
    this->lastUpdated(jsonObj["lastUpdated"].toString().toUInt());
}
