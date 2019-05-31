public with sharing class ApexHomework {
  

        public static Integer nFactorial( Integer n) {
            
        if (n == 0 || n == 1) //factorial 0 and 1 are equal to 1
            return 1;
        else
            return (n * nFactorial(n - 1)); 
        
        } 


        public static Integer nFibonacci( Integer n ){

        if (n==0){
            system.debug(n);
            return n;
        } else {

         integer fCount = n;
         integer[] num = new integer[fCount];
         num[0] = 1;
         num[1] = 1;

         for(integer i=2; i < fCount; i++){
             num[i] = num[i-1] + num[i-2];
         }
 
         for(integer i=0; i< fCount; i++){
                 System.debug(num[i] + ' ');
         }
 		return num[n-1];
        }

        }
    
    public static List<Integer> sortArray(List<Integer> intList){

        for(Integer i = 0 ; i < intList.size() ; i ++){
            
                for(integer j = i+1 ; j <= intList.size() -1 ; j ++ ){
                integer x = 0 ;
                
                if(intList[i] >  intList[j]){
                                                x = intList[i]  ;
                                                intList[i] = intList[j]  ;
                                                intList[j]  = x;
                                                system.debug(intList) ;
                                            }
                }           
        }

        return intlist;
    }
     public static void updateAccountSize() {
        List<Account> accountList = [SELECT  Size__c, NumberOfEmployees FROM Account];
        for (Account emacc1 : accountList) {
            if (emacc1.NumberOfEmployees < 1000){
                emacc1.size__c = 'small';
            }else if (emacc1.NumberOfEmployees > 10000){
                    emacc1.size__c = 'large';
            }else if ( emacc1.NumberOfEmployees !=NULL){
                emacc1.size__c = 'medium';
                } 
            
        }

        update accountList;
    }
    public static void updateCALeads( ) {

        	List<Lead> leadList = [SELECT  State, Status, Description FROM Lead WHERE State = 'ca'];

        	for (Lead lfields: leadList) {
                lfields.Status = 'closed not converted';
		lfields.Description = 'We are no longer doing business in California.';
                }

        update leadList;
    }
public static  List<Integer> rotateLeftNTimes(List<Integer> n, integer n2){
    return null;
}
public static boolean bracketsAreBalanced(string s){
    return null;
}
public static void closePastDueOpportunities(){}
}