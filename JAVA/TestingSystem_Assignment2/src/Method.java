import java.time.LocalDate;
import java.util.Scanner;

public class Method {

	public static void main(String[] args) {
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


		Group[]groups = {group1,group2,group3};
		Account[] accounts = { account1, account2, account3 };
	
//Question 1: Tạo method để in ra các số chẵn nhỏ hơn 10
//		taosochan();
//		songuyenduong();
//		printAccount(accounts);
		taoAccount();
		createDepartment();
	}

//public static void taosochan() {
//	
//	for (int i = 2; i < 10; i=i+2) {
//		
//		System.out.println(i);
//	}
//
//}}	
	
//	Question 3: Tạo method để in ra các số nguyên dương nhỏ hơn 10  	
//	public static void songuyenduong() {
//		
//		for (int i = 1; i < 10; i++) {
//			System.out.println(i);
//			
//		}
//Question 2: Tạo method để in thông tin các account 	
	 
//	public static void printAccount(Account[] accounts ) {
//	for (int i = 0; i < accounts.length; i++) {
//		System.out.println("thông tin của account thứ:"+(i+1));
//		System.out.println("id:"+accounts[i].id);
//		System.out.println("name:"+accounts[i].email);
//		System.out.println( "phòng ban:"+accounts[i].department.departmentName);
//		System.out.println("position:"+accounts[i].position.positioName);
//		System.out.println("nhóm:");
//		for (int j = 0; j < groups.length; j++) {
//			System.out.println(groups[j].groupName);
//		}
		
//	}	 
	
	//method tạo account//
	public static void taoAccount() {
		
		Scanner scann = new Scanner(System.in);
		Scanner scannn = new Scanner(System.in);
		Scanner scannnn = new Scanner(System.in);


		System.out.print("mời bạn nhập vào id :");
		int id = scann.nextInt();
		System.out.println("id bạn vừa nhập là :"+id);
		System.out.print("mời bạn nhập vào tên ");
		String fullname = scannn.nextLine();
		System.out.println("tên bạn vừa nhập là :"+fullname);
		System.out.print("mời bạn nhập vào email");
		String email = scannnn.nextLine();
		System.out.println("email bạn vừa nhập là "+email);
		System.out.println("bạn đã tạo tài khoản tành công");
		};
		
		
		
		
		public static void createDepartment() {
			Scanner scan = new Scanner(System.in);
			Scanner scan1 = new Scanner(System.in);
			System.out.print("mời bạn nhập vào id:");
			int id = scan.nextInt();
			System.out.println("bạn vừa nhập id:"+id+"\n");
			System.out.print("mời bạn nhập tên phòng ban:");
			String deparname = scan1.nextLine();
			System.out.println("phòng ban bạn vừa nhập là:" +deparname);
			
			
		}
	}
	
	
	
	
	
	
	
	
	
	
		
			
		
	
	
	
	


