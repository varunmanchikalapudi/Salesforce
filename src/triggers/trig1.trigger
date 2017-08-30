trigger trig1 on Account (before insert) {
    
    account ac = trigger.new[0];
    
    ac.name = 'sfdc'+ ac.name;

}