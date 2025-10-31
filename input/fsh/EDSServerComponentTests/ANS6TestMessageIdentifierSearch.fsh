RuleSet: ServerComponent-ANS6TestMessageIdentifierSearching(xmlOrJson)
* insert Metadata(ServerComponent-ANS6TestMessageIdentifierSearching)
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusCreateFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusCreateFixture.json"

* variable[+]
  * name = "RecordedOfResourceToFindInSearch"
  * expression = "recorded"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "ehmiMessageIdentifierOfCreatedResource"
  * expression = "entity.where(type.code = 'ehmiMessage').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "ehmiMessageEnvelopeIdentifierOfCreatedResource"
  * expression = "entity.where(type.code = 'ehmiMessageEnvelope').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "ehmiTransportEnvelopeIdentifierOfCreatedResource"
  * expression = "entity.where(type.code = 'ehmiTransportEnvelope').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "ehmiOrigMessageIdentifierOfCreatedResource"
  * expression = "entity.where(type.code = 'ehmiOrigMessage').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "ehmiOrigTransportEnvelopeIdentifierOfCreatedResource"
  * expression = "entity.where(type.code = 'ehmiOrigTransportEnvelope').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithEhmiMessageIdentifier"
  * name = "ANS6 search with ehmi message identifier"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiMessage identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiMessage identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=${ehmiMessageIdentifierOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithEhmiMessageEnvelopeIdentifier"
  * name = "ANS6 search with ehmi message envelope identifier"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiMessageEnvelope identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiMessageEnvelope identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=${ehmiMessageEnvelopeIdentifierOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithEhmiTransportEnvelopeIdentifier"
  * name = "ANS6 search with ehmi transport envelope identifier"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiTransportEnvelope identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiTransportEnvelope identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=${ehmiTransportEnvelopeIdentifierOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithEhmiOrigMessageIdentifier"
  * name = "ANS6 search with ehmi orig envelope identifier"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiOrigMessageIdentifier identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiOrigMessageIdentifier identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=${ehmiOrigMessageIdentifierOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithEhmiOrigTransportEnvelopeIdentifier"
  * name = "ANS6 search with ehmi orig transport envelope identifier"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with the ehmiOrigTransportEnvelope identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the ehmiOrigTransportEnvelope identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=${ehmiOrigTransportEnvelopeIdentifierOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithInvalidEhmiIdentifier"
  * name = "ANS6 search"
  * description = "user story ANS6 search for the created PatientDeliveryStatus object on the SUT with an invalid ehmi identifier"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with an invalid EHMI identifier"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?entityIdentifier=invalid"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "0"

Instance: ServerComponent-ANS6TestMessageIdentifierSearchingJson
InstanceOf: TestScript
Title: "Test for ANS.6 - Message Identifier Searching JSON format"
Description: "Test script for the ANS.6 user story. Searching for messages with a specific identifier in JSON format"
* insert ServerComponent-ANS6TestMessageIdentifierSearching(json)

Instance: ServerComponent-ANS6TestMessageIdentifierSearchingXml
InstanceOf: TestScript
Title: "Test for ANS.6 - Message Identifier Searching XML format"
Description: "Test script for the ANS.6 user story. Searching for messages with a specific identifier in XML format"
* insert ServerComponent-ANS6TestMessageIdentifierSearching(xml)
