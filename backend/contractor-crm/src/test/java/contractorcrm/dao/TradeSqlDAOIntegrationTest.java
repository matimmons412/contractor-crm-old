package contractorcrm.dao;

import java.sql.SQLException;

import org.junit.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import contractorcrm.model.Trade;

public class TradeSqlDAOIntegrationTest {

	private static SingleConnectionDataSource dataSource;
	private TradeDAO dao;
	private static String CHECK_TRADE_NAME = "Check Trade";
	private static String INSERT_TRADE_NAME = "Insert Trade";
	
	@BeforeClass
	public static void setUpDataSource() {
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/contractor_crm");
		dataSource.setUsername("postgres");
		dataSource.setPassword("postgres1");
		dataSource.setAutoCommit(false);
	}
	
	@AfterClass
	public static void closeDataSource() {
		dataSource.destroy();
	}
	
	@Before
	public void setup() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		dao = new TradeSqlDAO(jdbcTemplate);
		
	}
	
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}
	
	@Test
	public void insertNewTrade_inserts_one_row() {
		Trade testTradeObj = new Trade();
		testTradeObj.setTradeName(INSERT_TRADE_NAME);
		int numOfRowsInserted = dao.insertNewTrade(testTradeObj);
		Assert.assertEquals("Number of rows inserted should be 1", 1, numOfRowsInserted);
	}
	
	@Test
	public void checkIfTradeExistsByName_returns_false() {
		Trade testTradeObj = new Trade();
		testTradeObj.setTradeName(CHECK_TRADE_NAME);
		boolean tradeExists = dao.checkIfTradeExistsByName(testTradeObj);
		Assert.assertFalse(tradeExists);
	}
}
