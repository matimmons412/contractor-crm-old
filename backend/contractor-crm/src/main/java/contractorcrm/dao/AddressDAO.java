package contractorcrm.dao;

import contractorcrm.model.Address;
import contractorcrm.model.Customer;
import contractorcrm.model.Project;
import contractorcrm.model.Subcontractor;

public interface AddressDAO {
	
	void insertNewAddress(Address address);
	Address getAddressByAddressId(int addressId);
	Customer updateAddressByCustomerId(int customerId);
	Project updateAddressByProjectId(int projectId);
	Subcontractor updateAddressBySubcontractorId(int subcontractorId);

}
