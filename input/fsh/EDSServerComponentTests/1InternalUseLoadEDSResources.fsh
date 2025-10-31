Instance: InternalUseLoadEDSResources
InstanceOf: TestScript
Title: "INTERNAL - Load resources"
Description: "Loads the necessary resources for the EDS Server Component Tests. Not meant for use in test suites."
* insert Metadata(ServerComponent-1InternalUseLoadEDSResources)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusCreateFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusCreateFixture.json"

* variable[+]
  * name = "EdsPatientDeliveryStatusCreateFixtureRecorded"
  * path = "recorded"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* fixture[+]
  * id = "EdsPatientDeliveryStatusFailureFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusFailureFixture.json"

* variable[+]
  * name = "EdsPatientDeliveryStatusFailureFixtureRecorded"
  * path = "recorded"
  * sourceId = "EdsPatientDeliveryStatusFailureFixture"

* fixture[+]
  * id = "EerEuaDeviceFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EerEUADeviceFixture.json"

* variable[+]
  * name = "EerEuaDeviceFixtureIdentifier"
  * path = "identifier.value"
  * sourceId = "EerEuaDeviceFixture"

* test[+]
  * id = "CreateNecessaryEDSResources"
  * name = "Create necessary EDS resources"
  * description = "Creates the necessary resources for the EDS Server Component Tests"

  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
    * description = "Delete EdsPatientDeliveryStatusCreateFixture from previous test runs if it exists"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * params = "?recorded=${EdsPatientDeliveryStatusCreateFixtureRecorded}"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is either 200(OK), 204(No Content) or 404(Not Found)."
    * operator = #in
    * responseCode = "200,204,404"
    * warningOnly = false
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EdsPatientDeliveryStatusCreateFixture"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EdsPatientDeliveryStatusCreateFixture"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is 201(Created)."
    * direction = #response
    * response = #created
    * warningOnly = false

  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
    * description = "Delete EdsPatientDeliveryStatusFailureFixture from previous test runs if it exists"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * params = "?recorded=${EdsPatientDeliveryStatusFailureFixtureRecorded}"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is either 200(OK), 204(No Content) or 404(Not Found)."
    * operator = #in
    * responseCode = "200,204,404"
    * warningOnly = false
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EdsPatientDeliveryStatusFailureFixture"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EdsPatientDeliveryStatusFailureFixture"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is 201(Created)."
    * direction = #response
    * response = #created
    * warningOnly = false

  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
    * description = "Delete EerEuaDeviceFixture from previous test runs if it exists"
    * resource = #Device
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * params = "?identifier=${EerEuaDeviceFixtureIdentifier}"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is either 200(OK), 204(No Content) or 404(Not Found)."
    * operator = #in
    * responseCode = "200,204,404"
    * warningOnly = false
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
    * description = "Create EerEuaDeviceFixture"
    * resource = #Device
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #json
    * destination = 1
    * accept = #json
    * sourceId = "EerEuaDeviceFixture"
  * action[+].assert
    * description = "Confirm that the returned HTTP status is 201(Created)."
    * direction = #response
    * response = #created
    * warningOnly = false