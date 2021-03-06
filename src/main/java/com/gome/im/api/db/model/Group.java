package com.gome.im.api.db.model;

import java.io.Serializable;

/**
 * Created by wangshikai on 2016/2/19.
 */
public class Group implements Serializable {
    private long id;
    private String groupId;
    private long uid; //群主id
    private int type;
    private String groupName;
    private String groupDesc;
    private String avatar;
    private String qRcode;
    private int capacity;
    private int isAudit;
    private int stickies;
    private int isDele;
    private long createTime;
    private long updateTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public String getGroupDesc() {
        return groupDesc;
    }

    public void setGroupDesc(String groupDesc) {
        this.groupDesc = groupDesc;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getqRcode() {
        return qRcode;
    }

    public void setqRcode(String qRcode) {
        this.qRcode = qRcode;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getIsAudit() {
        return isAudit;
    }

    public void setIsAudit(int isAudit) {
        this.isAudit = isAudit;
    }

    public int getStickies() {
        return stickies;
    }

    public void setStickies(int stickies) {
        this.stickies = stickies;
    }

    public int getIsDele() {
        return isDele;
    }

    public void setIsDele(int isDele) {
        this.isDele = isDele;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(long updateTime) {
        this.updateTime = updateTime;
    }
}
