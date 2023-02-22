package vn.dating.chat.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.dating.chat.model.GroupMember;

import java.util.List;

@Repository
public interface GroupMemberRepository extends JpaRepository<GroupMember, Long> {

    // Custom query to find group members by group ID
    List<GroupMember> findByGroupId(Long groupId);

    // Custom query to find group members by user ID
    List<GroupMember> findByUserId(Long userId);
    GroupMember save(GroupMember groupMember);
//    List<GroupMember> saveAll(List<GroupMember> groupMembers);
}

