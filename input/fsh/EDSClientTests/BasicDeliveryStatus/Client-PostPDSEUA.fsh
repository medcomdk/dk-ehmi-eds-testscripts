Instance: Client-PostEUATest
InstanceOf: TestScript
Title: "Test for posting EUA to EDS"
Description: "Test script for posting EUA to EDS"
* insert Metadata(Client-PostEUATest)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

// TODO: We expect them to post an EUA EDS message to the system and then we validate it and ensure that the subtype is correct
// perhaps there is also other fields we want to assert on

* extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-dynamic-fixture"
* extension[=].extension[+].url = "id"
* extension[=].extension[=].valueId = "resource-to-be-created"
* extension[=].extension[+].url = "resourceType"
* extension[=].extension[=].valueString = "AuditEvent"
* extension[=].extension[+].url = "contentType"
* extension[=].extension[=].valueString = "application/fhir+json"
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Enter a PatientDeliveryStatus AuditEvent resource that is to be validated"
* extension[=].extension[+].url = "hint"
* extension[=].extension[=].valueString = "PatientDeliveryStatus AuditEvent"

* test[+].id = "POST-EUA-PDS-AuditEvent"
* test[=].name = "POST EUA PDS AuditEvent"
* test[=].description = "POST EUA PDS PatientDeliveryStatus to validate content"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#create
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Create a PatientDeliveryStatus AuditEvent"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.sourceId = "resource-to-be-created"
* test[=].action[=].operation.responseId = "created-resource-on-the-server"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent conforms to the FHIR profile"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.validateProfileId = "eds-patient-delivery-status"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent device is of the type EUA"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.expression = "source.type.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "EUA"

* test[=].action[+].assert.description = "Ensure the PatientDeliveryStatus AuditEvent is of the subtype msg-created-and-sent"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.warningOnly = false
// TODO: Ask Ardon what he meant about the system not being fixed or something?
* test[=].action[=].assert.expression = "subtype.where(system = 'http://medcomehmi.dk/ig/terminology/CodeSystem/ehmi-delivery-status-sub-types').code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "msg-created-and-sent"

* test[=].action[+].assert.description = "Ensure the auth token corresponds to the values found in the AuditEvent"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.warningOnly = false
* test[=].action[=].assert.headerField = "Authorization"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJFQ3I1MUNFc1FaaGRZdmNtRkxzbkpYVjJ2bm9fQzFqTnlSQWgwV3NhWm9FIn0.eyJleHAiOjE3NTY4ODkwMDQsImlhdCI6MTc1Njg4ODcwNCwianRpIjoiOGEzOTkyZGMtOTZlMC00YWQyLWIzMTctZDExNDk4NGUxZGIwIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay5ob3N0aW5nLmtpdGt1YmUuZGsvYXV0aC9yZWFsbXMvbWVkY29tIiwiYXVkIjpbImhhcGlmaGlyLW1lZGNvbS1pZyIsInJlYWxtLW1hbmFnZW1lbnQiLCJhY2NvdW50Il0sInN1YiI6IjkzODMyNDVlLTMxZDItNGZmYi1hMzUwLTk2OWI2MTRjYTRiNSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImhhcGlmaGlyLXVzZXJjbGllbnQiLCJzaWQiOiI0Y2Y0NDJiZi0xNGEwLTQ4ODMtOTYxMC01YjkwMjRhMmFlYTkiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwiYWRtaW4iLCJ1bWFfYXV0aG9yaXphdGlvbiIsImRlZmF1bHQtcm9sZXMtbWVkY29tIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsicmVhbG0tbWFuYWdlbWVudCI6eyJyb2xlcyI6WyJtYW5hZ2UtdXNlcnMiLCJ2aWV3LXVzZXJzIiwicXVlcnktZ3JvdXBzIiwicXVlcnktdXNlcnMiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIGVtYWlsIHByb2ZpbGUiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6Ik9saXZlciBXaW50aGVyIiwicHJlZmVycmVkX3VzZXJuYW1lIjoib2x3QG1lZGNvbS5kayIsImdpdmVuX25hbWUiOiJPbGl2ZXIiLCJmYW1pbHlfbmFtZSI6IldpbnRoZXIiLCJlbWFpbCI6Im9sd0BtZWRjb20uZGsifQ.J_h9-7kXDrOokg254_DEOxx2x0ttW01nXsswhBTdKEATAdApTMME0oKw-mchONzq31N5V_EWzwW5xH6NRTPa6YNs5LxNLsBhRlWz2jchev7QTbb9cdYMx6_1KrxwI4w7G4cLmHI-_r2HRE-x2QJvwx73H1fSquNvqPoneH__MzCEZvKGQrcjyxXZ305UeyuFPT_Q5xuzfxhUThhVSZfug3Z2Nndf3hhU41SXprb-4pgZINFxv-KgPs1Y6Q4iplJs4QULqYo07cyO9xVdSfFNQxm1nNPMLL-KN3jCJYN_eA_CmCDTb07EdP6MLqF_SvciyH4Xxy0d8pQMVdy-5S9RBw"

// TODO: we also want to assert that the token they give us also corresponds to the information in the AuditEvent

// TODO: Do we want to make some type of asserts on the SOR, GLN or device id? I.e. we could ask them to make the SOR or GLN a certain thing and then we assert that the device
// is correct. Or perhaps it should be the other way around.

// TODO: Can we use keycloack as some type of auth validator in the test? 

// Clean up:
* variable[+].name = "IdOfCreatedResource"
* variable[=].expression = "id"
* variable[=].sourceId = "created-resource-on-the-server"

* test[+].id = "CLEAN-UP-THE-CREATED-RESOURCE"
* test[=].name = "CLEAN UP THE CREATED RESOURCE"
* test[=].description = "Delete the PatientDeliveryStatus AuditEvent that was created"
* test[=].action[+].operation.type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#delete
* test[=].action[=].operation.resource = #AuditEvent
* test[=].action[=].operation.description = "Delete the PatientDeliveryStatus AuditEvent"
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.params = "/${IdOfCreatedResource}"

