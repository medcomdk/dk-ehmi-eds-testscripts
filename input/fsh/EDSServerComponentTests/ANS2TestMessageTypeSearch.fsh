RuleSet: ServerComponent-ANS2TestMessageTypeSearch(xmlOrJson)
* insert Metadata(ServerComponent-ANS2TestMessageTypeSearch{xmlOrJson})
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
  * name = "MessageTypeOfCreatedResource"
  * expression = "entity.detail.where(type = 'ehmiMessageType').value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithMessageType"
  * name = "ANS2 search"
  * description = "user story ANS2 search for the created PatientDeliveryStatus object on the SUT with ehmiMessageType"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the type being ${MessageTypeOfCreatedResource}"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * destination = 1
    * params = "?ehmiMessageType=${MessageTypeOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusInvalidMessageType"
  * name = "ANS2 invalid search"
  * description = "user story ANS2 search for the created PatientDeliveryStatus object on the SUT with an invalid message type. Not expecting to find it"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with an invalid message type"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?ehmiMessageType=invalid"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid message type"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "0"

Instance: ServerComponent-ANS2TestMessageTypeSearchJson
InstanceOf: TestScript
Title: "Test for ANS.2 - Message Type Searching JSON format"
Description: "Test script for the ANS.2 user story. Searching for a specific message type in JSON format"
* insert ServerComponent-ANS2TestMessageTypeSearch(json)

Instance: ServerComponent-ANS2TestMessageTypeSearchXml
InstanceOf: TestScript
Title: "Test for ANS.2 - Message Type Searching XML format"
Description: "Test script for the ANS.2 user story. Searching for a specific message type in XML format"
* insert ServerComponent-ANS2TestMessageTypeSearch(xml)
