//package com.doanTN.startupDN.clients;
//
//
//import com.doanTN.startupDN.models.dto.UserDto;
//import org.springframework.core.ParameterizedTypeReference;
//import org.springframework.http.*;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.client.RestTemplate;
//
//import java.util.Arrays;
//import java.util.List;
//
//@Service
//public class UserClient {
//    @Transactional
//    public List<UserDto> getALlUser(){
//        RestTemplate restTemplate = new RestTemplate();
//        HttpHeaders httpHeaders = new HttpHeaders();
//        httpHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
//        HttpEntity<UserDto> entity = new HttpEntity<>(httpHeaders);
//        ResponseEntity<List<UserDto>> response = restTemplate.exchange("http://localhost:8080/users",
//                HttpMethod.GET, entity, new ParameterizedTypeReference<List<UserDto>>() {});
//        return response.getBody();
//    }
//
//}
