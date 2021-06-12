package contractorcrm.dao;

import java.util.List;

import contractorcrm.model.Customer;
import contractorcrm.model.Project;

public interface ProjectDAO {
	
	List<Project> listAllProjects();
	List<Project> listAllActiveProjects();
	List<Project> listAllProjectsByCustomer(Customer customer);
	Project findProjectByProjectId(int projectId);
	Project updateProjectByProjectId(int projectId);
	
}
