import java.time.LocalDate;
import java.time.LocalTime;

public class Exercise1 {

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
		Department department1 = new Department();
		department1.departmentId = 1;
		department1.departmentName = "sale";

		Department department2 = new Department();
		department2.departmentId = 2;
		department2.departmentName = "waitingroom";

		Department department3 = new Department();
		department3.departmentId = 3;
		department3.departmentName = "training";

		Department department4 = new Department();
		department4.departmentId = 4;
		department4.departmentName = "waitingroom";

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
		group3.id = 3;
		group3.groupName = "groupC";
		group3.createDate = LocalDate.of(2020, 04, 21);

		// insert account//

		Account account1 = new Account();
		account1.id = 1;
		account1.email = "hien@gmail.com";
		account1.userName = "hi";
		account1.fullName = "hiền hồ";
		account1.department = department4;
		account1.position = position2;
		account1.createDate = LocalDate.of(2020, 04, 02);
		Group[] groupofaccount1 = { group1, group3 };
		account1.groups = groupofaccount1;

		Account account2 = new Account();
		account2.id = 2;
		account2.email = "mai@gmail.com";
		account2.userName = "maimai";
		account2.fullName = "mai nguyen";
		account1.department = department3;
		account2.department = department1;
		account2.position = position1;
		account2.createDate = LocalDate.of(2020, 04, 21);
		Group[] groupofaccount2 = { group1, group2 };
		account2.groups = groupofaccount2;

		Account account3 = new Account();
		account3.id = 3;
		account3.email = "ngoc@gmail.com";
		account3.userName = "maingoc";
		account3.department = department1;
		account3.fullName = "ngoc nguyen";
		account3.position = position1;
		account3.createDate = LocalDate.of(2020, 04, 21);
		Group[] groupofaccount3 = { group3, group2 };
		account3.groups = groupofaccount3;

		Account[] accountofgroup1 = { account1, account2 };
		Account[] accountofgroup2 = { account2, account3 };
		Account[] accountofgroup3 = { account1, account3 };

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

		// vòng lặp while
		// question10
		Account[] accounts = { account1, account2, account3 };
//		int i =0;
//		while(i<accounts.length) {
//			System.out.println("thông tin account thứ:"+(i+1));
//			System.out.println("email:"+accounts[i].email);
//			System.out.println("fullname:"+accounts[i].fullName);
//			System.out.println("phòng ban:"+accounts[i].department.departmentName);
//			System.out.println("\n");
//			
//		i++;
//			}

		// question11
//		Department[] department = {department1,department2,department3};
//		int x =0;
//		while (x<department.length) {
//			System.out.println("thông tin department thứ:"+(x+1));
//			System.out.println( "id:"+department[1].departmentId);
//			System.out.println("name:"+department[2].departmentName);
//			System.out.println("\n");
//			x++;
//			
//		}
		// Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như
		// Question 10
		// Department[] department = {department1,department2,department3};
//		 int i = 0;
//		 while(i<2) {
//			 System.out.println("thông tin của phòng ban thứ:"+(i+1));
//			 System.out.println("id:"+department[i].departmentId);
//			 System.out.println("name:"+department[i].departmentName);
//			 System.out.println( "\n");
//			 i++;
//			 
//		 }
		// Question 13: in ra thông tin tất cả các account ngoại trừ account thứ 2
		Group[] groupss = { group1, group2, group3 };
//		int x = 0;
//		while(x <accounts.length) {
//			if(accounts[x].id !=2) {
//				System.out.println("thông tin của account thứ:"+ (x+1));
//				System.out.println("id"+ accounts[x].email);
//				System.out.println("name:"+accounts[x].fullName);
//				System.out.println("useName:"+accounts[x].userName);
//				System.out.println("phòng ban:"+accounts[x].department.departmentName);
//				System.out.println("\n");
//				
//					
//				}
//				
//					
//				x++;}

		// in ra thông tin tất cả các account có id < 4
//				int c = 0;
//				while (c < accounts.length) {
//				if (accounts[c].id < 4) {
//				System.out.println("thông tin account thứ:" + (c + 1));
//				System.out.println("id:" + accounts[c].id);
//				System.out.println("name:" + accounts[c].userName);
//				System.out.println("nhóm:");
//				for (Group group : accounts[c].groups) {
//				System.out.println(group.groupName);
//				for (Group group4 : groupofaccount1) {
//
//				}
//
//				}
//				}
//			System.out.println("\n");
//			c++;
//				}

		// in ra các số chẵn nhỏ hơn hoặc bằng 20
//				int b =0;
//				while(b<=20) {
//					if(b % 2==0) {
//						System.out.println(b);
//					}
//					
//				b++;}
//				

	}
}
