import java.time.LocalDate;
import java.util.Date;

public class Group {
	byte id;
	String groupName;
	Account creator;
	LocalDate createDate;
	Account[] accounts;
}
