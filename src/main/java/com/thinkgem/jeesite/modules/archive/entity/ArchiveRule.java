/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 分类规则Entity
 * @author lisy
 * @version 2017-12-11
 */
public class ArchiveRule extends DataEntity<ArchiveRule> {
	
	private static final long serialVersionUID = 1L;
	private String ruleName;		// rule_name
	private String ruleLength;		// rule_length
	
	public ArchiveRule() {
		super();
	}

	public ArchiveRule(String id){
		super(id);
	}

	@Length(min=0, max=50, message="rule_name长度必须介于 0 和 50 之间")
	public String getRuleName() {
		return ruleName;
	}

	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	
	@Length(min=0, max=12, message="rule_length长度必须介于 0 和 12 之间")
	public String getRuleLength() {
		return ruleLength;
	}

	public void setRuleLength(String ruleLength) {
		this.ruleLength = ruleLength;
	}
	
}