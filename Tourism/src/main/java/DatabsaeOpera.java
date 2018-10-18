import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.datasource.pooled.PooledDataSource;

public class DatabsaeOpera {

	public static void main(String[] args) throws SQLException {
		DataSource dataSource = new PooledDataSource("com.mysql.jdbc.Driver", "192.168.8.8", 
				"test", "test");
		Connection connection = dataSource.getConnection();
		String sql = "select * from server";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		connection.close();
	}

}
