package kh.spring.util;

import java.util.HashMap;
import java.util.Map;
 
import org.springframework.http.MediaType;
 
public class MediaUtils {
    private static Map<String,MediaType> mediaMap;
    
    //클래스를 로딩할 때 제일 먼저 실행되는 코드
    
    //파일을 업로드할때 해당되는 형식을 리턴하는 클래스
    
    //static로 만들어놓았기 때문에 이 부분은 처음부터 메모리에 올라가있는 상태이다.
    
    static {
        mediaMap = new HashMap<>(); //키와 값을 저장해야 하기 때문에 HashMap<>를 사용
        mediaMap.put("JPG",MediaType.IMAGE_JPEG); //JPG 값을 저장
        mediaMap.put("GIF",MediaType.IMAGE_GIF); //GIF 값을 저장
        mediaMap.put("PNG",MediaType.IMAGE_PNG); //PNG 값을 저장
    }
    
    public static MediaType getMediaType(String type) {
        // toUpperCase() 대문자로 변경
        return mediaMap.get(type.toUpperCase()); //mediaMap안에 저장되어 있는 형식 (jpg,gif,png)이면 그림파일, 아니면 일반파일로 구분함
    }    //toUpperCase() 메소드는 대문자로 바꿔주는 메소드
}

