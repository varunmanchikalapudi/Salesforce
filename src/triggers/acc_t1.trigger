trigger acc_t1 on Account (before insert,before update) {
    for(Account acc : Trigger.new){
        if(acc.Industry == 'Education')
        acc.addError('We are not working with Education orgs');
        }
    

}