package com.doncar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doncar.dto.CommentDto;

public class CommentDao extends SqlMapConfig {

	private String namespace = "comment.";
	SqlSession session = null;

	public List<CommentDto> selectlist(CommentDto dto) {
		List<CommentDto> list = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			System.out.println(dto);
			list = session.selectList(namespace + "selectlist", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public CommentDto selectone(int comment_no) {
		CommentDto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "selectone", comment_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}

	public List<CommentDto> selectgroup(int comment_no) {
		List<CommentDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "grouplist", comment_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public int insert(CommentDto dto) {
		int res = 0;
		System.out.println(dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public CommentDto lastnum() {
		CommentDto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "lastnum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}

	public int update(CommentDto dto) {
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int delete(List<Integer> list) {
		Connection con = null;
		PreparedStatement pstm = null;
		int res = 0;

		int[] cnt = null;
		String sql = " DELETE FROM DONCAR_COMMENT " + " WHERE COMMENT_NO = ? ";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String password = "kh";

		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			pstm = con.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pstm.setInt(1, list.get(i));

				pstm.addBatch();
			}

			cnt = pstm.executeBatch();
			for (int i = 0; i < cnt.length; i++) {
				if (cnt[i] == -2) {
					res++;
				}
			}
			if (res == list.size()) {
				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return res;

	}

	public int updateReply(int comment_no) {
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "update_sq", comment_no);
			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int insertReply(CommentDto dto) {
		int res = 0;
		System.out.println(dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert_reple", dto);
			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
