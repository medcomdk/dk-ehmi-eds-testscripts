Instance: ANS4TestOrgSearch
InstanceOf: TestScript
Title: "Test for ANS.4 - Organization Searching"
Description: "Test script for the ANS.4 use case. Searching for sender or receiver organization"
* insert Metadata(ANS4TestOrgSearch)
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
* test[=].name = "ANS4 Create"
* test[=].description = "Use case ANS4 create PatientDeliveryStatus object on the SUT in order to search for it later"
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

* variable[+].name = "SORIDOfReceiverOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiReceiver').who.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "GLNOfReceiverOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiReceiver').extension.where(url = 'http://medcomehmi.dk/ig/eds/StructureDefinition/eds-otherId').valueIdentifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "NameReceiverOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiReceiver').name"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusWithReceiverOrgSOR"
* test[=].name = "ANS4 receiver org search SOR"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org SOR"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization, SOR"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?receiverOrg=${SORIDOfReceiverOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithReceiverOrgGLN"
* test[=].name = "ANS4 receiver org search GLN"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org GLN"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization GLN"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?receiverOrg=${GLNOfReceiverOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithReceiverOrgName"
* test[=].name = "ANS4 receiver org search Name"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org Name"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization, Name"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?receiverOrg=${NameReceiverOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusInvalidReceiverOrgDetails"
* test[=].name = "ANS4 invalid receiver org search"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with an invalid receiver organization. Not expecting to find it"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with an invalid receiver organization"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?receiverOrg=invalid"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid receiver organization"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.total"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"

* variable[+].name = "SORIDOfSenderOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiSender').who.identifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "GLNOfSenderOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiSender').extension.where(url = 'http://medcomehmi.dk/ig/eds/StructureDefinition/eds-otherId').valueIdentifier.value"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* variable[+].name = "NameSenderOrganization"
* variable[=].expression = "agent.where(type.coding.code = 'ehmiSender').name"
* variable[=].sourceId = "C1EUAEDSPatientDeliveryStatus"

* test[+].id = "SearchPatientDeliveryStatusWithSenderOrgSOR"
* test[=].name = "ANS4 sender org search SOR"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org SOR"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization, SOR"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?senderOrg=${SORIDOfSenderOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithSenderOrgGLN"
* test[=].name = "ANS4 sender org search GLN"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org GLN"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization GLN"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?senderOrg=${GLNOfSenderOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusWithSenderOrgName"
* test[=].name = "ANS4 sender org search name"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org Name"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization, Name"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?senderOrg=${NameSenderOrganization}"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is found"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.id = '${IdOfResourceToBeCreated}').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"

* test[+].id = "SearchPatientDeliveryStatusInvalidSenderOrgDetails"
* test[=].name = "ANS4 invalid search"
* test[=].description = "Use case ANS4 search for the created PatientDeliveryStatus object on the SUT with an invalid sender organization. Not expecting to find it"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Search for the PatientDeliveryStatus AuditEvent with an invalid sender organization"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "?senderOrg=invalid"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid sender organization"
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "Bundle.total"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "0"