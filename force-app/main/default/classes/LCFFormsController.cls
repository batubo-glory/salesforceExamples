public class LCFFormsController {

    @AuraEnabled
    public static void saveContact(Contact con) {
        system.debug(con);
        upsert con;
    }
}