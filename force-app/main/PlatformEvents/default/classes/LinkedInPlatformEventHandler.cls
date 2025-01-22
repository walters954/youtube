public with sharing class LinkedInPlatformEventHandler {
	public static void publishLinkedInPostPlatformEvent() {
		LinkedIn_Post__e post = new LinkedIn_Post__e();

		post.Author__c = 'Warren Buffet';
		post.Post__c = 'This is a test post';
		post.Post_Date__c = DateTime.now();

		EventBus.publish(post);
	}

	public static void createCaseFromLinkedInPost(List<LinkedIn_Post__e> posts) {
		System.debug('Creating case from LinkedIn post');
		List<Case> cases = new List<Case>();
		for (LinkedIn_Post__e post : posts) {
			Case c = new Case();
			c.Subject = post.Author__c;
			c.Description = post.Post__c;
			c.Status = 'New';
			c.Origin = 'Web';
			c.Priority = 'Medium';
			c.Type = 'Social Media';
			cases.add(c);
		}
		insert cases;
	}
}
