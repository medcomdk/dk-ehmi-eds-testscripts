Instance: ANS6TestMessageIdentifierSearching
InstanceOf: TestScript
Title: "Test for ANS.6 - Message Identifier Searching"
Description: "Test script for the ANS.6 use case. Searching for messages with a specific identifier"
* insert Metadata(ANS6TestMessageIdentifierSearching)
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
* test[=].name = "ANS6 Create"
* test[=].description = "Use case ANS6 create PatientDeliveryStatus object on the SUT in order to search for it later"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Create a PatientDeliveryStatus AuditEvent resource on the SUT"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.sourceId = "C1EUAEDSPatientDeliveryStatus"
* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent was created"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.response = #created
* test[=].action[=].assert.warningOnly = false

* variable[+].name = "ehmiMessageIdentifierOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiMessage').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "ehmiMessageEnvelopeIdentifierOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiMessageEnvelope').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "ehmiTransportEnvelopeIdentifierOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiTransportEnvelope').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "ehmiOrigMessageIdentifierOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiOrigMessage').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "ehmiOrigTransportEnvelopeIdentifierOfCreatedResource"
* variable[=].expression = "entity.detail.where(type = 'ehmiOrigTransportEnvelope').what.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusWithEhmiMessageIdentifier"
* test[=].name = "ANS6 search with ehmi message identifier"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiMessage identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiMessage identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=${ehmiMessageIdentifierOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithEhmiMessageEnvelopeIdentifier"
* test[=].name = "ANS6 search with ehmi message envelope identifier"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiMessageEnvelope identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiMessageEnvelope identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=${ehmiMessageEnvelopeIdentifierOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithEhmiTransportEnvelopeIdentifier"
* test[=].name = "ANS6 search with ehmi transport envelope identifier"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiTransportEnvelope identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiTransportEnvelope identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=${ehmiTransportEnvelopeIdentifierOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithEhmiOrigMessageIdentifier"
* test[=].name = "ANS6 search with ehmi orig envelope identifier"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiOrigMessageIdentifier identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiOrigMessageIdentifier identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=${ehmiOrigMessageIdentifierOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithEhmiOrigTransportEnvelopeIdentifier"
* test[=].name = "ANS6 search with ehmi orig transport envelope identifier"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiOrigTransportEnvelope identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiOrigTransportEnvelope identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=${ehmiOrigTransportEnvelopeIdentifierOfCreatedResource}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithInvalidEhmiIdentifier"
* test[=].name = "ANS6 search"
* test[=].description = "Use case ANS6 search for the created PatientDeliveryStatus object on the SUT with an invalid ehmi identifier"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with an invalid ehmi identifier"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?ehmiIdentifier=invalid"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.path = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"