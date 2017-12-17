ALTER TABLE jeesite.doc_concrete
 CHANGE cost_prices cost_prices VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '成本参考核算单价',
 CHANGE tax_rate tax_rate VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '税率';
