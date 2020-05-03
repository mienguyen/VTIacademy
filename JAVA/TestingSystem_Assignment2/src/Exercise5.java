import java.text.ParseException;

public class Exercise5 {

 
//question1: Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình 
//		Scanner scanner = new Scanner(System.in);
//		for (int i = 0; i < 3; i++) {
//
//			System.out.print("mời bạn nhập một số  :");
//			int a = scanner.nextInt();
//
//			System.out.println("input:" + a + "\n");
//
//		};

//Question 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình 	
//		for (int i = 0; i < 2; i++) {
//			
//		
//		System.out.print("mời bạn nhập vào số thực:");
//		float b = scanner.nextFloat();
//		System.out.println("input:"+b+"\n");
//		
//		};
//		

//Question 3: Viết lệnh cho phép người dùng nhập họ và tên 
//		System.out.print("họ và tên:");
//		String c = scanner.nextLine();
//		System.out.println("bạn vừa nhập:"+c);

//Question 4: Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ 
//		System.out.print("ngày sinh:");
//		String dateinput = scanner.nextLine();
//		String pattern = "dd/MM/yyyy";
//		DateTimeFormatter dateformat = DateTimeFormatter.ofPattern(pattern);
//		LocalDate date = LocalDate.parse(dateinput, dateformat);
//		System.out.println(date);

		/*
		 * Question 5: Viết lệnh cho phép người dùng tạo account (viết thành method) Đối
		 * với property Position Người dùng nhập vào 1 2 3 4 5 và vào chương trình sẽ
		 * chuyển thành Position.Dev, Position.Test, Position.ScrumMaster, Position.PM
		 */

//		Position position1 = new Position();
//		position1.positionId = 1;
//		position1.positioName = PositionName.SCRUMMASTER;
//
//		Position position2 = new Position();
//		position2.positionId = 2;
//		position2.positioName = PositionName.DEV;
//
//		Position position3 = new Position();
//		position3.positionId = 3;
//		position3.positioName = PositionName.PM;
//
//		Position position4 = new Position();
//		position4.positionId = 4;
//		position4.positioName = PositionName.TEST;

//		Register();

//Question 7: Nhập số chẵn từ console 

//	nhapsochan();
///*
		/*
		 * * Question 8: Viết chương trình thực hiện theo flow sau Bước 1: Chương trình
		 * in ra text "mời bạn nhập vào chức năng muốn sử dụng" Bước 2: Nếu người dùng
		 * nhập vào 1 thì sẽ thực hiện tạo account Nếu người dùng nhập vào 2 thì sẽ thực
		 * hiện chức năng tạo department Nếu người dùng nhập vào số khác thì in ra text
		 * "Mời bạn nhập lại" và quay trở lại bước 1
		 */

//		Scanner scan = new Scanner(System.in);
//		int input = 0;
//		while (!(input == 1 || input == 2)) {
//			System.out.println("Số 1 là tạo  Department ");
//			System.out.println("Số 2 tạo account");
//			System.out.println("mời bạn nhập vào chức năng muốn sử dụng");
//			input = scan.nextInt();
//			switch (input) {
//			case 1: {
//				Method.createDepartment();
//				System.out.println("Bạn đã tạo department thành công");
//				break;
//
//			}
//			case 2: {
//				Method.taoAccount();
//				break;
//			}
//			default:
//				System.out.println("mời bạn nhập lại");
//			}
//
//		}
//
//		}

//	public static void Register() {
//		System.out.println("mời bạn nhập vào một số :");
//		Scanner scanner = new Scanner(System.in);
//		switch (scanner.nextInt()) {
//		case 1:
//			System.out.println("Position:" + PositionName.DEV);
//			break;
//		case 2:
//			System.out.println("Position:" + PositionName.PM);
//			break;
//		case 3:
//			System.out.println("Positon:" + PositionName.SCRUMMASTER);
//			break;
//		case 4:
//			System.out.println("Position:"+ PositionName.TEST);
//		case 5:
//			System.out.println("không có position");
//			break;
//		}
//{
//	}

	// Question 6: Viết lệnh cho phép người dùng tạo department (viết thành method)

	// Question 7: Nhập số chẵn từ console
//	public static void nhapsochan() {
//		System.out.println("mời bạn nhập số chẵn:");
//		Scanner scann = new Scanner(System.in);
//		int d = scann.nextInt();
//		if (d % 2 == 0) {
//			System.out.println("số bạn vừa nhập là :" + d);
//
//		} else {
//			System.out.println("mời bạn nhập lại số chẵn :");
//			int e = scann.nextInt();
//			if (e % 2 == 0) {
//				System.out.println("số bạn vừa nhập là :" + e);
//			} else {
//				System.out.println("Không Được nhập");
//			}
//		}}




//}
