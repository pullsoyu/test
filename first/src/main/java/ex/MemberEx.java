package ex;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MemberEx {
	public static void main(String[]args) {
		ConnectionPool cp=ConnectionPool.getInstance("jdbc:oracle:thin:@localhost:1521:XE", "ezen", "oracle", 5, 10);
		MemberEx be=new MemberEx();
		boolean flag=true;
		try {
			System.out.println("1~7까지 정수만 입력하세요.");
			System.out.println("1.회원테이블생성");
			System.out.println("2.회원가입");
			System.out.println("3.로그인");
			System.out.println("4.이름 수정");
			System.out.println("5.비밀번호 확인");
			System.out.println("6.회원탈퇴");
			System.out.println("7.종료");
			
			while(flag) {
				Scanner scan=new Scanner(System.in);
				int i=scan.nextInt();
				switch(i) {
				case 1:
					be.createMember(cp);
				case 2:
					be.insertMember(cp);
				case 3:
					be.loginMember(cp);
				case 4:
					be.updateName(cp);
				case 5:
					be.selectPwd(cp);
				case 6:
					be.deleteMember(cp);
					break;
					default:
						if(i==7) {
							System.out.println("종료");
						}else {
							System.out.println("알맞은 번호가 아닙니다.");
						}
						flag=false;
						break;
				}
			}
		}catch(Exception e) {
			System.out.println("종료");
			e.printStackTrace();
		}finally {
			cp.closeAll();
		}
	}
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public void createMember(ConnectionPool cp)throws SQLException{
		String sql="create table memberex(id varchar2(20) primary key, "
				+"password varchar2(20) not null, "
				+"name varchar2(20) not null, "
				+"email varchar2(100))";
		conn=cp.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.executeQuery();
		
		if(conn!=null)
			cp.releaseConnection(conn);
	}
	public void insertMember(ConnectionPool cp)throws IOException,SQLException{
		try {
			String id=consoleInput("id");
			String password=consoleInput("password");
			String name=consoleInput("name");
			String email=consoleInput("email");
			
			conn=cp.getConnection();
			pstmt=conn.prepareStatement("insert into memberex values(?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			int i=pstmt.executeUpdate();
			
			if(i==0) {
				System.out.println("입력실패");
			}else {
				System.out.println("입력성공");
			}
		}finally {
			if(conn!=null)
				cp.releaseConnection(conn);
		}
	}
	public String consoleInput(String input)throws IOException{
		BufferedReader br=null;
		String message=null;
		try {
			System.out.println(input+":");
			InputStreamReader isr=new InputStreamReader(System.in);
			br=new BufferedReader(isr);
			message=br.readLine();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	public void loginMember(ConnectionPool cp)throws IOException,SQLException{
		String id=consoleInput("id");
		String password=consoleInput("password");
		try {
			conn=cp.getConnection();
			pstmt=conn.prepareStatement("select id,password from memberex where id=? and password=?");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("로그인 성공");
			}else {
				System.out.println("로그인 실패");
			}
		}finally {
			if(conn!=null)
				cp.releaseConnection(conn);
		}
	}
	public void updateName(ConnectionPool cp)throws IOException,SQLException{
		try {
			String id=consoleInput("id");
			String name=consoleInput("name");
			
			conn=cp.getConnection();
			pstmt=conn.prepareStatement("update memberex set name=? where id=?");
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			
			int i=pstmt.executeUpdate();
			
			if(i!=0) {
				System.out.println("이름 변경");
			}else {
				System.out.println("해당 id없음");
			}
		}finally {
			if(conn!=null)
				cp.releaseConnection(conn);
		}
	}
	public void selectPwd(ConnectionPool cp)throws IOException,SQLException{
		try {
			String id=consoleInput("id");
			String name=consoleInput("name");
			
			conn=cp.getConnection();
			pstmt=conn.prepareStatement("select password from memberex where id=? and name=?");
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("password:::"+rs.getString("password"));
			}else {
				System.out.println("id나 이름이 틀림");
			}
		}finally {
			if(conn!=null)
				cp.releaseConnection(conn);
		}
	}
	public void deleteMember(ConnectionPool cp)throws IOException,SQLException{
		String id=consoleInput("id");
		String password=consoleInput("password");
		try {
			conn=cp.getConnection();
			pstmt=conn.prepareStatement("delete from memberex where id=? and password=?");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			int i=pstmt.executeUpdate();
			
			if(i!=0) {
				System.out.println("회원탈퇴");
			}else {
				System.out.println("탈퇴 실패");
			}
		}finally {
			if(conn!=null)
				cp.releaseConnection(conn);
		}
	}

}
