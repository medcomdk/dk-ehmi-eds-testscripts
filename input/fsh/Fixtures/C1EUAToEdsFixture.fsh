Instance: C1EUAToEdsFixture
InstanceOf: EdsPatientDeliveryStatus
Description: "A fixture representing an EdsPatientDeliveryStatus resource sent from an EUA to EDS."
* contained[+] = C1EUASenderDeviceFixture
* type = $EhmiDeliveryStatusTypes#ehmiMessaging "EHMI messaging event"
* subtype[msg-created-and-sent] = #msg-created-and-sent "Message created and sent"
* recorded = "1970-01-01T00:00:00.000+02:00" // Replaced by Touchstone CurrentDateTime function
* outcome = $Hl7AuditOutcomeTypes#0 "Success"

* id = "C1EUAToEdsFixture"

* agent[ehmiSender].name = "Aarhus Kommune - Sundhed og Omsorg"
* agent[ehmiSender].requestor = true
* agent[ehmiSender].type.coding = $EhmiDeliveryStatusParticipationRoleType#ehmiSender "Sender"
// TODO TELL OLE: The StructureDefinition in EDS should be changed so it has to be an EER organization
* agent[ehmiSender].who.reference = "http://medcomehmi.eer.dk/Organization/937961000016000" // Does not exist, is just a random reference
* agent[ehmiSender].who.display = "Aarhus Kommune"
* agent[ehmiSender].who.identifier.value = "937961000016000"
* agent[ehmiSender].extension[GLNId][gln].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiSender].extension[GLNId][gln].valueIdentifier.value = "GLN-1234"

* agent[ehmiReceiver].name = "Lægerne Stjernepladsen I/S"
* agent[ehmiReceiver].requestor = false
* agent[ehmiReceiver].type.coding = $EhmiDeliveryStatusParticipationRoleType#ehmiReceiver "Receiver"
// TODO TELL OLE: The StructureDefinition in EDS should be changed so it has to be an EER organization
* agent[ehmiReceiver].who.reference = "http://medcomehmi.eer.dk/Organization/698141000016008" // Does not exist, is just a random reference
* agent[ehmiReceiver].who.display = "Lægerne Stjernepladsen I/S"
* agent[ehmiReceiver].who.identifier.value = "698141000016008"
* agent[ehmiReceiver].extension[GLNId][gln].valueIdentifier.type = $EhmiDeliveryStatusAgentWhoIdentifierTypes#GLN 
* agent[ehmiReceiver].extension[GLNId][gln].valueIdentifier.value = "GLN-12345"

* source.observer = Reference(Device/s-01-EUA-Sender)
* source.type.code = $EhmiDeliveryStatusSourceType#EUA
* source.type.system = $EhmiDeliveryStatusSourceType

// TODO TELL OLE: The StructureDefinition in EDS should be changed so it has to be a patient CPR or something?
* entity[ehmiPatient].what.identifier.value = "PAT1234567890"

* entity[ehmiMessage].detail[ehmiMessageType].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageType
* entity[ehmiMessage].detail[ehmiMessageType].valueString = "HomeCareObservation"
* entity[ehmiMessage].detail[ehmiMessageVersion].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageVersion
* entity[ehmiMessage].detail[ehmiMessageVersion].valueString = "1.1"

// TODO TELL OLE: The StructureDefinition in EDS does not require this to be set, but does require atleast three entity... I'm guessing it's an oversight that this is not required
* entity[ehmiMessageEnvelope].type = $EhmiDeliveryStatusEntityType#ehmiMessageEnvelope "Message Envelope"
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].type = $EhmiDeliveryStatusEntityDetailType#ehmiMessageEnvelopeType
* entity[ehmiMessageEnvelope].detail[ehmiMessageEnvelopeType].valueString = "FHIR Bundle"