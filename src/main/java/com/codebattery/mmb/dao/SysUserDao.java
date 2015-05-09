package com.codebattery.mmb.dao;
import com.codebattery.mmb.domain.SysUser;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = SysUser.class)
public interface SysUserDao {
}
