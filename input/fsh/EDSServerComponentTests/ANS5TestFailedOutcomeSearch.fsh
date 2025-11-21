RuleSet: Server-ANS5TestFailedOutcomeSearch(xmlOrJson)
* insert Metadata(Server-ANS5TestFailedOutcomeSearch-{xmlOrJson})
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusFailureFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "../Fixtures/EdsPatientDeliveryStatusFailureFixture.json"

* variable[+]
  * name = "RecordedOfResourceToFindInSearch"
  * expression = "recorded"
  * sourceId = "EdsPatientDeliveryStatusFailureFixture"

* variable[+]
  * name = "FailureOutcomeOfCreatedResource"
  * expression = "outcome"
  * sourceId = "EdsPatientDeliveryStatusFailureFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithSeriousFailureOutcome"
  * name = "ANS5 search"
  * description = "user story ANS5 search for the created PatientDeliveryStatus object on the SUT with failed outcome"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with a failed outcome"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?outcome=${FailureOutcomeOfCreatedResource}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithSuccessfulOutcome"
  * name = "ANS5 successful search"
  * description = "user story ANS5 search for the created PatientDeliveryStatus object on the SUT with a successful outcome"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with a successful outcome"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?outcome=0"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "0"

Instance: Server-ANS5TestFailedOutcomeSearchJson
InstanceOf: TestScript
Title: "Test for ANS.5 - Failed Outcome Searching JSON format"
Description: "Test script for the ANS.5 user story. Searching for messages with a failed outcome in JSON format"
* insert Server-ANS5TestFailedOutcomeSearch(json)

Instance: Server-ANS5TestFailedOutcomeSearchXml
InstanceOf: TestScript
Title: "Test for ANS.5 - Failed Outcome Searching XML format"
Description: "Test script for the ANS.5 user story. Searching for messages with a failed outcome in XML format"
* insert Server-ANS5TestFailedOutcomeSearch(xml)
