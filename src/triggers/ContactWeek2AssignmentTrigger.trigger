trigger ContactWeek2AssignmentTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

	if(Trigger.isInsert && Trigger.isAfter){

		Week2AssignmentTriggerHelper.calculateChangesOnInsert(Trigger.new);


	}

	if(Trigger.isAfter && Trigger.isDelete){

		Week2AssignmentTriggerHelper.calculateChangesOnDelete(Trigger.old);
	}

	if(Trigger.isUpdate && Trigger.isAfter){

		Week2AssignmentTriggerHelper.calculateChangesOnUpdate(Trigger.new);
	}

}