package kh.spring.service;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dao.PointDAO;
import kh.spring.dto.PointDTO;

@Service
public class PointService {
   
   private final PointDAO pointDAO;
   private final MemberDAO memberDAO;
   
   public PointService(PointDAO pointDAO,MemberDAO memberDAO) {
      this.pointDAO = pointDAO;
      this.memberDAO = memberDAO;
   }

   public Integer insertRecommendMemberPoint(Integer id) {
      return pointDAO.insertRecommendMemberPoint(id);
   }
   
   public Integer insertEventMemberPoint(Integer id) {
      return pointDAO.insertEventMemberPoint(id);
   }

   public Optional<Integer> selectPointById(String username) {
	   
	   Integer member_id = memberDAO.selectIdByUsername(username);
	   
	   Integer result = pointDAO.selectPointById(member_id);
	   System.out.println(member_id+result);
	   Optional<Integer> op = Optional.ofNullable(result);
	   
	   return op;
   }
   
   public List<PointDTO> selectPointListById(Integer member_id) {
	   
	   return pointDAO.selectPointListById(member_id);
   }

   public Integer insertNotInputEvent(Integer id) {
	   return pointDAO.insertNotInputEvent(id);
   }

public Integer insertUsedPoint(Integer member_id, Integer pointSum) {
	
	return  pointDAO.insertUsedPoint(member_id,pointSum);
}


public Integer savePoints(Integer member_id, Integer productTotal) {
	
	return pointDAO.savePoints(member_id,productTotal);
}

	public Integer insertRecomendadoMemberPoint(Integer id) {
		return pointDAO.insertRecomendadoMemberPoint(id);
	}
	
	public int selectRecordCount(Integer member_id) {
		return pointDAO.selectRecordCount(member_id);
	}


	public List<PointDTO> selectByBound(Integer member_id, int start, int end) {
		return pointDAO.selectByBound(member_id, start, end);
	}
	
	public List<PointDTO> selectAll(){
		return pointDAO.selectAll();
	}
	public int insertPoint(PointDTO points) {
		return  pointDAO.insertPoint(points);
	}
	public int deletePoint(int point_id) {
		return  pointDAO.deletePoint(point_id);
	}
	public int updatePoint(PointDTO points) {
		return  pointDAO.updatePoint(points);

	}
	
	public int deletePointByMemberId(String member_id) {
		return pointDAO.deletePointByMemberId(member_id);
	}
	
	public Integer insertKhEventMemberPoint(String id) {
		   return pointDAO.insertKhEventMemberPoint(id);
	}
	 
	public int selectByIdandCheckKhEvent(String id) {
		return pointDAO.selectByIdandCheckKhEvent(id);
	}
}
