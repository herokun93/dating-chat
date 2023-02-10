package vn.dating.chat.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import vn.dating.chat.model.User;

import java.util.List;
import java.util.Optional;

@EnableJpaRepositories
public interface UserRepository extends JpaRepository<User,Long> {


    Optional<User> findByEmail(String email);
    Optional<User> findByUsername(String name);


    @Modifying
    @Query(value = "SELECT id FROM users WHERE id =?1 ",nativeQuery = true)
    List findUserById(Long id);

    @Modifying
    @Query(value = "SELECT id FROM users WHERE id =?1 ",nativeQuery = true)
    List existsUserById( Long id);


    Optional<User> findByCreateToken(String token);
    Optional<User>findByEmailAndPassword(String email,String password);

    Boolean existsByEmail(String email);

}
