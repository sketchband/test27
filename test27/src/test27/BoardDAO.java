package test27;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {

	private DBConnectionMgr pool;
	
	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void postProc(BoardBean bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int ref = 0;
		int pos = 1;
		int depth = 1;
		
		try {
			con = pool.getConnection();
			String sql = "select max(ref) from Board12";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next())
				ref = rs.getInt(1)+1;
			
			sql = "insert into Board12 values(?,?,?,?,0,?,?,?,?,?,now())";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, bean.getNum());
			stmt.setInt(2, ref);
			stmt.setInt(3, pos);
			stmt.setInt(4, depth);
			stmt.setString(5, bean.getSubject());
			stmt.setString(6, bean.getName());
			stmt.setString(7, bean.getPw());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9, bean.getContent());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
	}
	
}	
