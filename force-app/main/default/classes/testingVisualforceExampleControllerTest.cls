@isTest
public class testingVisualforceExampleControllerTest {

    @isTest
    public static void testController() {
        pageReference pageTest = page.success;
        test.setCurrentPage(pageTest);
        
        testingVisualforceExampleController controller = new testingVisualforceExampleController();
        controller.lastName = 'Test';
        String expectedPage = controller.save().getURL();
        
        String qp = ApexPages.currentPage().getParameters().get('qp');
        
        system.assertEquals('/apex/success', expectedPage);
        //system.assertEquals('Mr. Ed', qp);
        Contact newContact = [SELECT lastname FROM Contact WHERE lastname = 'Test' LIMIT 1];
        system.assertNotEquals(null, newContact);
    }
}