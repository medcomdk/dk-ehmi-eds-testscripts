RuleSet: IdTouchstoneVariable(id)
* id = "TouchstoneHelper-DS-CBS-{id}-CBE"

RuleSet: OverrideGeneratedFileNameHelper(filename)
* meta.tag[+].id = "TouchstoneHelperFileNameOverride"
* meta.tag[=].display = "{filename}"

RuleSet: TimestampTouchstoneCurrentDateTimeHelper(elementName)
* {elementName} = "1970-01-01T00:00:00.000+02:00" // Replaced by Touchstone CurrentDateTime function