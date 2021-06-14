package contractorcrm.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import contractorcrm.model.Trade;

public class TradeSqlDAO implements TradeDAO {

	private JdbcTemplate jdbcTemplate;
	
	public TradeSqlDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertNewTrade(Trade trade) {
		String sqlInsertTrade = "INSERT INTO trade (trade_id. trade) VALUES (DEFAULT, ?)";
		return jdbcTemplate.update(sqlInsertTrade, trade.getTradeName());
	}

	@Override
	public boolean checkIfTradeExistsByName(Trade trade) {
		String sqlSelectTrade = "SELECT * FROM trade WHERE trade_name ILIKE %?%";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectTrade, trade.getTradeName());
		Trade returnedTrade = mapRowToTrade(results);
		if (returnedTrade.getTradeName() == trade.getTradeName()) {
			return true;
		}
		return false;
	}
	
	private Trade mapRowToTrade(SqlRowSet results) {
		Trade trade = new Trade();
		trade.setTradeId(results.getInt("trade_id"));
		trade.setTradeName(results.getString("trade_name"));
		return trade;
	}
}
