package contractorcrm.model;

public class Subcontractor {
	
	private int subcontractorId;
	private String firstName;
	private String lastName;
	private Address address;
	private String phoneNumber;
	private String email;
	private String companyName;
	
	public int getSubcontractorId() {
		return subcontractorId;
	}
	public void setSubcontractorId(int subcontractorId) {
		this.subcontractorId = subcontractorId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	

}
