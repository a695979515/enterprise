package com.enterprise.interceptor;

import java.lang.reflect.Field;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.springframework.util.ReflectionUtils;

/**
 * 拦截器
 * 为兼容一些数据库不支持区分大小写的sql语句     故把sql语句都换为小写
 */
@Intercepts({@Signature(type=Executor.class,method="query",args={MappedStatement.class,Object.class,RowBounds.class,ResultHandler.class})
,@Signature(type=Executor.class ,method="update",args={MappedStatement.class,Object.class})})
			
public class LowerCaseSqlInterceptor implements Interceptor{

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		String method = invocation.getMethod().getName();
		MappedStatement ms = (MappedStatement) invocation.getArgs()[0];
		SqlSource sqlSource = wrapperSqlSource(ms,ms.getSqlSource(),invocation.getArgs()[1],method);
		Field sqlSourceField = MappedStatement.class.getDeclaredField("sqlSource");
		ReflectionUtils.makeAccessible(sqlSourceField);
		ReflectionUtils.setField(sqlSourceField, ms, sqlSource);
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		if(target instanceof Executor){
			return Plugin.wrap(target, this);
		}else{
			return target;
		}
	}

	@Override
	public void setProperties(Properties properties) {
		
	}
	
	public SqlSource wrapperSqlSource(MappedStatement ms,SqlSource sqlSource,Object parameter,String method){
		BoundSql originBoundSql = sqlSource.getBoundSql(parameter);
		String sql = originBoundSql.getSql();
		SqlSource wrapper = new SqlSourceWrapper(sqlSource);
		sql = wrapper.getBoundSql(parameter).getSql();
		return wrapper;
		
	}
	public static class SqlSourceWrapper implements SqlSource{
		private SqlSource origin;
		public SqlSourceWrapper(SqlSource origin){
			this.origin = origin;
		}
		@Override
		public BoundSql getBoundSql(Object parameterObject) {
			 BoundSql boundSql = origin.getBoundSql(parameterObject);
	         String sql = boundSql.getSql();
	         Field sqlField = null;
	         try{
	        	 sqlField = BoundSql.class.getDeclaredField("sql");
	         }catch(NoSuchFieldException e){
	        	 e.printStackTrace();
	         }	
	         ReflectionUtils.makeAccessible(sqlField);
	         ReflectionUtils.setField(sqlField, boundSql, sql.toLowerCase());
	         return boundSql;
		}
		
	}
	
}
