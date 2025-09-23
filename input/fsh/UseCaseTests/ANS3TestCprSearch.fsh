Instance: ANS3TestCprSearch
InstanceOf: TestScript
Title: "Test for ANS.3 - CPR Searching"
Description: "Test script for the ANS.3 use case. Searching with CPR"
* insert Metadata(ANS3TestCprSearch)
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
* test[=].name = "ANS3 Create"
* test[=].description = "Use case ANS3 create PatientDeliveryStatus object on the SUT in order to search for it later"
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

* variable[+].name = "CPROfPatientInCreatedResource"
* variable[=].expression = "entity.where(type.code = 'ehmiPatient').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusWithCPR"
* test[=].name = "ANS3 search"
* test[=].description = "Use case ANS3 search for the created PatientDeliveryStatus object on the SUT with cpr"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the CPR being ${CPROfPatientInCreatedResource}"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?cpr=${CPROfPatientInCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusInvalidCPR"
* test[=].name = "ANS3 invalid search"
* test[=].description = "Use case ANS3 search for the created PatientDeliveryStatus object on the SUT with an invalid CPR. Not expecting to find it"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with an invalid CPR"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?cpr=invalid"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid CPR"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"