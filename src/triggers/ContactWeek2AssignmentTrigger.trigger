trigger ContactWeek2AssignmentTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	if(Trigger.isInsert && Trigger.isAfter){

		Week2AssignmentTriggerHelper.calculateChangesOnInsert(Trigger.new);


	}

	if(Trigger.isBefore && Trigger.isDelete){

		Week2AssignmentTriggerHelper.calculateChangesOnDelete(Trigger.new);
	}

}