Instance: ANS2TestMessageTypeSearch
InstanceOf: TestScript
Title: "Test for ANS.2 - Message Type Searching"
Description: "Test script for the ANS.2 user story. Searching for a specific message type"
* insert Metadata(ANS2TestMessageTypeSearch)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

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
* test[=].name = "ANS2 Create"
* test[=].description = "user story ANS2 create PatientDeliveryStatus object on the SUT in order to search for it later"
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

* variable[+].name = "MessageTypeOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiMessageType').value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusWithMessageType"
* test[=].name = "ANS2 search"
* test[=].description = "user story ANS2 search for the created PatientDeliveryStatus object on the SUT with ehmiMessageType"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the type being ${MessageTypeOfCreatedResource}"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiMessageType=${MessageTypeOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusInvalidMessageType"
* test[=].name = "ANS2 invalid search"
* test[=].description = "user story ANS2 search for the created PatientDeliveryStatus object on the SUT with an invalid message type. Not expecting to find it"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with an invalid message type"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiMessageType=invalid"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid message type"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"