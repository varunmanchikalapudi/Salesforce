public with sharing class myHelloWorld {
	public static void addHelloWorld(Account[] accs)
	{
		for(Account a: accs)
		{
			if(a.Description != 'Hello')
			{
				a.Description = 'Hello';
			}
		}
	}
}