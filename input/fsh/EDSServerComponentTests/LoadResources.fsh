Instance: InternalUseLoadEDSResources
InstanceOf: TestScript
Title: "INTERNAL - Load resources"
Description: "Loads the necessary resources for the EDS Server Component Tests. Not meant for use in test suites."
* insert Metadata("InternalUseLoadEDSResources")
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusCreateFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusCreateFixture.json"

* fixture[+]
  * id = "EdsPatientDeliveryStatusFailureFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusFailureFixture.json"

* fixture[+]
  * id = "EerEuaDeviceFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EerEuaDeviceFixture.json"

* setup
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EdsPatientDeliveryStatusCreateFixture"
    * resource = #AuditEvent
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EdsPatientDeliveryStatusCreateFixture"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EdsPatientDeliveryStatusFailureFixture"
    * resource = #AuditEvent
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EdsPatientDeliveryStatusFailureFixture"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EerEuaDeviceFixture"
    * resource = #Device
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EerEuaDeviceFixture"