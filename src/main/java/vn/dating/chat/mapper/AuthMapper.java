package vn.dating.chat.mapper;

import org.modelmapper.ModelMapper;
import vn.dating.chat.dto.auth.AuthDto;
import vn.dating.chat.model.Token;

import java.util.ArrayList;
import java.util.List;

public class AuthMapper {
    public static AuthDto userToAuth(Token token){
        ModelMapper modelMapper = new ModelMapper();
        AuthDto authDto = modelMapper.map(token, AuthDto.class);
        return  authDto;
    }
    public static List<AuthDto> toGetListAccess(List<Token> tokens){

        List<AuthDto> authDtos = new ArrayList<>();
        tokens.forEach(token -> {
            authDtos.add(userToAuth(token));
        });
        return  authDtos;
    }
}
