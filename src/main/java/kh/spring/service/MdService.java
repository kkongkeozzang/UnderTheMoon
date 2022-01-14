package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdDAO;
import kh.spring.dto.MdDTO;

@Service
public class MdService {
	
	private final MdDAO mdDAO;
	
	public MdService(MdDAO mdDAO) {
		this.mdDAO = mdDAO;
	}
	
	public List<MdDTO> selectAll() {
		return mdDAO.selectAll();
	}
	
}
