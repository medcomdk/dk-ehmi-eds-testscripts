Instance: C1EUAToEdsFailureFixture
InstanceOf: EdsPatientDeliveryStatus
Description: "A fixture representing a failed outcome EdsPatientDeliveryStatus resource sent from an EUA to EDS."
* contained[+] = C1EUASenderDeviceFixture
* type = $EhmiDeliveryStatusTypes#ehmiMessaging "EHMI messaging event"
* subtype = $EdsSubtypes#msg-created-and-sent "Message created and sent"
* recorded = "1970-01-01T00:00:00.000+02:00" // Replaced by Touchstone CurrentDateTime function
* outcome = $Hl7AuditOutcomeTypes#8 "Serious failure"

* id = "C1EUAToEdsFailureFixture"

* agent[ehmiSender].name = "Aarhus Kommune - Test D-CS-C6-CE"
* agent[ehmiSender].requestor = true
* agent[ehmiSender].type = $EhmiDeliveryStatusParticipationRoleType#ehmiSender "Sender"
* agent[ehmiSender].who.display = "Aarhus Kommune"
* agent[ehmiSender].who.identifier.value = "1D-CS-C15-CE"
* agent[ehmiSender].extension[GLNId].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiSender].extension[GLNId].valueIdentifier.value = "1D-CS-C12-CE"

* agent[ehmiReceiver].name = "Lægerne Stjernepladsen - Test D-CS-C6-CE"
* agent[ehmiReceiver].requestor = false
* agent[ehmiReceiver].type = $EhmiDeliveryStatusParticipationRoleType#ehmiReceiver "Receiver"
* agent[ehmiReceiver].who.display = "Lægerne Stjernepladsen I/S"
* agent[ehmiReceiver].who.identifier.value = "2D-CS-C15-CE"
* agent[ehmiReceiver].extension[GLNId].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiReceiver].extension[GLNId].valueIdentifier.value = "2D-CS-C12-CE"

* source.observer = Reference(C1EUASenderDeviceFixture)
* source.type = $EhmiDeliveryStatusSourceType#EUA "EUA (End-user Application)"

* entity[ehmiPatient].what.identifier.value = "D-CS-C10-CE"
* entity[ehmiPatient].type = $EhmiDeliveryStatusEntityType#ehmiPatient "Patient"

* entity[ehmiMessage].what.identifier.value = "D-CS-C11-CE"
* entity[ehmiMessage].type = $EhmiDeliveryStatusEntityType#ehmiMessage "Message"
* entity[ehmiMessage].detail[ehmiMessageType].type = #ehmiMessageType
* entity[ehmiMessage].detail[ehmiMessageType].valueString = "HomeCareObservation"
* entity[ehmiMessage].detail[ehmiMessageVersion].type = #ehmiMessageVersion
* entity[ehmiMessage].detail[ehmiMessageVersion].valueString = "1.1"

* entity[ehmiMessageEnvelope].what.identifier.value = "D-CS-C13-CE"
* entity[ehmiMessageEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiMessageEnvelope "Message Envelope"
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].type = #ehmiMessageEnvelopeType
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].valueString = "FHIR Bundle"