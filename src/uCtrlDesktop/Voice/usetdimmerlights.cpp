#include "usetdimmerlights.h"

USetDimmerLights::USetDimmerLights(UCtrlAPIFacade* uCtrlApiFacade, int lightIntensityPercent)
{
    m_uCtrlApiFacade = uCtrlApiFacade;
    m_lightIntensityPercent = lightIntensityPercent;
}

void USetDimmerLights::setAllLightsIntensity()
{
    QString data = "";

    // LimitlessLED
    QList<UDevice*> deviceList = m_uCtrlApiFacade->getPlatformsModel()->findDevicesByType(UDevice::UEType::LimitlessLEDWhite);
    foreach (UDevice* device, deviceList)
    {
        QString currentValue = device->value().replace("\\", "");

        float floatValue = m_lightIntensityPercent / 100.0f;

        data = QString::number(floatValue);

        device->value(data);
        m_uCtrlApiFacade->putDevice(device);
    }

}
