package contractorcrm.dao;

import contractorcrm.model.Customer;

public interface CustomerDAO {

	void insertNewCustomer(Customer customer);
	Customer updateCustomerByCustomerId(int customerId);
}
