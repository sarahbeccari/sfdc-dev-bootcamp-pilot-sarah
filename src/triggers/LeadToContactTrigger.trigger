trigger LeadToContactTrigger on Lead (before insert) {

    if(Trigger.isBefore && Trigger.isInsert) {
        LeadToContactHelper.handleBeforeInsert(Trigger.new);
    }


}

