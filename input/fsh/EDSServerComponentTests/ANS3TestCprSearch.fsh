RuleSet: ServerComponent-ANS3TestCprSearch(xmlOrJson)
* insert Metadata(ServerComponent-ANS3TestCprSearch{xmlOrJson})
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
  * name = "CPROfPatientInFixture"
  * expression = "entity.where(type.code = 'ehmiPatient').what.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithCPR"
  * name = "ANS3 search"
  * description = "user story ANS3 search for the created PatientDeliveryStatus object on the SUT with cpr"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the CPR being ${CPROfPatientInFixture}"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?cpr=${CPROfPatientInFixture}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusInvalidCPR"
  * name = "ANS3 invalid search"
  * description = "user story ANS3 search for the created PatientDeliveryStatus object on the SUT with an invalid CPR. Not expecting to find it"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with an invalid CPR"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?cpr=invalid"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid CPR"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "0"

Instance: ServerComponent-ANS3TestCprSearchJson
InstanceOf: TestScript
Title: "Test for ANS.3 - CPR Searching JSON format"
Description: "Test script for the ANS.3 user story. Searching with CPR in JSON format"
* insert ServerComponent-ANS3TestCprSearch(json)

Instance: ServerComponent-ANS3TestCprSearchXml
InstanceOf: TestScript
Title: "Test for ANS.3 - CPR Searching XML format"
Description: "Test script for the ANS.3 user story. Searching with CPR in XML format"
* insert ServerComponent-ANS3TestCprSearch(xml)
