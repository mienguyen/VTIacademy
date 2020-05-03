import java.text.SimpleDateFormat;import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

public class Exercise2 {

	public static void main(String[] args) {
//Question 1: Khai báo 1 số nguyên = 5 và sử dụng lệnh 
//System out printf để in ra số nguyên đó 
//		int i =5;
//		System.out.printf("%d",i);
//		System.out.println("\n");
		
//Question 2: Khai báo 1 số nguyên = 100 000 000 và 
//sử dụng lệnh System out printf để in ra số nguyên đó thành định dạng như sau: 100,000,000 		
//		int a = 100000000;
//		System.out.printf("%,d",a);
		
		
//Question 3: Khai báo 1 số thực = 5,567098 và sử dụng 
//lệnh System out printf để in ra số thực đó chỉ bao gồm 4 số đằng sau 
//		float b = 5.567098f;
//		System.out.printf("%.4f",b);
		
//Question 4: Khai báo Họ và tên của 1 học sinh và in ra họ và tên học 
//		sinh đó theo định dạng như sau: Họ và tên: "Nguyễn Văn A" thì
//		sẽ in ra trên console như sau:  Tên tôi là "Nguyễn Văn A" và tôi đang độc thân. 		
//		
		
//	String name = "Nguyễn Văn A"	;
//	System.out.printf("%s%s%s", "Tên tôi là ", name ," và tôi đang độc thân");
		
//Question 5: Lấy thời gian bây giờ và in ra theo định dạng sau: 24/04/2020 11h:16p:20s  
//		DateTimeFormatter time = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
//		LocalDateTime now = LocalDateTime.now();
//		System.out.println(time.format(now));
//		
//		String pattern = "dd/MM/yyyy HH:mm:ss";
//		SimpleDateFormat simpledateformat = new SimpleDateFormat(pattern);
//		String date = simpledateformat.format(new Date());
//		System.out.println(date);
//		
		
//Question 6: in ra thông tin account (như Question 8 phần FOREACH) theo định dạng table (giống trong Database) 		
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
		departmnet1.departmentId = 1;
		departmnet1.departmentName = "sale";

		Department departmnet2 = new Department();
		departmnet2.departmentId = 2;
		departmnet2.departmentName = "waitingroom";

		Department departmnet3 = new Department();
		departmnet3.departmentId = 3;
		departmnet3.departmentName = "training";

		Department departmnet4 = new Department();
		departmnet2.departmentId = 4;
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
		Group[] groupofaccount1 = { group1, group2 };
		account1.groups = groupofaccount1;

		
		
		

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
		Group[] groupofaccount3 = { group1, group3 };
		account3.groups = groupofaccount1;


		
		Account[] accounts = { account1, account2, account3 };
		
		
		System.out.printf("%5s","email" );
		System.out.printf("%35s","Fullname");
		System.out.printf("%40s%n", "Tên phòng ban"+"\n");
		for (int i = 0; i < accounts.length; i++) {
			System.out.printf("%15s",accounts[i].email);
			System.out.printf("%25s",accounts[i].fullName);
			System.out.printf("%35s",accounts[i].department.departmentName+"\n");
		}	
	}}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


