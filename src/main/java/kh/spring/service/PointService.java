package kh.spring.service;


import java.util.Optional;

import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dao.PointDAO;

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
	   
	   Optional<Integer> op = Optional.ofNullable(result);
	   
	   return op;
   }

}
