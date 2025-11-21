RuleSet: Server-2RESTInterfaceTests(xmlOrJson)
* insert Metadata(Server-2RESTInterfaceTests{xmlOrJson})
* insert CapabilitiesProfile
* insert OriginClient
* insert DestinationServer

* test[+]
  * id = "Disallow updates, patches & deletions to AuditEvents"
  * name = "Disallow-actions-for-AuditEvents"
  * description = "Ensure that the EDS Server Component disallows updates, patches & deletions to AuditEvent resources"
  * action[+].operation
    * type = http://touchstone.com/fhir/testscript-operation-codes-extended#metadata
    * description = "Retrieve the server's CapabilityStatement"
    * encodeRequestUrl = false
    * origin = 1
    * contentType = #{xmlOrJson}
    * destination = 1
    * accept = #{xmlOrJson}
    * params =  "metadata"
  * action[+].assert
    * description = "Ensure the HTTP status is 200(OK)"
    * direction = #response
    * warningOnly = false
    * responseCode = "200"
  * action[+].assert
    * description = "Ensure the resource type is CapabilityStatement"
    * direction = #response
    * warningOnly = false
    * resource = #CapabilityStatement
  * action[+].assert
    * description = "Ensure that the returned CapabilityStatement is valid"
    * direction = #response
    * warningOnly = false
    * validateProfileId = "capabilities-profile"
  * action[+].assert
    * description = "Ensure the HAPI FHIR version is atleast 8.2"
    * direction = #response
    * warningOnly = false
    * expression = "software.version.substring(0,3).toDecimal()"
    * operator = #greaterThan
    * value = "8.1"
  * action[+].assert
    * description = "Ensure that updates, patches & deletions to AuditEvent resources are disallowed"
    * direction = #response
    * warningOnly = false
    * expression = "rest.resource.where(type = 'AuditEvent').interaction.where(code = 'update' or code = 'patch' or code = 'delete').count()"
    * operator = #equals
    * value = "0"

Instance: Server-2RESTInterfaceTestsJSON
InstanceOf: TestScript
Title: "REST Interface Tests for EDS Server Component JSON"
Description: "Test script for REST interface tests of the EDS Server Component JSON"
* insert Server-2RESTInterfaceTests(json)

Instance: Server-2RESTInterfaceTestsXml
InstanceOf: TestScript
Title: "REST Interface Tests for EDS Server Component XML"
Description: "Test script for REST interface tests of the EDS Server Component XML"
* insert Server-2RESTInterfaceTests(xml)