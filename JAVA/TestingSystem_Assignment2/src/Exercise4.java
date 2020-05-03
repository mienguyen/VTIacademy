import java.time.LocalDate;
import java.util.Random;

public class Exercise4 {

	public static void main(String[] args) {
//Question 1: In ngẫu nhiên ra 1 số nguyên
		Random random = new Random();
		int x = random.nextInt();
		System.out.println(x);
//Question 2: In ngẫu nhiên ra 1 số thực 
		float a = random.nextInt();
		System.out.println(a);
		
//Question 3: Khai báo 1 array bao gồm các tên của các bạn trong lớp, 
//sau đó in ngẫu nhiên ra tên của 1 bạn 	
	String [] arr = new String[5];
	arr[0]= "hiền hồ";
	arr[1]="trấn thành";
	arr[2]="lan ngọc";
	arr[3]="ho ngọc hà";
	arr[4]="lan phương";
	

	System.out.println(arr[random.nextInt(5)]);
		
//Question 4: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995 
		int minday =(int)LocalDate.of(1995,07,24).toEpochDay();
		int maxday = (int) LocalDate.of(1995,12,20).toEpochDay();
		int d = minday +random.nextInt(maxday-minday);
		LocalDate randomday = LocalDate.ofEpochDay(d);
		System.out.println(randomday);
//		
		
//Question 5: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây 		
		
		int maxdayyy = (int)LocalDate.now().toEpochDay();
		int mindayyy =(int)LocalDate.now().plusYears(-1).toEpochDay();
		int b = random.nextInt(maxday-minday)+minday;
		LocalDate randomdayyy = LocalDate.ofEpochDay(b);
		System.out.println(randomdayyy);
		
//Question 6: Lấy ngẫu nhiên 1 ngày trong quá khứ 
		int maxxday =(int)LocalDate.now().toEpochDay();
		int g =random.nextInt(maxxday);
		LocalDate randomdayy = LocalDate.ofEpochDay(g);
		System.out.println(randomdayy);
//		
//Question 7: Lấy ngẫu nhiên 1 số có 3 chữ số 
		int c = random.nextInt(999-100+1)+100;
		System.out.println(c);
		
		
		
}

}
