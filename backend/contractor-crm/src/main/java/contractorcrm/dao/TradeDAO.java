package contractorcrm.dao;

import contractorcrm.model.Trade;

public interface TradeDAO {

	int insertNewTrade(Trade trade);
	boolean checkIfTradeExistsByName(Trade trade);
}
