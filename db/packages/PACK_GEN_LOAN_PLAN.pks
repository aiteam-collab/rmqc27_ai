CREATE OR REPLACE
"PACKAGE pack_gen_loan_plan
"
"AS
"
"
"
"   PROCEDURE proc_gen_fbm_loan_plan(p_bu				VARCHAR2,
"
"   		  	      	    p_rqst_no				VARCHAR2,
"
"			    	    p_user				VARCHAR2,
"
"			    	    p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_gen_rbm_loan_plan(p_bu				VARCHAR2,
"
"   		  	      	    p_rqst_no				VARCHAR2,
"
"			    	    p_user				VARCHAR2,
"
"			    	    p_int_amt		OUT		NUMBER,
"
"				    p_rtn_amt		OUT		NUMBER,
"
"			    	    p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_gen_reschl_fbm_loan_plan(p_bu				VARCHAR2,
"
"   		  	      	    	   p_doc_no			VARCHAR2,
"
"			    	    	   p_user			VARCHAR2,
"
"			    	    	   p_res	OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_fcm_gen_fbm_loan_plan(p_bu				VARCHAR2,
"
"   		  	      	    	p_rqst_no			VARCHAR2,
"
"			    	    	p_user				VARCHAR2,
"
"			    	    	p_instl		OUT		NUMBER,
"
"			    	    	p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_gen_rbm_loan_plan_skm(p_bu				VARCHAR2,
"
"				    	p_rqst_no			VARCHAR2,
"
"				    	p_user				VARCHAR2,
"
"				    	p_int_amt	OUT		NUMBER,
"
"				    	p_rtn_amt	OUT		NUMBER,
"
"				    	p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_post_loan_plan(p_bu				VARCHAR2,
"
"   		  	      	 p_rqst_no			VARCHAR2,
"
"			    	 p_user				VARCHAR2,
"
"			    	 p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_post_reschl_loan_plan(p_bu				VARCHAR2,
"
"				 	p_doc_no			VARCHAR2,
"
"				 	p_user				VARCHAR2,
"
"				 	p_res		OUT		VARCHAR2);
"
"
"
"
"
"END;"
/
