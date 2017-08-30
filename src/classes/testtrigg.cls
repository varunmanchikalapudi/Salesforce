@istest
public class testtrigg {

    public testmethod static void  m1(){
        
        account ac = new account();
        ac.Name = 'raju';
        insert ac;  
        account a = [select id,name from account where id = :ac.Id];
   	 	system.assertEquals('sfdcraju', a.name);
    
    }
    
    
}