// Insert account and opportunity at the same time
//Part 1
String externalId = '123456';
Account acc = new Account(Name='Test Account', External_Id__c=externalId);
insert acc;

Opportunity opp = new Opportunity(Name='Test Opportunity', AccountId=acc.Id, CloseDate=System.today(), StageName='Prospecting');
insert opp;

//Part 2
String externalId = String.valueOf(Math.round(Math.random() * 1000000));
Account acc = new Account(Name='Test Account ' + externalId, External_Id__c=externalId);
Account referenceAccount = new Account(External_Id__c=externalId);

Opportunity opp = new Opportunity(Name='Test Opportunity', Account = referenceAccount, CloseDate=System.today(), StageName='Prospecting');

insert new List<SObject>{acc, opp};

//Part 3 Custom Object
String cohortId = UUID.randomUUID().toString();
Cohort__c cohort = new Cohort__c(Name='Test Cohort ' + cohortId, Cohort_Id__c = cohortId);
Cohort__c referenceCohort = new Cohort__c(Cohort_Id__c =cohortId);
List<Student__c> students = new List<Student__c>();
for (Integer i = 0; i < 10; i++) {
    Student__c student = new Student__c(Name='Test Student ' + i, Cohort__r = referenceCohort);
    students.add(student);
}
List<SObject> records = new List<SObject>();
records.add(cohort);
records.addAll(students);
Database.SaveResult[] results = Database.insert(records);