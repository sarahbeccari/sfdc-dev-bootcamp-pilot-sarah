trigger Day6AssignmentTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	for (Account so : Trigger.new) {
		//friends remind friends to bulkify
	}

}