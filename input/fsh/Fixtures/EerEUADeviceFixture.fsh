Instance: EerEUADeviceFixture
// TODO: If my EER PR's goes through. Change this to just EERDevice
InstanceOf: EerDeviceEUA
Description: "An instance of a C1 EUA Sender Device Fixture"
* insert OverrideGeneratedFileNameHelper(EerEUADeviceFixture)
* identifier[+].value = "touchstone-eua-device-for-testing"
* status = #active
* manufacturer = "Test Manufacturer"
* deviceName.name = "Test Device Name"
* deviceName.type = #manufacturer-name
* type = $EhmiDeliveryStatusSourceType#EUA