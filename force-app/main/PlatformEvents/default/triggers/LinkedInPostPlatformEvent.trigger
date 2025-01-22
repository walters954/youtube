trigger LinkedInPostPlatformEvent on LinkedIn_Post__e(after insert) {
	System.debug('LinkedIn Post Platform Event Triggered');

	LinkedInPlatformEventHandler.createCaseFromLinkedInPost(Trigger.new);

}
