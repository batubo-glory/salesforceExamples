@isTest
public class TestDataFactory {

    public static List<Account> createAccounts(Integer n, integer empNum, String name) {
        List<Account> newAccounts = new List<Account>();
        for(Integer i = 0; i < n; i++) {
            Account a = new Account();
            a.Name = name+i;
            a.NumberOfEmployees = empNum;
            newAccounts.add(a);
            system.debug(a);
        }
        return newAccounts;
    }

    public static List<Lead> createLead(Integer n, string name) {
        list<Lead> newLeads = new List<Lead>();
        for(Integer i = 0; i < n; i++) {
            Lead l = new Lead();
            l.company = name+i;
            l.lastname = name+i;
            l.status = 'New';
            l.state = 'CA';
            l.description = name+i;
            newLeads.add(l);
        }
        return newLeads;
    } 

    public static List<Opportunity> createOpportunity(Integer n, date testDate, string name) {
        list<Opportunity> newOpps = new List<Opportunity>();
        for(Integer i = 0; i < n; i++) {
            Opportunity o = new Opportunity();
            o.name = name+i;
            o.stageName = 'New';
            o.closedate = testDate;
            newOpps.add(o);
        }
        return newOpps;
    }
}