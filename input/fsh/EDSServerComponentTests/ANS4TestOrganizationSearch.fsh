RuleSet: Server-ANS4TestOrgSearch(xmlOrJson)
* insert Metadata(Server-ANS4TestOrgSearch-{xmlOrJson})
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
  * name = "SORIDOfReceiverOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiReceiver').who.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "GLNOfReceiverOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiReceiver').extension.where(url = 'http://medcomehmi.dk/ig/eds/StructureDefinition/eds-otherId').valueIdentifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "NameReceiverOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiReceiver').name"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithReceiverOrgSOR"
  * name = "ANS4 receiver org search SOR"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org SOR"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization, SOR"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?receiverOrg=${SORIDOfReceiverOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithReceiverOrgGLN"
  * name = "ANS4 receiver org search GLN"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org GLN"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization GLN"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?receiverOrg=${GLNOfReceiverOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithReceiverOrgName"
  * name = "ANS4 receiver org search Name"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with receiver org Name"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the receiver organization, Name"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?receiverOrg=${NameReceiverOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusInvalidReceiverOrgDetails"
  * name = "ANS4 invalid receiver org search"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with an invalid receiver organization. Not expecting to find it"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with an invalid receiver organization"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?receiverOrg=invalid"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid receiver organization"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.total"
    * operator = #equals
    * value = "0"

* variable[+]
  * name = "SORIDOfSenderOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiSender').who.identifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "GLNOfSenderOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiSender').extension.where(url = 'http://medcomehmi.dk/ig/eds/StructureDefinition/eds-otherId').valueIdentifier.value"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* variable[+]
  * name = "NameSenderOrganization"
  * expression = "agent.where(type.coding.code = 'ehmiSender').name"
  * sourceId = "EdsPatientDeliveryStatusCreateFixture"

* test[+]
  * id = "SearchPatientDeliveryStatusWithSenderOrgSOR"
  * name = "ANS4 sender org search SOR"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org SOR"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization, SOR"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?senderOrg=${SORIDOfSenderOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithSenderOrgGLN"
  * name = "ANS4 sender org search GLN"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org GLN"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization GLN"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?senderOrg=${GLNOfSenderOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusWithSenderOrgName"
  * name = "ANS4 sender org search name"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with sender org Name"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with the sender organization, Name"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?senderOrg=${NameSenderOrganization}"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is found"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.entry.where(resource.resourceType = 'AuditEvent' and resource.recorded = '${RecordedOfResourceToFindInSearch}').count()"
    * operator = #equals
    * value = "1"

* test[+]
  * id = "SearchPatientDeliveryStatusInvalidSenderOrgDetails"
  * name = "ANS4 invalid search"
  * description = "user story ANS4 search for the created PatientDeliveryStatus object on the SUT with an invalid sender organization. Not expecting to find it"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#search
    * description = "Search for the PatientDeliveryStatus AuditEvent with an invalid sender organization"
    * resource = #AuditEvent
    * encodeRequestUrl = true
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params = "?senderOrg=invalid"
  * action[+].assert
    * description = "Ensure the PatientDeliveryStatus AuditEvent is not found with an invalid sender organization"
    * direction = #response
    * warningOnly = false
    * expression = "Bundle.total"
    * operator = #equals
    * value = "0"

Instance: ServerComponent-ANS4TestOrgSearchJson
InstanceOf: TestScript
Title: "Test for ANS.4 - Organization Searching JSON format"
Description: "Test script for the ANS.4 user story. Searching for sender or receiver organization in JSON format"
* insert ServerComponent-ANS4TestOrgSearch(json)

Instance: ServerComponent-ANS4TestOrgSearchXml
InstanceOf: TestScript
Title: "Test for ANS.4 - Organization Searching XML format"
Description: "Test script for the ANS.4 user story. Searching for sender or receiver organization in XML format"
* insert ServerComponent-ANS4TestOrgSearch(xml)