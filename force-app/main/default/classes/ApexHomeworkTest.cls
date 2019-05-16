@isTest
private class ApexHomeworkTest {

    @TestSetup
    static void makeData() {
        Date testCloseDate = Date.NewInstance(2011,1,1);
        List<Account> newAccounts = TestDataFactory.createAccounts(10, 500, 'testSmallAccount');
        newAccounts.addAll(TestDataFactory.createAccounts(10, 1500, 'testMediumAccount'));
        newAccounts.addAll(TestDataFactory.createAccounts(10, 15000, 'testLargeAccount'));
        List<Lead> newLeads = TestDataFactory.createLead(10, 'testLead');
        List<Opportunity> newOpps = TestDataFactory.createOpportunity(10, testCloseDate, 'testOpp');

        insert newAccounts;
        insert newLeads;
        insert newOpps;   
    }

    @isTest
    public Static Void runAsExample() {
        //We set up the user
        String uName = 'user' + Datetime.now().getTime() + '@harveyville.com';
        Profile p = [SELECT id 
                    FROM Profile
                    WHERE name='Standard User'];
        User u = new User(alias = 'testUser', email='testuser@harveyville.com',
                          emailencodingkey='UTF-8', lastname = 'Test', languagelocalekey='en_us',
                          timezonesidkey='america/new_york', localeSidKey='en_us', 
                          profileId=p.id, username=uName);

        System.RunAs(u) {
            System.debug(UserInfo.getUserName());
            System.debug(UserInfo.getProfileId());
            System.debug('We are running as if the above user.');
        }
    }

    @isTest
    public static void testFibonacci() {
        Integer fibResult1 = ApexHomework.nFibonacci(10);
        Integer fibResult2 = ApexHomework.nFibonacci(1);
        Integer fibResult3 = ApexHomework.nFibonacci(2);
        Integer fibResult4 = ApexHomework.nFibonacci(0);
        /* We test the above values to be accurate. */
        system.assertEquals(55, fibResult1);
        system.assertEquals(1, fibResult2);
        system.assertEquals(1, fibResult3);
        system.assertEquals(0, fibResult4);
    }

    @isTest
    public static void  testSortArray() {
        List<Integer> expectedResult1 = new List<Integer>{1,2,3,4,5};
        List<Integer> expectedResult2 = new List<Integer>{1,1,2,3,4,5};
        List<Integer> expectedResult3 = new List<Integer>{1,1,2,3,4,11};
        List<Integer> expectedResult4 = new List<Integer>{1,3,3,3,5};
        List<Integer> testData1 = new List<Integer>{5,4,3,2,1};
        List<Integer> testData2 = new List<Integer>{2,4,5,1,3,1};
        List<Integer> testData3 = new List<Integer>{11,2,3,4,1,1};
        List<Integer> testData4 = new List<Integer>{3,5,3,3,1};
        List<Integer> sortResult1 = ApexHomework.sortArray(testData1);
        List<Integer> sortResult2 = ApexHomework.sortArray(testData2);
        List<Integer> sortResult3 = ApexHomework.sortArray(testData3);
        List<Integer> sortResult4 = ApexHomework.sortArray(testData4);
        //Check values
        system.assertEquals(expectedResult1, sortResult1);
        system.assertEquals(expectedResult2, sortResult2);
        system.assertEquals(expectedResult3, sortResult3);
        system.assertEquals(expectedResult4, sortResult4); 
    }
    
    @isTest
    public static void testFactorial() {
        Integer result1 = ApexHomework.nFactorial(3);
        Integer result2 = ApexHomework.nFactorial(0);
        Integer result3 = ApexHomework.nFactorial(1);

        System.assertEquals(6, result1);
        System.assertEquals(1, result2);
        System.assertEquals(1, result3);
    }

    @isTest
    public static void testRotateLeft() {
        List<Integer> expectedResult = new LIst<Integer>{4,5,1,2,3};
        List<Integer> testData = new List<Integer>{1,2,3,4,5};
        List<Integer> result = ApexHomework.rotateLeftNTimes(testData, 3);

        System.assertEquals(expectedResult, result);
    }

    @isTest
    public static void testBracketsAreBalanced() {
        Boolean resultPositive = ApexHomework.bracketsAreBalanced('( { [ ] } )');
        
        system.assertEquals(true, resultPositive);
    }

    @isTest
    public static void testAccountSize() {
        ApexHomework.updateAccountSize();
        Account testSmallAccount = [SELECT name, size__c FROM Account WHERE name LIKE 'testSmallAccount%' LIMIT 1];
        Account testMediumAccount = [SELECT name, size__c FROM Account WHERE name LIKE 'testMediumAccount%' LIMIT 1];
        Account testLargeAccount = [SELECT name, size__c FROM Account WHERE name LIKE 'testLargeAccount%'LIMIT 1];


        System.assertEquals('small', testSmallAccount.size__c);
        System.assertEquals('medium', testMediumAccount.size__c);
        System.assertEquals('large', testLargeAccount.size__c);

    }

    @isTest
    public static void testCALeads() {
        ApexHomework.updateCALeads();
        Lead testLead = [SELECT lastname, status FROM Lead WHERE lastname LIKE 'testLead%' LIMIT 1];

        system.assertEquals('Closed - Not Converted', testLead.status);

    }

    @isTest
    public static void testPastDueOpps() {
        ApexHomework.closePastDueOpportunities();
        Opportunity testOpp = [SELECT name, stageName FROM Opportunity WHERE name LIKE 'testOpp%' LIMIT 1];

        System.assertEquals('Closed Lost', testOpp.stageName);

    }
}