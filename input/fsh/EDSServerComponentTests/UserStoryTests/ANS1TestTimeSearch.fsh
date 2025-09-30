Instance: ANS1TestTimeframeSearch
InstanceOf: TestScript
Title: "Test for ANS.1 - Timeframe Searching"
Description: "Test script for the ANS.1 user story. Searching in a given timeframe"
* insert Metadata(ANS1TestTimeframeSearch)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer
// TODO: We are not allowed to delete any ressources. So we should not delete them everytime
// This has an influence on the kind of test we can run. Fix them

// TODO: We need to make tests for the clients integrating with EDS. I.e. for each type of EDS AuditEvent that should be created. This is the most fun to do as a start. So let's make that now

// Then once our EDS tests are done, we can either move onto HCO or EER. EER would probably be best to start with Ardon?
* fixture[+].id = "C1EUAEDSPatientDeliveryStatus"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "./Fixtures/AuditEvent-C1EUAToEdsFixture.json"

* variable[+].name = "IdOfResourceToBeCreated"
* variable[=].expression = "id"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* setup[+].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
* setup[=].action[=].operation.description = "Deletes the resource we intend to create later, to ensure it doesn't already exist on the server from previously run tests"
* setup[=].action[=].operation.resource = #AuditEvent
* setup[=].action[=].operation.encodeRequestUrl = true
* setup[=].action[=].operation.origin = 1
* setup[=].action[=].operation.destination = 1
* setup[=].action[=].operation.params = "/${IdOfResourceToBeCreated}"

* test[+].id = "CreatePatientDeliveryStatus"
* test[=].name = "ANS1 Create"
* test[=].description = "user story ANS1 create PatientDeliveryStatus object on the SUT in order to search for it later"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#update
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Create a PatientDeliveryStatus AuditEvent resource on the SUT"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.sourceId = "C1EUAEDSPatientDeliveryStatus"
* test[=].action[=].operation.params = "/${IdOfResourceToBeCreated}"
* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent was created"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.response = #created
* test[=].action[=].assert.warningOnly = false

* variable[+].name = "from"
* variable[=].expression = "recorded - 1 'minute'"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "to"
* variable[=].expression = "recorded + 1 'minute'"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusValidTimeWindow"
* test[=].name = "ANS1 search"
* test[=].description = "user story ANS1 search for the created PatientDeliveryStatus object on the SUT within a valid timeframe"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent within a valid time window"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?date=ge${from}&date=le${to}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.resource.where(is(AuditEvent) and id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusInvalidTimeWindow"
* test[=].name = "ANS1 invalid search"
* test[=].description = "user story ANS1 search for the created PatientDeliveryStatus object on the SUT outside it's recorded window. Not expecting to find it"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent within an invalid time window"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?date=ge${to}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found outside the valid time window"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.resource.where(is(AuditEvent) and id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"