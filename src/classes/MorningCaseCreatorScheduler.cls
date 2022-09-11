/**
 * Created by Danylo on 11.09.2022.
 */

global class MorningCaseCreatorScheduler implements Schedulable{

    global void execute(SchedulableContext param1) {

        DateTime dateNow = Datetime.now();
        String formatDate = dateNow.format('dd/mm/yyyy');
        insert new Case(Subject = 'Morning Case - '+ formatDate);

    }

//    MorningCaseCreatorScheduler caseCreatorScheduler = new MorningCaseCreatorScheduler();
//    String sch = '0 0 7 1/1 * ? *';
//    String caseId = System.schedule('Morning Case', sch, caseCreatorScheduler);
}