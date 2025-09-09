Instance: C1EUAToEdsFailureFixture
InstanceOf: EdsPatientDeliveryStatus
Description: "A fixture representing a failed outcome EdsPatientDeliveryStatus resource sent from an EUA to EDS."
* contained[+] = C1EUASenderDeviceFixture
* type = $EhmiDeliveryStatusTypes#ehmiMessaging "EHMI messaging event"
* subtype[msg-created-and-sent] = #msg-created-and-sent "Message created and sent"
* recorded = "1970-01-01T00:00:00.000+02:00" // Replaced by Touchstone CurrentDateTime function
* outcome = $Hl7AuditOutcomeTypes#8 "Serious failure"

* id = "C1EUAToEdsFailureFixture"

* agent[ehmiSender].name = "Aarhus Kommune - Test D-CS-C6-CE"
* agent[ehmiSender].requestor = true
* agent[ehmiSender].type.coding = $EhmiDeliveryStatusParticipationRoleType#ehmiSender "Sender"
* agent[ehmiSender].who.reference = "http://medcomehmi.eer.dk/Organization/1D-CS-C15-CE" // Does not exist, is just a random reference
* agent[ehmiSender].who.display = "Aarhus Kommune"
* agent[ehmiSender].who.identifier.value = "1D-CS-C15-CE"
* agent[ehmiSender].extension[GLNId][gln].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiSender].extension[GLNId][gln].valueIdentifier.value = "1D-CS-C12-CE"

* agent[ehmiReceiver].name = "Lægerne Stjernepladsen - Test D-CS-C6-CE"
* agent[ehmiReceiver].requestor = false
* agent[ehmiReceiver].type.coding = $EhmiDeliveryStatusParticipationRoleType#ehmiReceiver "Receiver"
* agent[ehmiReceiver].who.reference = "http://medcomehmi.eer.dk/Organization/2D-CS-C15-CE" // Does not exist, is just a random reference
* agent[ehmiReceiver].who.display = "Lægerne Stjernepladsen I/S"
* agent[ehmiReceiver].who.identifier.value = "2D-CS-C15-CE"
* agent[ehmiReceiver].extension[GLNId][gln].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiReceiver].extension[GLNId][gln].valueIdentifier.value = "2D-CS-C12-CE"

* source.observer = Reference(Device/s-01-EUA-Sender)
* source.type.code = $EhmiDeliveryStatusSourceType#EUA
* source.type.system = $EhmiDeliveryStatusSourceType

* entity[ehmiPatient].what.identifier.value = "D-CS-C10-CE"

* entity[ehmiMessage].detail[ehmiMessageType].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageType
* entity[ehmiMessage].detail[ehmiMessageType].valueString = "HomeCareObservation"
* entity[ehmiMessage].detail[ehmiMessageVersion].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageVersion
* entity[ehmiMessage].detail[ehmiMessageVersion].valueString = "1.1"

* entity[ehmiMessageEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiMessageEnvelope "Message Envelope"
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageEnvelopeType
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].valueString = "FHIR Bundle"