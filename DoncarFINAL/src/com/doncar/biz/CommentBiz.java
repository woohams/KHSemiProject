package com.doncar.biz;

import java.util.ArrayList;
import java.util.List;

import com.doncar.dao.CommentDao;
import com.doncar.dto.CommentDto;

public class CommentBiz {
	
	private CommentDao dao = new CommentDao();
	
	
	public List<CommentDto> selectlist(CommentDto dto){
		List<CommentDto> list = dao.selectlist(dto);
		return list;
	}
	public CommentDto selectone(int comment_no) {
		CommentDto dto = dao.selectone(comment_no);
		return dto;
	}
	public CommentDto lastnum() {
		return dao.lastnum();
	}
	public int insert(CommentDto dto) {
		int res = dao.insert(dto);
		return res;
	}
	public int update(CommentDto dto) {
		int res = dao.update(dto);
		return res;
	}
	public int delete(int comment_no) {
		List<CommentDto> list = dao.selectgroup(comment_no);
		List<Integer> listnum = new ArrayList<Integer>();
		if(list.size()==1) {
			listnum.add(comment_no);
			return dao.delete(listnum);
		}
		int starttab = -1;
		int start_index = 0;
		int end_index = -1;
		for(int i = 0; i<list.size(); i++) {
			CommentDto dto = list.get(i);
			if(dto.getComment_no()==comment_no) {
				if(dto.getComment_titletab()==0) {
					end_index = list.size()-1;
					break;
				}
				if(i == list.size()-1) {
					start_index = i;
					end_index = i;
					break;
				}
				start_index = i;
			}
			
			if(starttab>-1 && i != start_index) {
				if(dto.getComment_titletab()<=starttab) {
					end_index = i-1;
					break;
				}
			}
		}
		
		for(int i= start_index; i<=end_index;i++) {
			listnum.add(list.get(i).getComment_no());
		}
		int res = dao.delete(listnum);
		return res;
	}
	
	public int commentProc(CommentDto dto) {
		int res = dao.updateReply(dto.getComment_no());
		System.out.println("squpdate 된 로우의 수 : "+ res);
		CommentDto newdto = dao.selectone(dto.getComment_no());
		dto.setComment_group_no(newdto.getComment_group_no());
		dto.setComment_group_sq(newdto.getComment_group_sq());
		dto.setComment_titletab(newdto.getComment_titletab());
		
		res = dao.insertReply(dto);

		return res;
	}


}
