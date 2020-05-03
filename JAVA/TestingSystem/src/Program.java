import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

public class Program {
	public static void main(String[] args) {

		// insert position//

		Position position1 = new Position();
		position1.positionId = 1;
		position1.positioName = PositionName.SCRUMMASTER;

		Position position2 = new Position();
		position2.positionId = 2;
		position2.positioName = PositionName.DEV;

		Position position3 = new Position();
		position3.positionId = 3;
		position3.positioName = PositionName.PM;

		Position position4 = new Position();
		position4.positionId = 4;
		position4.positioName = PositionName.TEST;

		// insert departmnet//
		Department departmnet1 = new Department();
		departmnet1.departmnetId = 1;
		departmnet1.departmentName = "sale";

		Department departmnet2 = new Department();
		departmnet2.departmnetId = 2;
		departmnet2.departmentName = "waitingroom";

		Department departmnet3 = new Department();
		departmnet3.departmnetId = 3;
		departmnet3.departmentName = "training";

		Department departmnet4 = new Department();
		departmnet2.departmnetId = 4;
		departmnet2.departmentName = "waitingroom";

		// insert group//
		Group group1 = new Group();
		group1.id = 1;
		group1.groupName = "groupA";
		group1.createDate = LocalDate.of(2020, 04, 21);

		Group group2 = new Group();
		group2.id = 2;
		group2.groupName = "groupB";
		group2.createDate = LocalDate.of(2020, 04, 21);

		Group group3 = new Group();
		group2.id = 3;
		group2.groupName = "groupC";
		group2.createDate = LocalDate.of(2020, 04, 21);

		// insert account//

		Account account1 = new Account();
		account1.id = 1;
		account1.email = "hien@gmail.com";
		account1.userName = "hi";
		account1.fullName = "hiền hồ";
		account1.department = departmnet3;
		account1.position = position2;
		account1.createDate = LocalDate.of(2020, 04, 02);

		Account account2 = new Account();
		account2.id = 2;
		account2.email = "mai@gmail.com";
		account2.userName = "maimai";
		account2.fullName = "mai nguyen";
		account2.department = departmnet1;
		account2.position = position1;
		account2.createDate = LocalDate.of(2020, 04, 21);
		Group[] groupofaccount2 = { group3, group2 };
		account2.groups = groupofaccount2;

		Account account3 = new Account();
		account3.id = 3;
		account3.email = "ngoc@gmail.com";
		account3.userName = "maingoc";
		account3.fullName = "ngoc nguyen";
		account3.department = departmnet3;
		account3.position = position1;
		account3.createDate = LocalDate.of(2020, 04, 21);

		Group[] groupofaccount3 = { group3, group2 };
		account2.groups = groupofaccount3;

		Group[] groupofaccount1 = { group1, group2 };
		account1.groups = groupofaccount1;

		Account[] accounts1 = { account3, account2 };
		group1.accounts = accounts1;

		Account[] accounts2 = { account1, account2 };
		group1.accounts = accounts2;

		// insert TypeQuestion//
		TypeQuestion type1 = new TypeQuestion();
		type1.typeId = 1;
		type1.typeName = EnumTypeName.ESSAY;

		TypeQuestion type2 = new TypeQuestion();
		type2.typeId = 2;
		type2.typeName = EnumTypeName.MULTIPLECHOICE;

		// insert categoryquestion//
		CategoryQuestion cate1 = new CategoryQuestion();
		cate1.categoryId = 1;
		cate1.categoryName = "Java";

		CategoryQuestion cate2 = new CategoryQuestion();
		cate2.categoryId = 2;
		cate2.categoryName = ".NET";

		// insert Question //

		Question question1 = new Question();
		question1.questionId = 1;
		question1.content = "content1";
		question1.CategoryQuestion = cate1;
		question1.TypeQuestion = type1;
		question1.creator = account1;
		question1.createDate = LocalDate.of(2020, 04, 20);

		Question question2 = new Question();
		question2.questionId = 2;
		question2.content = "content2";
		question2.CategoryQuestion = cate2;
		question2.TypeQuestion = type2;
		question2.creator = account3;
		question2.createDate = LocalDate.of(2020, 04, 20);

		Question question3 = new Question();
		question3.questionId = 1;
		question3.content = "content1";
		question3.CategoryQuestion = cate1;
		question3.TypeQuestion = type1;
		question3.creator = account1;
		question3.createDate = LocalDate.of(2020, 04, 20);

		// insert Answer//

		Answer answer2 = new Answer();
		answer2.answerId = 1;
		answer2.content = "abc";
		answer2.isCorrect = true;
		answer2.question = question2;

		Answer answer1 = new Answer();
		answer1.answerId = 2;
		answer1.content = "abcd";
		answer1.isCorrect = true;
		answer1.question = question1;

		Answer answer3 = new Answer();
		answer3.answerId = 3;
		answer3.content = "abcde";
		answer3.isCorrect = false;
		answer3.question = question3;

		// insert Exam //
		Exam exam1 = new Exam();
		exam1.examId = 1;
		exam1.code = "V012";
		exam1.title = "title1";
		exam1.categoryID = cate1;
		exam1.duration = LocalTime.of(0, 30);
		exam1.creatorId = account3;
		exam1.createDate = LocalDate.of(2020, 02, 02);

		Exam exam2 = new Exam();
		exam2.examId = 2;
		exam2.code = "V0123";
		exam2.title = "title2";
		exam2.categoryID = cate2;
		exam2.duration = LocalTime.of(1, 00);
		exam2.creatorId = account1;
		exam2.createDate = LocalDate.of(2020, 02, 02);

//		System.out.println("Thông tin position 1: ");
//
//		System.out.println("name: " + position1.positioName);
//		System.out.println("positionId: " + position1.positionId);
//		System.out.println("\n");
//
//		System.out.println("Thông tin department1: ");
//
//		System.out.println("name: " + departmnet1.departmentName);
//		System.out.println("positionId: " + departmnet1.departmnetId);
//		System.out.println("\n");
//
//		System.out.println("Thông tin group1: ");
//
//		System.out.println("name: " + group1.groupName);
//		System.out.println("positionId: " + group1.id);
//		System.out.println("\n");
//
//		System.out.println("Thông tin account1:");
//		System.out.println("accountid:" + account1.id);
//		System.out.println("accountName:" + account1.fullName);
//		System.out.println("username:" + account1.userName);
//		System.out.println("email:" + account1.email);
//		System.out.println("department:" + account1.department.departmentName);
//		System.out.println("position:" + account1.position.positioName);
//		System.out.println("createDate:" + account1.createDate);
//		System.out.println("groups:" + account1.groups);
//		System.out.println("\n");
//
//		System.out.println("Thông tin loại câu hỏi1:");
//		System.out.println("id:" + type1.typeId);
//		System.out.println("name:" + type1.typeName);
//		System.out.println("\n");
//
//		System.out.println("Thông tin category1");
//		System.out.println("id:" + cate1.categoryId);
//		System.out.println("name:" + cate1.categoryName);
//		System.out.println("\n");
//
//		System.out.println("Thông tin của câu hỏi 1");
//		System.out.println("id:" + question1.questionId);
//		System.out.println("name:" + question1.content);
//		System.out.println("categoryquestion:" + question1.CategoryQuestion.categoryName);
//		System.out.println("type:" + question1.TypeQuestion.typeName);
//		System.out.println("creator:" + question1.creator.fullName);
//		System.out.print("creatdate:" + question1.createDate);
//		System.out.println("\n");
//
//		System.out.println("Thông tin của answer1");
//		System.out.println("id:" + answer1.answerId);
//		System.out.println("name:" + answer1.content);
//		System.out.println("question:" + answer1.question.content);
//		System.out.println("isCorrect:" + answer1.isCorrect);
//		System.out.println("\n");
//
//		System.out.println("Thông tin của exam1");
//		System.out.println("id" + exam1.examId);
//		System.out.println("code:" + exam1.code);
//		System.out.println("title:" + exam1.title);
//		System.out.println("category:" + exam1.categoryID.categoryName);
//		System.out.println("creator:" + exam1.creatorId.fullName);
//		System.out.println("createdate:" + exam1.createDate);
//		System.out.println("duration:" + exam1.duration);
//		
//Question 6: in ra thông tin account (như Question 8 phần FOREACH) theo định dạng table (giống trong Database) 
		System.out.printf("%10s","email");
		System.out.printf("%25s","Fullname");
		System.out.printf("%35s%n", "Tên phòng ban");
		System.out.printf("%5s",account1.email);
		System.out.printf("%25s", account1.fullName);
		System.out.printf("%35s%n",account1.department.departmentName);
		System.out.printf("%5s",account2.email);
		System.out.printf("%25s", account2.fullName);
		System.out.printf("%35s%n",account2.department.departmentName);
		System.out.printf("%5s",account3.email);
		System.out.printf("%25s", account3.fullName);
		System.out.printf("%35s%n",account3.department.departmentName);
		
//Question 7: in ra danh sách các account đã join group vào ngày nào theo 
//		định dạng table Date sẽ được định dạng theo format như sau: 24/04/2020 11h:16p:20s 		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}

}
