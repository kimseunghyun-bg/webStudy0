package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ScoreDAO {
	private Connection conn=DBConn.getConnection();
	
	public int insertScore(ScoreDTO dto){
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql="INSERT INTO score(hak,name,birth,kor,eng,mat)";
			sql+=" VALUES (?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			
			result=pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int dataCount(){
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT COUNT(*) FROM score";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public List<ScoreDTO> listScore(){
		List<ScoreDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		StringBuffer sb=new StringBuffer();
		try {
			sb.append("SELECT hak, name, ");
			sb.append(" to_CHAR(birth, 'yyyy-mm-dd') birth, ");
			sb.append(" kor, eng, mat, (kor+eng+mat) tot, ");
			sb.append(" (kor+eng+mat)/3 ave, ");
			sb.append(" RANK() OVER(ORDER BY (kor+eng+mat) DESC) rank ");
			sb.append(" FROM score");
			
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ScoreDTO dto=new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public List<ScoreDTO> listScore(int start, int end){
		List<ScoreDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		StringBuffer sb=new StringBuffer();
		try {
			sb.append("SELECT * FROM (");
			sb.append("	 SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("    SELECT hak, name, ");
			sb.append("    to_CHAR(birth, 'yyyy-mm-dd') birth, ");
			sb.append("    kor, eng, mat, (kor+eng+mat) tot, ");
			sb.append("    (kor+eng+mat)/3 ave, ");
			sb.append("    RANK() OVER(ORDER BY (kor+eng+mat) DESC) rank ");
			sb.append("    FROM score");
			sb.append("    ORDER BY hak ASC");
			sb.append("  ) tb WHERE ROWNUM <= ?");
			sb.append(") WHERE rnum >= ?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ScoreDTO dto=new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public ScoreDTO readScore(String hak){
		ScoreDTO dto=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT hak, name, ";
			sql+=" TO_CHAR(birth, 'yyyy-mm-dd') birth, ";
			sql+=" kor, eng, mat ";
			sql+=" FROM score WHERE hak=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	public int updateScore(ScoreDTO dto){
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="UPDATE score SET name=?, birth=?, ";
			sql+=" kor=?, eng=?, mat=? WHERE hak=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());
			
			result=pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int deleteScore(String hak){
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="DELETE FROM score WHERE hak=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			result=pstmt.executeUpdate();
			
			pstmt.close();
			pstmt=null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int deleteList(String[] haks){
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			if(haks==null)
				return result;
			
			sql="DELETE FROM score WHERE hak IN (";
			for(int i=0; i<haks.length; i++)
				sql+="?,";
			
			sql=sql.substring(0, sql.length()-1)+")";
			
			pstmt=conn.prepareStatement(sql);
			for(int i=0; i<haks.length; i++)
				pstmt.setString(i+1, haks[i]);

			result=pstmt.executeUpdate();

			pstmt.close();
			pstmt=null;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
