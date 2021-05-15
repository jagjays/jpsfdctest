public with sharing class ClsSSIPViewer {
    //Methods include to retrieve the Rules
    @AuraEnabled(cacheable=true)
   public static List<SSIP_Rule__c> getSSIPRules(String recordId) {
       return [SELECT Id, Name, Effective_Payor__c, SSIP_Payor__c, Authorization_Start_Date__c, Benefit__c, Benefit__r.name, Count_Of_Open_Schedules__c, CurrencyIsoCode, Product_Name__c, Price_Book__c, Price_Book__r.Name, Unit_Price__c, Quantity__c, Rule_Start_Date__c, Rule_Re_schedule_Date__c, Shipping_Method__c, Frequency_In_Days__c FROM SSIP_Rule__c Where First_Order__c = :recordId Order by Product_Name__c Desc];
   }
   //Methods include to retrieve the Schedules specifc to an Order
   @AuraEnabled
   public static List<SSIP_Schedule__c> getSSIPSchedules(String ssipRuleId){
       return [Select Id, Name, Quantity__c, Product_Name__c, Schedule_Date__c,Rescheduled_Shipment_Date__c, Status__c, Supply_Start_Date__c, Supply_End_Date__c, Order__c, Order__r.OrderNumber FROM SSIP_Schedule__c where SSIP_Rule__c=:ssipRuleId];
        
   }  
}
