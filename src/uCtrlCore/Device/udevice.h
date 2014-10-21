#ifndef UDEVICE_H
#define UDEVICE_H

#include "Models/nestedlistitem.h"
#include "Models/nestedlistmodel.h"
#include "Scenario/uscenariosmodel.h"

class UDevice : public NestedListItem
{
    Q_OBJECT

    enum DeviceRoles
    {
        idRole = Qt::UserRole + 1,
        nameRole,
        typeRole,
        descriptionRole,
        maxValueRole,
        minValueRole,
        valueRole,
        precisionRole,
        statusRole,
        unitLabelRole,
        enabledRole,
        lastUpdatedRole
    };

public:
    explicit UDevice(QObject *parent = 0);
    ~UDevice();

    // NestedListItem
    QVariant data(int role) const;
    bool setData(const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;
    ListModel* nestedModel() const;

    // JsonSerializable
    void write(QJsonObject &jsonObj) const;
    void read(const QJsonObject &jsonObj);

    // Properties
    inline QString name() const { return m_name; }
    inline void name(const QString& name) { m_name = name; emit dataChanged(); }
    inline int type() const{ return m_type; }
    inline void type(int type) { m_type = type; emit dataChanged(); }
    inline QString description() const { return m_description; }
    inline void description(const QString& description) { m_description = description; emit dataChanged(); }
    inline QString maxValue() const{ return m_maxValue; }
    inline void maxValue(const QString& maxValue) { m_maxValue = maxValue; emit dataChanged(); }
    inline QString minValue() const{ return m_minValue; }
    inline void minValue(const QString& minValue) { m_minValue = minValue; emit dataChanged(); }
    inline QString value() const{ return m_value; }
    inline void value(const QString& value) { m_value = value; emit dataChanged(); }
    inline int precision() const{ return m_precision; }
    inline void precision(int precision) { m_precision = precision; emit dataChanged(); }
    inline int status() const{ return m_status; }
    inline void status(int status) { m_status = status; emit dataChanged(); }
    inline QString unitLabel() const { return m_unitLabel; }
    inline void unitLabel(const QString& unitLabel) { m_unitLabel = unitLabel; emit dataChanged(); }

private:
    QString m_name;
    int m_type;
    QString m_description;
    QString m_maxValue;
    QString m_minValue;
    QString m_value;
    int m_precision;
    int m_status;
    QString m_unitLabel;
    NestedListModel* m_scenarios;
};

#endif // UDEVICE_H
