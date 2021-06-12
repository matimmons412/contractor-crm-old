package contractorcrm.dao;

import java.util.List;
import contractorcrm.model.Subcontractor;
import contractorcrm.model.Trade;

public interface SubcontractorDAO {

	List<Subcontractor> listAllSubcontractors();
	List<Subcontractor> listAllSubcontractorsByTrade(Trade trade);
	void insertNewSubcontractor(Subcontractor subcontractor, Trade trade);
	Subcontractor updateSubcontractorById(int subcontractorId);
	
}
