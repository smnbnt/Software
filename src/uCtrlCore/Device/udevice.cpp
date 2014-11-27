#include "udevice.h"

UDevice::UDevice(QObject* parent) : NestedListItem(parent)
{
    m_scenarios = new UScenariosModel(this);
    m_statistics = new UStatisticsModel(this);
    m_history = new UHistoryLogModel(this);
}

UDevice::~UDevice()
{
}

QVariant UDevice::data(int role) const
{
    switch (role)
    {
    case idRole:
        return id();
    case nameRole:
        return name();
    case typeRole:
        return (int)type();
    case descriptionRole:
        return description();
    case maxValueRole:
        return maxValue();
    case minValueRole:
        return minValue();
    case valueRole:
        return value();
    case minStatRole:
        return minStat();
    case maxStatRole:
        return maxStat();
    case meanStatRole:
        return meanStat();
    case countStatRole:
        return countStat();
    case precisionRole:
        return precision();
    case statusRole:
        return (int)status();
    case unitLabelRole:
        return unitLabel();
    case enabledRole:
        return enabled();
    case lastUpdatedRole:
        return lastUpdated();
    default:
        return QVariant();
    }
}

bool UDevice::setData(const QVariant& value, int role)
{
    switch (role)
    {
    case idRole:
        id(value.toString());
        break;
    case nameRole:
        name(value.toString());
        break;
    case typeRole:
        type((UEType)value.toInt());
        break;
    case descriptionRole:
        description(value.toString());
        break;
    case maxValueRole:
        maxValue(value.toString());
        break;
    case minValueRole:
        minValue(value.toString());
        break;
    case valueRole:
        this->value(value.toString());
        break;
    case minStatRole:
        minStat(value.toString());
        break;
    case maxStatRole:
        maxStat(value.toString());
        break;
    case meanStatRole:
        meanStat(value.toString());
        break;
    case countStatRole:
        countStat(value.toString());
        break;
    case precisionRole:
        precision(value.toInt());
        break;
    case statusRole:
        status((UEStatus)value.toInt());
        break;
    case unitLabelRole:
        unitLabel(value.toString());
        break;
    case enabledRole:
        enabled(value.toBool());
        break;
    case lastUpdatedRole:
        lastUpdated(value.toDouble());
        break;
    default:
        return false;
    }
    return true;
}

QHash<int, QByteArray> UDevice::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[idRole] = "id";
    roles[nameRole] = "name";
    roles[typeRole] = "type";
    roles[descriptionRole] = "description";
    roles[maxValueRole] = "maxValue";
    roles[minValueRole] = "minValue";
    roles[valueRole] = "value";
    roles[minStatRole] = "minStat";
    roles[maxStatRole] = "maxStat";
    roles[meanStatRole] = "meanStat";
    roles[countStatRole] = "countStat";
    roles[precisionRole] = "precision";
    roles[statusRole] = "status";
    roles[unitLabelRole] = "unitLabel";
    roles[enabledRole] = "isEnabled";
    roles[lastUpdatedRole] = "lastUpdated";

    return roles;
}

ListModel* UDevice::nestedModel() const
{
    return m_scenarios;
}

ListModel* UDevice::history() const
{
    return m_history;
}

ListModel *UDevice::statistics() const
{
    return m_statistics;
}

void UDevice::write(QJsonObject& jsonObj) const
{
    jsonObj["id"] = this->id();
    jsonObj["name"] = this->name();
    jsonObj["type"] = (int)this->type();
    jsonObj["description"] = this->description();
    jsonObj["maxValue"] = this->maxValue();
    jsonObj["minValue"] = this->minValue();
    jsonObj["value"] = this->value();
    jsonObj["precision"] = this->precision();
    jsonObj["status"] = (int)this->status();
    jsonObj["unitLabel"] = this->unitLabel();
    jsonObj["enabled"] = this->enabled();
    jsonObj["lastUpdated"] = this->lastUpdated();

    QJsonObject scenarios;
    m_scenarios->write(scenarios);
    jsonObj["scenarios"] = scenarios;
}

void UDevice::read(const QJsonObject &jsonObj)
{
    this->id(jsonObj["id"].toString());
    this->name(jsonObj["name"].toString());
    this->type((UEType)jsonObj["type"].toInt());
    this->description(jsonObj["description"].toString());
    this->maxValue(jsonObj["maxValue"].toString());
    this->minValue(jsonObj["minValue"].toString());
    this->value(jsonObj["value"].toString());
    this->precision(jsonObj["precision"].toInt());
    this->status((UEStatus)jsonObj["status"].toInt());
    this->unitLabel(jsonObj["unitLabel"].toString());
    this->enabled(jsonObj["enabled"].toBool());
    this->lastUpdated(jsonObj["lastUpdated"].toDouble());

    readScenarios(jsonObj);
}

void UDevice::readScenarios(const QJsonObject &jsonObj)
{
    m_scenarios->read(jsonObj);
}

QString UDevice::name() const
{
    return m_name;
}

void UDevice::name(const QString &name)
{
    if (m_name != name) {
        m_name = name;
        emit dataChanged();
    }
}

UDevice::UEType UDevice::type() const
{
    return m_type;
}

void UDevice::type(UEType type)
{
    if (m_type != type) {
        m_type = type;
        emit dataChanged();
    }
}

QString UDevice::description() const
{
    return m_description;
}

void UDevice::description(const QString &description)
{
    if (m_description != description) {
        m_description = description;
        emit dataChanged();
    }
}

QString UDevice::maxValue() const
{
    return m_maxValue;
}

void UDevice::maxValue(const QString &maxValue)
{
    if (m_maxValue != maxValue) {
        m_maxValue = maxValue;
        emit dataChanged();
    }
}

QString UDevice::minValue() const
{
    return m_minValue;
}

void UDevice::minValue(const QString &minValue)
{
    if (m_minValue != minValue) {
        m_minValue = minValue;
        emit dataChanged();
    }
}

QString UDevice::value() const
{
    return m_value;
}

void UDevice::value(const QString &value)
{
    if (m_value != value) {
        m_value = value;
        emit dataChanged();
    }
}

QString UDevice::minStat() const
{
    return m_minStat;
}

void UDevice::minStat(const QString& minStat)
{
    if (m_minStat != minStat) {
        m_minStat = minStat;
        emit dataChanged();
    }
}

QString UDevice::maxStat() const
{
    return m_maxStat;
}

void UDevice::maxStat(const QString& maxStat)
{
    if (m_maxStat != maxStat) {
        m_maxStat = maxStat;
        emit dataChanged();
    }
}

QString UDevice::meanStat() const
{
    return m_meanStat;
}

void UDevice::meanStat(const QString& meanStat)
{
    if (m_meanStat != meanStat) {
        m_meanStat = meanStat;
        emit dataChanged();
    }
}

QString UDevice::countStat() const
{
    return m_countStat;
}

void UDevice::countStat(const QString& countStat)
{
    if (m_countStat != countStat) {
        m_countStat = countStat;
        emit dataChanged();
    }
}

int UDevice::precision() const
{
    return m_precision;
}

void UDevice::precision(int precision)
{
    if (m_precision != precision) {
        m_precision = precision;
        emit dataChanged();
    }
}

UDevice::UEStatus UDevice::status() const
{
    return m_status;
}

void UDevice::status(UEStatus status)
{
    if (m_status != status) {
        m_status = status;
        emit dataChanged();
    }
}

QString UDevice::unitLabel() const
{
    return m_unitLabel;
}

void UDevice::unitLabel(const QString &unitLabel)
{
    if (m_unitLabel != unitLabel) {
        m_unitLabel = unitLabel;
        emit dataChanged();
    }
}
