Instance: EdsPatientDeliveryStatusFailureFixture
InstanceOf: EdsPatientDeliveryStatus
Description: "A fixture representing a failed outcome EdsPatientDeliveryStatus resource sent from an EUA to EDS."
* insert OverrideGeneratedFileNameHelper(EdsPatientDeliveryStatusFailureFixture)
* type = $EhmiDeliveryStatusTypes#ehmiMessaging "EHMI messaging event"
* subtype = $EdsSubtypes#msg-created-and-sent "Message created and sent"
* recorded = "1997-02-02T19:18:22.222+01:00"
* outcome = $Hl7AuditOutcomeTypes#8 "Serious failure"

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