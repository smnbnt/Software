#include "uvoicecontrolresponse.h"

UVoiceControlResponse::UVoiceControlResponse(QObject *parent)
    : QObject(parent)
{
}

UVoiceControlResponse::UVoiceControlResponse(const QJsonObject& jsonResponse, UNinjaAPI* ninjaAPI, UVoiceControlAPI* voiceControlAPI, QObject *parent)
    : QObject(parent)
{
    m_msgId = jsonResponse["msg_id"].toString();
    m_text = jsonResponse["_text"].toString();

    m_ninjaAPI = ninjaAPI;
    m_voiceControlAPI = voiceControlAPI;

    QJsonArray outcomesArray = jsonResponse["outcomes"].toArray();
    QJsonObject firstOutcome = outcomesArray.first().toObject();

    m_intent = firstOutcome["intent"].toString();
    m_entities = firstOutcome["entities"].toObject();
    m_confidence = firstOutcome["confidence"].toDouble();
}

bool UVoiceControlResponse::getOnOff(const QString& onOffKey)
{
    QString valueString = getFirstJsonValue(onOffKey).toString();

    bool isOn = false;
    if (valueString == QString("on"))
        isOn = true;
    else if (valueString == QString("off"))
        isOn = false;

    return isOn;
}

int UVoiceControlResponse::getInt(const QString& intKey)
{
    int intValue = getFirstJsonValue(intKey).toInt();
    return intValue;
}

QString UVoiceControlResponse::getStringValue(const QString& stringKey)
{
    QString stringValue = getFirstJsonValue(stringKey).toString();
    return stringValue;
}

QJsonValue UVoiceControlResponse::getFirstJsonValue(const QString& key)
{
    QJsonObject entities = getEntities();
    QJsonValue jsonValue = entities[key];
    QJsonArray jsonArray = jsonValue.toArray();
    QJsonObject firstObject = jsonArray.first().toObject();
    QJsonValue firstJsonValue = firstObject["value"];
    return firstJsonValue;
}

QString UVoiceControlResponse::getCommand()
{
    if (getIntent() == QString("turn_onoff_all_lights"))
    {
        bool onOffValue = getOnOff("uctrl_onoff");
        return QString("Turn {0} all lights").replace("{0}", (onOffValue ? "on" : "off"));
    }
    else if (getIntent() == QString("turn_onoff_lights_in_location"))
    {
        bool onOffValue = getOnOff("on_off");
        QString locationName = getStringValue("location");
        return QString("Turn {0} all lights in {1}").replace("{0}", (onOffValue ? "on" : "off")).replace("{1}", locationName);
    }
    else if (getIntent() == QString("set_dimmer_lights"))
    {
        int lightIntensityPercent = getInt("number");
        QString lightIntensityPercentStr = QString::number(lightIntensityPercent);
        return QString("Set lights to {0}%").replace("{0}", lightIntensityPercentStr);
    }
    else if (getIntent() == QString("set_ninja_eyes_color"))
    {
        QString colorString = getStringValue("uctrl_color");
        return QString("Set ninja eyes to {0}").replace("{0}", colorString);
    }
    else if (getIntent() == QString("turn_onoff_plugs_in_location"))
    {
        bool isOn = getOnOff("uctrl_onoff");
        QString locationName = getStringValue("location");
        return QString("Turn {0} all plugs in {1}").replace("{0}", (isOn ? "on" : "off")).replace("{1}", locationName);
    }
    else if (getIntent() == QString("turn_onoff_plug_with_id"))
    {
        bool isOn = getOnOff("uctrl_onoff");
        int plugId = getInt("number");
        return QString("Turn {0} plug with id#{1}").replace("{0}", (isOn ? "on" : "off")).replace("{1}", QString::number(plugId));
    }

    return "Unknown command";
}

bool UVoiceControlResponse::hasValidIntent()
{
    if (getIntent() == QString("turn_onoff_all_lights"))
    {
        return getFirstJsonValue("uctrl_onoff").toString() != QString("");
    }
    else if (getIntent() == QString("turn_onoff_lights_in_location"))
    {
        return getFirstJsonValue("on_off").toString() != QString("") && getFirstJsonValue("location").toString() != QString("");
    }
    else if (getIntent() == QString("set_dimmer_lights"))
    {
        return getFirstJsonValue("number").toInt() >= 0 && getFirstJsonValue("number").toInt() <= 100;
    }
    else if (getIntent() == QString("set_ninja_eyes_color"))
    {
        return getStringValue("uctrl_color") != QString("");
    }
    else if (getIntent() == QString("turn_onoff_plugs_in_location"))
    {
        return getFirstJsonValue("uctrl_onoff").toString() != QString("");
    }
    else if (getIntent() == QString("turn_onoff_plug_with_id"))
    {
        return getFirstJsonValue("uctrl_onoff").toString() != QString("") && getFirstJsonValue("number").toInt() != 0;
    }

    return false;
}

void UVoiceControlResponse::sendIntent()
{
    if (getIntent() == QString("turn_onoff_all_lights"))
    {
        bool isOn = getOnOff("uctrl_onoff");

        UTurnOnOffLightIntent turnOnOffLightIntent(m_voiceControlAPI->getUCtrlApiFacade(), isOn);
        turnOnOffLightIntent.turnOnOffAllLights();
    }
    // TODO : Update the whole file for this thing, verify if it's the right command
    else if (getIntent() == QString("turn_onoff_lights_in_location"))
    {
        bool isOn = getOnOff("on_off");
        QString locationName = getStringValue("location");

        UTurnOnOffLightIntent turnOnOffLightIntent(m_voiceControlAPI->getUCtrlApiFacade(), isOn);
        turnOnOffLightIntent.turnOnOffLightsInLocation(locationName);
    }
    else if (getIntent() == QString("set_dimmer_lights"))
    {
        int lightIntensityPercent = getInt("number");

        USetDimmerLights setDimmerLights(m_voiceControlAPI->getUCtrlApiFacade(), lightIntensityPercent);
        setDimmerLights.setAllLightsIntensity();
    }
    else if (getIntent() == QString("set_ninja_eyes_color"))
    {
        QString colorString = getStringValue("uctrl_color");

        USetNinjaEyesColorIntent setNinjaEyesColorIntent(m_voiceControlAPI->getUCtrlApiFacade());
        setNinjaEyesColorIntent.setNinjaEyesColors(colorString);
    }
    // TODO : Hardcode stuff in wit.ai ? device names and stuff OR find a way to add stuff in the wit.ai dictionary dynamically (could be hard)
    else if (getIntent() == QString("turn_onoff_plugs_in_location"))
    {
        bool isOn = getOnOff("uctrl_onoff");
        QString locationName = getStringValue("location");

        UTurnOnOffPlugIntent intent(m_ninjaAPI, "1014BBBK6089_0_0_11", isOn);
        intent.turnOnOffPlugInLocation(locationName);
    }
    else if (getIntent() == QString("turn_onoff_plug_with_id"))
    {
        bool isOn = getOnOff("uctrl_onoff");
        int plugId = getInt("number");

        UTurnOnOffPlugIntent intent(m_ninjaAPI, "1014BBBK6089_0_0_11", isOn);
        intent.turnOnOffPlugWithId(plugId);
    }
}
