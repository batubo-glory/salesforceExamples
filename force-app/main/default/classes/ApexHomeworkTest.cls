@isTest
private class ApexHomeworkTest {

    @TestSetup
    static void makeData() {
        Date testCloseDate = Date.NewInstance(2011,1,1);
        Account newAccount = new Account(name='Test', numberOfEmployees=3);
        Lead newLead = new Lead(State='CA', Description='Looking Good Billy Ray!', Status='New', lastname='Test', company='Test');
        Opportunity newOpp = new Opportunity(name='Test', CloseDate=testCloseDate, stageName='New');

        insert newAccount;
        insert newLead;
        insert newOpp;
        
    }

    @isTest
    public static void testFibonacci() {
        Integer fibResult = ApexHomework.nFibonacci(10);

        system.assertEquals(55, fibResult);
    }

    @isTest
    public static void  testSortArray() {
        List<Integer> expectedResult = new List<Integer>{1,2,3,4,5};
        List<Integer> testData = new List<Integer>{5,4,3,2,1};
        List<Integer> sortResult = ApexHomework.sortArray(testData);

        system.assertEquals(expectedResult, sortResult); 
    }
    
    @isTest
    public static void testFactorial() {
        Integer result = ApexHomework.nFactorial(3);

        System.assertEquals(6, result);
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
        Account testAccount = [SELECT name, size__c FROM Account WHERE name = 'Test'];

        System.assertEquals('Small', testAccount.size__c);

    }

    @isTest
    public static void testCALeads() {
        ApexHomework.updateCALeads();
        Lead testLead = [SELECT lastname, status FROM Lead WHERE lastname = 'Test'];

        system.assertEquals('Closed - Not Converted', testLead.status);

    }

    @isTest
    public static void testPastDueOpps() {
        ApexHomework.closePastDueOpportunities();
        Opportunity testOpp = [SELECT name, stageName FROM Opportunity WHERE name = 'Test'];

        System.assertEquals('Closed Lost', testOpp.stageName);

    }
}