trigger BeofreAccDescription on Account (before insert) {
    For(Account a : Trigger.new) {
        a.Description = 'New Description';
    }

}