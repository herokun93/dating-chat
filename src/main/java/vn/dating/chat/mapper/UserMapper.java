package vn.dating.chat.mapper;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import vn.dating.chat.dto.auth.UserDto;
import vn.dating.chat.dto.messages.api.ContactDto;
import vn.dating.chat.model.User;

import java.lang.reflect.Type;
import java.util.List;

public class UserMapper {
    public static UserDto toGetUser(User user){
        ModelMapper modelMapper = new ModelMapper();
        UserDto userDto = modelMapper.map(user,UserDto.class);
        return  userDto;
    }
    public static ContactDto toGetContact(User user){
        ModelMapper modelMapper = new ModelMapper();
        ContactDto contactDto = modelMapper.map(user,ContactDto.class);
        return  contactDto;
    }

    public static List<UserDto> toGetListUsers(List<User> users){
        ModelMapper modelMapper = new ModelMapper();
        Type listType = new TypeToken<List<UserDto>>() {}.getType();
        return modelMapper.map(users,listType);
    }
}
