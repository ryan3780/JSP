package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class sqlSessionFactory {
	
		private SqlSessionFactory sqlSessionFactory;
		
		public SqlSessionFactory getSession() {
			try {
				String path = "mybatisconfig.xml";
				Reader reader = Resources.getResourceAsReader(path);
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return sqlSessionFactory;
		
	}
}
