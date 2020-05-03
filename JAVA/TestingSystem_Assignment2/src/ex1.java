
//		public class ex1 {


	/*
	 * Question 1: Kiểm tra account thứ 2 Nếu không có phòng ban (tức là department
	 * == null) thì sẽ in ra text "Nhân viên này chưa có phòng ban"
	 */



//	if (account2.department == null) 
//	{
//		System.out.println("nhân viên này chưa có phòng ban");
//	} else
//	{
//		System.out.println("Phòng ban của nhân viên này là: " + account2.department.departmentName);

//	}

	/*
	 * Question 2: Kiểm tra account thứ 2, Nếu không có group thì sẽ in ra text
	 * "Nhân viên này chưa có group"
	 * 
	 * Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text
	 * "Group của nhân viên này là Java Fresher, C# Fresher"
	 * 
	 * Nếu có mặt trong 3 Group thì sẽ in ra text
	 * "Nhân viên này là người quan trọng, tham gia nhiều group"
	 * 
	 * Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là người
	 * hóng chuyện, tham gia tất cả các group
	 */
//
//	if (account2.groups == null)
//	{
//		System.out.println(" nhân viên này chưa có group");
//	} else if (account2.groups.length == 1 || account2.groups.length == 2) 
//	{
//		for (Group group : groupofaccount2)
//	{
//			System.out.printf(group.groupName);
//		}
//	} else if (account2.groups.length == 3) 
//	{
//		System.out.println("nhân viên này là người quan trọng");
//	} else if (account2.groups.length == 4) 
//	{
//		System.out.println("nhân viên này là người hóng chuyện");
//	}System.out.println("\n");


//
//	// Question 3: Sử dụng toán tử ternary để làm Question 1
//			System.out.println(account2.department == null ? "nhân viên này chưa có phòng ban"
//			: "phòng ban của nhân viên này là:" + account2.department.departmentName);
	
	
//	/*question4:4: Sử dụng toán tử ternary để làm yêu cầu sau: Kiểm tra Position của account thứ 1 
//	Nếu Position = Dev thì in ra text "Đây là Developer" 
//	Nếu không phải thì in ra text "Người này không phải là Developer" */
//	
//	System.out.println(account1.position.positioName == PositionName.DEV? "đây là develpoer":"người này không phải dveloper");
//	System.out.println("\n");

	/*
	 * SWITCH CASE Question 5: Lấy ra số lượng account trong nhóm thứ 1 và in ra
	 * theo format sau: Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
	 * Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên" Nếu số lượng
	 * account = 3 thì in ra "Nhóm có ba thành viên" Còn lại in ra
	 * "Nhóm có nhiều thành viên"
	 */

//	switch(accountofgroup1.length) {
//		case 1:
//		System.out.println("nhóm có một thành viên");
//		break;
//		case 2 :
//		System.out.println("nhóm có hai thành viên");
//		for(Account account: accountofgroup1) {
//			System.out.println(account.fullName);
//		}
//		break;
//	
//		case 3 :
//		System.out.println("nhóm có ba thành viên");
//		for (Account accountss : accountofgroup1) {
//			System.out.println(accountss.fullName);
//		}
//		break;
//		default:
//		System.out.println("nhóm có nhiều thành viên");
//		break;
//		} 

	// Question 6: Sử dụng switch case để làm lại Question 2

//	switch (groupofaccount1.length) {
//	case 1:
//		System.out.println("nhân viên này chưa có group");
//		break;
//	case 2:
//		System.out.println("group của nhân viên này là ");
//		for (Group group : groupofaccount1) {
//			System.out.println(group.groupName);
//		}
//		break;
//	case 3:
//		System.out.println("nhân viên này là nhân viên quan trọng");
//		break;
//	default:
//		System.out.println("nhân viên hóng hớt");
//		break;
//
//		}

	// Question 7: Kiểm tra Position của account thứ 1 Nếu Position = Dev thì
	// in ra text "Đây là Developer" Nếu không phải thì in ra text "Người này không
	// phải là Developer"


//	switch (account1.position.positioName ) {
//	case DEV :
//		System.out.println("đây là developer");
//	break;
//	default :
//		System.out.println("Người này không phải là Developer");
//	break;
//	}
//	
//	FOREACH Question 8: in ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ 
//	 for (Account account : accountofgroup3) {
//		 System.out.println(account.email);
//		 System.out.println(account.fullName);
//		 System.out.println(account.department.departmentName);
//		 System.out.println("\n");			 
	// }

//	Question 9: in ra thông tin các phòng ban bao gồm: id và name 
//	Department[] depart = {department1,department2,department3,department4};
//	for (Department department :depart) {
//		System.out.println(department.departmentId);
//		System.out.println(department.departmentName);
//	System.out.println( "\n");
//	}
//	

	/*
	 * Question 10: in ra thông tin các account bao gồm: Email, FullName và tên
	 * phòng ban của họ theo định dạng như sau: Thông tin account thứ 1 là: Email:
	 * NguyenVanA@gmail.com Full name: Nguyễn Văn A Phòng ban: Sale
	 * 
	 * // Thông tin account thứ 2 là: Email: NguyenVanB@gmail.com Full name: Nguyễn
	 * Văn B Phòng ban: Marketting
	 */
//	Account[] accounts = { account1, account2, account3 };
//	for(int i=0; i < accounts.length;i++) {
//		System.out.println("thông tin của account thứ "+ (i+1));
//		System.out.println(accounts[i].email);
//		System.out.println(accounts[i].fullName);
//		System.out.println(accounts[i].department.departmentName);
//		System.out.println("\n");
//}
//

	//
	// Question 11: in ra thông tin các phòng ban bao gồm: id và name theo định dạng
	// sau: Thông tin department thứ 1 là: Id: 1 Name: Sale

	// Thông tin department thứ 2 là: Id: 2 Name: Marketing

	//Department[] depart = { department1, department2, department3, department4 };
//	for (int i = 0; i < depart.length; i++) {
//		System.out.println("thông tin department thứ" + (i + 1));
//		System.out.println("id:" + depart[i].departmentId);
//		System.out.println("name:" + depart[i].departmentName);
//		System.out.println("\n");
//
//	}

	// Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như
	// Question 10

//	for (int i = 0; i < 2; i++) {
//	System.out.println("thông tin của phòng ban thứ" + (i + 1));
//	System.out.println("id:" + depart[i].departmentId);
//	System.out.println("name"+depart[i].departmentName);
//	System.out.println("\n");
//	}	
//	

	// Question 13: in ra thông tin tất cả các account ngoại trừ account thứ 2
//		for(int i=0 ;i<accounts.length;i++) {
//		if (accounts[i].id !=2) {
//		System.out.println("thông tin của account thứ"+(i+1));
//		System.out.println("id:"+accounts[i].email);
//		System.out.println("name:"+accounts[i].fullName);
//		System.out.println("department:"+accounts[i].department.departmentName);
//		System.out.println("\n");
//	}
//	
//}

	// Question 14: in ra thông tin tất cả các account có id < 4

//for(int i=0 ;i<accounts.length;i++) {
//	if (accounts[i].id <4) {
//		System.out.println("thông tin của account thứ"+(i+1));
//		System.out.println("id:"+accounts[i].email);
//		System.out.println("name:"+accounts[i].fullName);
//		System.out.println("\n");
//	}
//	
//}	
//	

//	// Question 15: in ra các số chẵn nhỏ hơn hoặc bằng 20
//	for (int i = 0; i <= 20; i++) {
//
//		if (i % 2 == 0) {
//			System.out.println(i);
//
//	}
//	}

//}
