// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.codebattery.mmb.domain;

import com.codebattery.mmb.domain.SysUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SysUser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SysUser.entityManager;
    
    public static final List<String> SysUser.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name");
    
    public static final EntityManager SysUser.entityManager() {
        EntityManager em = new SysUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SysUser.countSysUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SysUser o", Long.class).getSingleResult();
    }
    
    public static List<SysUser> SysUser.findAllSysUsers() {
        return entityManager().createQuery("SELECT o FROM SysUser o", SysUser.class).getResultList();
    }
    
    public static List<SysUser> SysUser.findAllSysUsers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SysUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SysUser.class).getResultList();
    }
    
    public static SysUser SysUser.findSysUser(Long id) {
        if (id == null) return null;
        return entityManager().find(SysUser.class, id);
    }
    
    public static List<SysUser> SysUser.findSysUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SysUser o", SysUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<SysUser> SysUser.findSysUserEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SysUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SysUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SysUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SysUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SysUser attached = SysUser.findSysUser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SysUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SysUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SysUser SysUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SysUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
