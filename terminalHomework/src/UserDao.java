
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDao {	
	 public int add(User user) {
	        Connection conn = ConnectionManager.getConnection();
	        PreparedStatement ps = null;
	        String sql = "insert into clients values(?,?,password(?),?,0,?)";
	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, user.getIDNumber());
	            ps.setString(2, user.getUsername());
	            ps.setString(3, user.getPasswd());
	            ps.setString(4, user.getEmail());
	            ps.setObject(5, user.getDate());
	            ps.execute();
	            return 1;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return 0;
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	 
	 public void update(String IDNumber) {
	        Connection conn = ConnectionManager.getConnection();
	        PreparedStatement ps = null;
	        String sql = "update clients set flag=1 where IDNumber=?";
	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, IDNumber);
	            ps.execute();
	        } catch (SQLException var14) {
	            var14.printStackTrace();
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	            } catch (SQLException var13) {
	                var13.printStackTrace();
	            }

	        }

	    }
	 public void delete(String IDNumber) {
	        Connection conn = ConnectionManager.getConnection();
	        PreparedStatement ps = null;
	        String sql = "delete from clients where IDNumber=?";

	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, IDNumber);
	            ps.execute();
	        } catch (SQLException var14) {
	            var14.printStackTrace();
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	            } catch (SQLException var13) {
	                var13.printStackTrace();
	            }

	        }

	    }
	 
	 
	 public boolean login(String IDNumber, String password) {
	        Connection conn = ConnectionManager.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        String sql = "select * from clients where IDNumber=? and password=?";

	        boolean var8;
	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, IDNumber);
	            ps.setString(2, password);
	            rs = ps.executeQuery();
	            if (!rs.next()) {
	                return false;
	            }

	            int flag = rs.getInt(5);
	            if (flag != 1) {
	                var8 = false;
	                return var8;
	            }

	            var8 = true;
	        } catch (SQLException var20) {
	            var20.printStackTrace();
	            return false;
	        } finally {
	            try {
	                conn.close();
	                ps.close();
	                rs.close();
	            } catch (SQLException var19) {
	                var19.printStackTrace();
	            }

	        }

	        return var8;
	    }

	 public Date select(String IDNumber) {
	        Connection conn = ConnectionManager.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        String sql = "select date from clients where IDNumber=?";

	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, IDNumber);
	            rs = ps.executeQuery();
	           // System.out.println("------------");
	            if (rs.next()) {
	                return rs.getDate(1);
	            }
	        } catch (SQLException var7) {
	            var7.printStackTrace();
	        }

	        return null;
	    }
	}
	 
	 
	 
