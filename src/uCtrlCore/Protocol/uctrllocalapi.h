#ifndef UCTRLLOCALAPI_H
#define UCTRLLOCALAPI_H

#include <QObject>
#include <QtNetwork>
#include "../Platform/uplatformsmodel.h"
#include <QMap>

class UCtrlLocalApi : public QObject
{
    Q_OBJECT

    enum class UEMessageType: int {
        GetPlatformRequest = 1,
        GetPlatformResponse = 2,
        GetDevicesRequest = 3,
        GetDevicesResponse = 4,
        GetScenariosRequest = 5,
        GetScenariosResponse = 6,
        GetTasksRequest = 7,
        GetTasksResponse = 8,
        GetConditionsRequest = 9,
        GetConditionsResponse = 10,
        SavePlatformRequest = 11,
        SaveDevicesRequest = 13,
        SaveScenariosRequest = 15,
        SaveTasksRequest = 17,
        SaveConditionsRequest = 19
    };
public:
    UCtrlLocalApi(UPlatformsModel* platforms, QObject* parent = 0);

    void getDevices(UPlatform* platform);
    void getScenarios(UDevice* device);
    void getTasks(UScenario* scenario);
    void getConditions(UTask* task);
    void savePlatform(UPlatform* platform);
    void saveDevices(UPlatform* platform);
    void saveDevices(UPlatform* platform, const QJsonArray& devicesArray);
    void saveScenarios(UDevice* device);
    void saveTasks(UScenario* scenario);
    void saveConditions(UTask* task);

private:
    QUdpSocket* m_socket;
    QHostAddress m_multicastAddress;
    int m_multicastPort;
    UPlatformsModel* m_platforms;
    QMap<int, void*> m_messageProperties;

    int m_idGenerator;
    int nextId() { return ++m_idGenerator; }

    void sendGetRequest(const QString& address, int port, UEMessageType messageType, const QString& additionalKey, const QString& additionalValue, void* property);
    void sendSaveRequest(const QString& address, int port, UEMessageType messageType, const QString& saveKey, const QJsonArray& jsonArray);

private slots:
    void processPendingDatagrams();
};

#endif // UCTRLLOCALAPI_H
