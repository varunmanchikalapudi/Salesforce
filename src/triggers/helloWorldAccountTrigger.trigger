trigger helloWorldAccountTrigger on Account (before insert) {
	
	myHelloWorld.addHelloWorld(Trigger.new);
    
}