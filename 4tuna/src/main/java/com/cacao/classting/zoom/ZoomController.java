package com.cacao.classting.zoom;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cacao.classting.common.util.UtilDateTime;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ZoomController {

	@Autowired
	ZoomServiceImpl service;
	

	@RequestMapping(value = "/zoomList")
	public String zoomList(Model model, Zoom dto) throws Exception {
		
//		api 호출해서 값을 가져온다.
		String apiUrl = "https://api.zoom.us/v2/users/binson1123@naver.com/meetings";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection =(HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		httpURLConnection.setRequestProperty("authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6Ikl0NndnRkR4VGktV2hwQnRqRWpuSXciLCJleHAiOjE2ODU1MDIwMDAsImlhdCI6MTY1Mzk1ODQwNX0.V1kjHKbBxkK_BcL6JgLRS3hNpvKj98s2uYnwrYvC5eo");
		
		BufferedReader bufferedReader;
		if(httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <=300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		}else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line; 
		while((line = bufferedReader.readLine()) != null) {
			System.out.println("line : "+line);
			stringBuilder.append(line);
		}
		
		bufferedReader.close();
		httpURLConnection.disconnect();
		
		System.out.println("stringBuilder.toString() : "+stringBuilder.toString());
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
		
		System.out.println("###################################################################");
		
		for(String key : map.keySet()) {
			String value = String.valueOf(map.get(key));
			System.out.println("[key]: "+key + ", [value]: " + value);
		}
		
		System.out.println("meetings#########################");
		System.out.println("map.get(\"meetings\") : "+map.get("meetings"));
		
		List<Zoom> list = new ArrayList<Zoom>();
		list = (List<Zoom>) map.get("meetings");
		
		model.addAttribute("list",list);
	
		return "/member/classroom/common/zoomList";
	}
	
	@RequestMapping(value = "/zoomCreate")
	public String zoomCreate(Zoom dto, ZoomVo vo, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
//		api 호출해서 값을 가져온다.
		String apiUrl = "https://api.zoom.us/v2/users/binson1123@naver.com/meetings";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection =(HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setRequestProperty("Accept", "application/json; utf-8");
		httpURLConnection.setRequestProperty("authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6Ikl0NndnRkR4VGktV2hwQnRqRWpuSXciLCJleHAiOjE2ODU1MDIwMDAsImlhdCI6MTY1Mzk1ODQwNX0.V1kjHKbBxkK_BcL6JgLRS3hNpvKj98s2uYnwrYvC5eo");
		httpURLConnection.setRequestProperty("Content-Type", "application/json; utf-8");
		httpURLConnection.setDoOutput(true);
		httpURLConnection.setDoInput(true);
		
		System.out.println("dto.getAgenda() : "+dto.getAgenda());
		System.out.println("dto.getTopic() : "+dto.getTopic());
		String jsonInputString = "{\"agenda\" : \"" + dto.getAgenda() + "\", \"topic\": \"" + dto.getTopic() + "\", \"start_time\":  \"" + UtilDateTime.nowStringZoom() + "\"}";
		
//		전송
		OutputStreamWriter osw = new OutputStreamWriter(httpURLConnection.getOutputStream());	
			try{osw.write(jsonInputString);
				osw.flush();				
//		응답	
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
			String line = null;	
			while ((line = br.readLine()) != null) {	
				System.out.println(line);				
		}				
//		닫기
		osw.close();
		br.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();			
		} catch (ProtocolException e) {
			e.printStackTrace();			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();			
		} catch (IOException e) {
			e.printStackTrace();			
		}
		
			
		vo.setAgenda(dto.getAgenda());	
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/zoomList";
	}
	
	@RequestMapping(value = "/zoomDelete")
	public String zoomDelete(Zoom dto, ZoomVo vo, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("dto.getId() : "+dto.getId());
		String jsonInputString = "{\"id\": \"" + dto.getId()+"\" }";

//		api 호출해서 값을 가져온다.
		String apiUrl = "https://api.zoom.us/v2/meetings/"+dto.getId();
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection =(HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("DELETE");
		httpURLConnection.setRequestProperty("Content-Type", "application/json; utf-8");
		httpURLConnection.setRequestProperty("Accept", "application/json; utf-8");
		httpURLConnection.setRequestProperty("authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6Ikl0NndnRkR4VGktV2hwQnRqRWpuSXciLCJleHAiOjE2ODU1MDIwMDAsImlhdCI6MTY1Mzk1ODQwNX0.V1kjHKbBxkK_BcL6JgLRS3hNpvKj98s2uYnwrYvC5eo");
		httpURLConnection.setDoOutput(true);
		httpURLConnection.setDoInput(true);
		

//		전송
		OutputStreamWriter osw = new OutputStreamWriter(httpURLConnection.getOutputStream());	
		try{osw.write(jsonInputString);
		osw.flush();				
//		응답	
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
		String line = null;	
		while ((line = br.readLine()) != null) {	
			System.out.println(line);				
		}				
//		닫기
		osw.close();
		br.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();			
		} catch (ProtocolException e) {
			e.printStackTrace();			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();			
		} catch (IOException e) {
			e.printStackTrace();			
		}
		
		
		vo.setAgenda(dto.getAgenda());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/zoomList";
	}
}
