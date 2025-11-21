RuleSet: Server-ANS1TestTimeframeSearch(xmlOrJson)
* insert Metadata(Server-ANS1TestTimeframeSearch-{xmlOrJson})
* insert EDSPatientDeliveryStatusProfile
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusCreateFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "../Fixtures/EdsPatientDeliveryStatusCreateFixture.json"

* variable[+]
  * name = "RecordedOfResourceToFindInSearch"
  * expression = "recorded"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "from"
  * expression = "recorded - 1 'minute'"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "to"
  * expression = "recorded + 1 'minute'"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusValidTimeWindow"
  * name = "ANS1 search"
  * description = "user story ANS1 search for the created PatientDeliveryStatus object on the SUT within a valid timeframe"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent within a valid time window"
    * resource = #AuditEvent
    * contentType = #{xmlOrJson}
    * accept = #{xmlOrJson}
    * encodeRequestUrl = true
    * origin = 1
    * destination = 1
    * params = "?date=ge${from}&date=le${to}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.resource.where(is(AuditEvent) and recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusInvalidTimeWindow"
  * name = "ANS1 invalid search"
  * description = "user story ANS1 search for the created PatientDeliveryStatus object on the SUT outside it's recorded window. Not expecting to find it"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent within an invalid time window"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?date=ge${to}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found outside the valid time window"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.resource.where(is(AuditEvent) and recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "0"

Instance: Server-ANS1TestTimeframeSearchJson
InstanceOf: TestScript
Title: "Test for ANS.1 - Timeframe Searching JSON format"
Description: "Test script for the ANS.1 user story. Searching in a given timeframe with JSON format"
* insert Server-ANS1TestTimeframeSearch(json)

Instance: Server-ANS1TestTimeframeSearchXml
InstanceOf: TestScript
Title: "Test for ANS.1 - Timeframe Searching XML format"
Description: "Test script for the ANS.1 user story. Searching in a given timeframe with XML format"
* insert Server-ANS1TestTimeframeSearch(xml)
