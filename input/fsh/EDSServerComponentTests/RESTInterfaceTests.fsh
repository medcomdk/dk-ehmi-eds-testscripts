RuleSet: ServerComponent-RESTInterfaceTests(xmlOrJson)
* insert Metadata(ServerComponent-RESTInterfaceTests)
* insert OriginClient
* insert DestinationServer

* fixture[+]
  * id = "EdsPatientDeliveryStatusCreateFixture"
  * autocreate = false
  * autodelete = false
  * resource.reference = "./Fixtures/EdsPatientDeliveryStatusCreateFixture.json"

* test[+]
  * id = "Disallow updates, patches & deletions to AuditEvents"
  * name = "Disallow-actions-for-AuditEvents"
  * description = "Ensure that the EDS Server Component disallows updates, patches & deletions to AuditEvent resources"
  * action[+].operation
    * type = http://terminology.hl7.org/CodeSystem/testscript-operation-codes#metadata
    * description = "Retrieve the server's CapabilityStatement"
    * resource = #AuditEvent
    * encodeRequestUrl = false
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}


// TODO: Make a test to assert the version of the FHIR server, it should be

Instance: ServerComponent-RESTInterfaceTestsJson
InstanceOf: TestScript
Title: "REST Interface Tests for EDS Server Component JSON"
Description: "Test script for REST interface tests of the EDS Server Component JSON"
* insert ServerComponent-RESTInterfaceTests(json)

Instance: ServerComponent-RESTInterfaceTestsXml
InstanceOf: TestScript
Title: "REST Interface Tests for EDS Server Component XML"
Description: "Test script for REST interface tests of the EDS Server Component XML"
* insert ServerComponent-RESTInterfaceTests(xml)
