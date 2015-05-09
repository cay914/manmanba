package com.codebattery.mmb.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.codebattery.mmb.enumed.CourseTypeEnum;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Course {

    /**
     */
    private String name;

    /**
     */
    private BigDecimal listPrice;

    /**
     */
    private String description;

    /**
     */
    @Temporal(TemporalType.DATE)
    private Date maxmumCapacity;

    /**
     */
    @Enumerated(EnumType.STRING)
    private CourseTypeEnum courseType;
}
