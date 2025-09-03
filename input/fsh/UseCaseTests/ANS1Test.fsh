Instance: ANS1Test
InstanceOf: TestScript
Title: "Test for ANS.1"
Description: "Test script for the ANS.1 use case."
* insert Metadata(ANS1Test)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+].id = "resource-create"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "./Fixtures/AuditEvent-C1EUAToEdsFixture.json"

* variable[+].name = "created-resource-id"
* variable[=].path = ".id"
* variable[=].sourceId = "resource-create"

* setup[+].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
* setup[=].action[=].operation.description = "Deletes the resource we intend to create later, to ensure it doesn't already exist on the server from previously run tests"
* setup[=].action[=].operation.resource = #AuditEvent
* setup[=].action[=].operation.encodeRequestUrl = true
* setup[=].action[=].operation.origin = 1
* setup[=].action[=].operation.destination = 1
* setup[=].action[=].operation.params = "/${created-resource-id}"

* test[+].id = "ANS1CreatePatientDeliveryStatus"
* test[=].name = "UseCase ANS1 Create"
* test[=].description = "Use case ANS1 create PatientDeliveryStatus object on the SUT in order to search for it later"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Create a PatientDeliveryStatus AuditEvent resource on the SUT"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.sourceId = "resource-create"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent was created"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.response = #created
* test[=].action[=].assert.warningOnly = false


// TODO: search for the resource within a valid timeframe
// TODO: assert that the created resource is there

// TODO: search for the resource within an invalid timeframe. Assert that the created resource is not there