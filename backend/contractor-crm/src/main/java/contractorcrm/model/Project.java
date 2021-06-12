package contractorcrm.model;

import java.util.Date;

public class Project {
	
	private int projectId;
	private Date startDate;
	private Date estEndDate;
	private boolean jobComplete;
	private Date endDate;
	private Address address;
	
	public int getProjectId() {
		return projectId;
	}
	
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEstEndDate() {
		return estEndDate;
	}
	
	public void setEstEndDate(Date estEndDate) {
		this.estEndDate = estEndDate;
	}
	
	public boolean isJobComplete() {
		return jobComplete;
	}
	
	public void setJobComplete(boolean jobComplete) {
		this.jobComplete = jobComplete;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Address getAddress() {
		return address;
	}
	
	public void setAddress(Address address) {
		this.address = address;
	}
}
