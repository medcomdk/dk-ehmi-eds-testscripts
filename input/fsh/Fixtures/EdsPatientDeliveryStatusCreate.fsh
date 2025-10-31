Instance: EdsPatientDeliveryStatusCreateFixture
InstanceOf: EdsPatientDeliveryStatus
Description: "A fixture representing an EdsPatientDeliveryStatus resource sent from an EUA to EDS."
* insert OverrideGeneratedFileNameHelper(EdsPatientDeliveryStatusCreateFixture)
* type = $EhmiDeliveryStatusTypes#ehmiMessaging "EHMI messaging event"
* subtype = $EdsSubtypes#msg-created-and-sent "Message created and sent"
* recorded = "1997-02-02T19:18:11.111+01:00"
* outcome = $Hl7AuditOutcomeTypes#0 "Success"

* agent[ehmiSender].name = "Touchstone TEST EHMI Sender"
* agent[ehmiSender].requestor = true
* agent[ehmiSender].type = $EhmiDeliveryStatusParticipationRoleType#ehmiSender "Sender"
* agent[ehmiSender].who.identifier.value = "urn:uuid:b4f04f14-80ad-4979-85c8-ec5cc3d40dce"
* agent[ehmiSender].extension[GLNId].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiSender].extension[GLNId].valueIdentifier.value = "1111111111111"

* agent[ehmiReceiver].name = "Touchstone TEST EHMI Receiver"
* agent[ehmiReceiver].requestor = false
* agent[ehmiReceiver].type = $EhmiDeliveryStatusParticipationRoleType#ehmiReceiver "Receiver"
* agent[ehmiReceiver].who.identifier.value = "urn:uuid:290a1c7c-a47c-4865-8a1a-0a784ed0deaf"
* agent[ehmiReceiver].extension[GLNId].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiReceiver].extension[GLNId].valueIdentifier.value = "1111111111112"

* source.observer.identifier.value = "touchstone-eua-device-for-testing"
* source.type = $EhmiDeliveryStatusSourceType#EUA "EUA (End-user Application)"

* entity[ehmiPatient].what.identifier.value = "urn:uuid:d650e137-3815-4066-86f5-7f9ece964a62"
* entity[ehmiPatient].type = $EhmiDeliveryStatusEntityType#ehmiPatient "Patient"

* entity[ehmiMessage].what.identifier.value = "urn:uuid:72ef4757-2e28-41c4-9c84-636219d1198a"
* entity[ehmiMessage].type = $EhmiDeliveryStatusEntityType#ehmiMessage "Message"
* entity[ehmiMessage].detail[ehmiMessageType].type = #ehmiMessageType
* entity[ehmiMessage].detail[ehmiMessageType].valueString = "HomeCareObservation"
* entity[ehmiMessage].detail[ehmiMessageVersion].type = #ehmiMessageVersion
* entity[ehmiMessage].detail[ehmiMessageVersion].valueString = "1.1"

* entity[ehmiMessageEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiMessageEnvelope "Message Envelope"
* entity[ehmiMessageEnvelope].what.identifier.value = "urn:uuid:70639346-5ce5-4dd7-b5be-1e4d95572a91"
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].type = #ehmiMessageEnvelopeType
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].valueString = "FHIR Bundle"

* entity[ehmiTransportEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiTransportEnvelope "Transport Envelope"
* entity[ehmiTransportEnvelope].what.identifier.value = "urn:uuid:0b682f55-eca9-4915-b8b5-675c3320ca93"
* entity[ehmiTransportEnvelope].detail[ehmiTransportEnvelopeType].type = #ehmiTransportEnvelopeType
* entity[ehmiTransportEnvelope].detail[ehmiTransportEnvelopeType].valueString = "SBDH"
* entity[ehmiTransportEnvelope].detail[ehmiTransportEnvelopeVersion].type = #ehmiTransportEnvelopeVersion
* entity[ehmiTransportEnvelope].detail[ehmiTransportEnvelopeVersion].valueString = "2.0"

* entity[ehmiOrigMessage].type = $EhmiDeliveryStatusEntityType#ehmiOrigMessage "Original Message"
* entity[ehmiOrigMessage].what.identifier.value = "urn:uuid:c38778b5-48c9-4243-b956-f9f754bdbc67"
* entity[ehmiOrigMessage].detail[ehmiMessageType].type = #ehmiMessageType
* entity[ehmiOrigMessage].detail[ehmiMessageType].valueString = "HomeCareObservation"
* entity[ehmiOrigMessage].detail[ehmiMessageVersion].type = #ehmiMessageVersion
* entity[ehmiOrigMessage].detail[ehmiMessageVersion].valueString = "1.1"

* entity[ehmiOrigTransportEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiOrigTransportEnvelope "Original Transport Envelope"
* entity[ehmiOrigTransportEnvelope].what.identifier.value = "urn:uuid:389ebc9f-792e-43e6-8943-dda5632a7654"
* entity[ehmiOrigTransportEnvelope].detail[ehmiTransportEnvelopeType].type = #ehmiTransportEnvelopeType
* entity[ehmiOrigTransportEnvelope].detail[ehmiTransportEnvelopeType].valueString = "SBDH"
* entity[ehmiOrigTransportEnvelope].detail[ehmiTransportEnvelopeVersion].type = #ehmiTransportEnvelopeVersion
* entity[ehmiOrigTransportEnvelope].detail[ehmiTransportEnvelopeVersion].valueString = "2.0"