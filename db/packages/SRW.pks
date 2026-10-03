CREATE OR REPLACE
"PACKAGE SRW
"
"IS
"
"   -- ==========================================================================
"
"   -- Title   :  event-based reporting API
"
"   -- Purpose :  This API enables the user to trigger reports from within the
"
"   --            database. It offers seven published functions
"
"   --            ADD_PARAMETER    ... Add a parameter to a parameter-list
"
"   --            REMOVE_PARAMETER ... remove a parameter from a list
"
"   --            CLEAR_PARAMETER  ... remove ALL entries from a parameter-list
"
"   --            BUILD_URL        ... build a syntactical correct URL
"
"   --            RUN_REPORT       ... for sending a requests to the server
"
"   --            REPORT_STATUS    ... for getting the status of a given job
"
"   --            CANCEL_REPORT    ... to cancel a job
"
"   -- --------------------------------------------------------------------------
"
"   -- Author  :  Philipp Weckerle
"
"   -- --------------------------------------------------------------------------
"
"   --
"
"   -- DEPENDENCIES
"
"   -- ------------
"
"   --   *) Oracle XDK (Parser and DOM)
"
"   --   *) User-defined types SRW_PARAMETER and SRW_PARAMLIST
"
"   --
"
"   -- Installation :
"
"   --   this script is invoked by the installation-script SRWAPIINS.SQL
"
"   --
"
"   -- HISTORY
"
"   -- Date     | Done by     | Task
"
"   -- ---------+-------------+--------------------------------------------------
"
"   -- 15-09-00 | PWECKERL.AT | First API-Version finalized
"
"   --          |             | Handover to SLIN on 14-09-00
"
"   -- 27-03-03 | PWECKERL.US | BUG 2873683 : Changed format of timing info in
"
"   --          |             | Status_Record to VarChar2(50); removed to_date
"
"   --          |             | from FillStatusRecord() for timing info.
"
"
"
"   --
"
"
"
"   -- Type declarations
"
"   -- ---------------------
"
"   TYPE StringTable IS TABLE OF VARCHAR2 (128)
"
"      INDEX BY BINARY_INTEGER;
"
"
"
"   TYPE Job_Ident IS RECORD
"
"   (
"
"      GatewayURL   VARCHAR2 (255),               -- Gateway URL to the Server,
"
"      -- where the report actuly run on
"
"      ServerName   VARCHAR2 (255), -- name of the server, the report was run on
"
"      JobID        NUMBER,                                 -- JobID of the Job
"
"      AUTHID       VARCHAR2 (255)               -- AuthID used to query status
"
"   );
"
"
"
"
"
"   TYPE Status_Record IS RECORD
"
"   (
"
"      JobIdent     Job_Ident,                                -- containing the
"
"      -- job-identification-information
"
"      JobType      VARCHAR2 (16),            -- represents the type of the job
"
"      QUEUE        VARCHAR2 (16), -- where the job is queued i.e. Current, Done,
"
"      -- Scheduled
"
"      JobName      VARCHAR2 (128),                          -- name of the Job
"
"      StatusCode   NUMBER,                                       -- Statuscode
"
"      StatusText   VARCHAR2 (2000),           -- Additional Status Information
"
"      JobOwner     VARCHAR2 (64),                          -- Owner of the Job
"
"      OutputType   VARCHAR2 (16),                     -- OutputType (=DesType)
"
"      OutputName   VARCHAR2 (128),                    -- OutputName (=Desname)
"
"      QueuedAt     VARCHAR2 (50),                       -- with current/done :
"
"      -- <Queued>, when scheduled : <LastRunAt>
"
"      StartedAt    VARCHAR2 (50),                       -- with current/done :
"
"      -- <Started>, when scheduled : N/A
"
"      FinishedAt   VARCHAR2 (50),                       -- with current/done :
"
"      -- <Finished>, when scheduled : N/A
"
"      NextRunAt    VARCHAR2 (50),                       -- with current/done :
"
"      -- N/A, when scheduled : NextRunAt
"
"      ParentJob    NUMBER,                 -- ID of the job, that this one was
"
"      -- instantiated from
"
"      Files        StringTable          -- files indexed by destination index.
"
"   );
"
"
"
"
"
"   -- Constant declarations
"
"   -- ---------------------
"
"
"
"   -- Message Constants
"
"   --
"
"   STARLN                       CONSTANT VARCHAR2 (80)
"
"                                            := '****************************************' ;
"
"   WELCOME                      CONSTANT VARCHAR2 (80)
"
"                                            := '* WELCOME TO EVENT-BASED-REPORTING API *' ;
"
"   VERSION                      CONSTANT VARCHAR2 (80)
"
"                                            := '* API-Version : 9i                     *' ;
"
"   COPYRGT                      CONSTANT VARCHAR2 (80)
"
"                                            := '* (C) Oracle Corporation, 2000 - 2002  *' ;
"
"
"
"   -- defines the string that switches statusoutput to XML
"
"   REPSRV_STATUSFORMAT_STRING   CONSTANT VARCHAR2 (80) := 'statusformat=xml';
"
"   -- command fof getting status-info
"
"   REPSVR_GET_STATUS            CONSTANT VARCHAR2 (64) := 'showjobid';
"
"   -- command for killing a job
"
"   REPSVR_CANCEL_JOB            CONSTANT VARCHAR2 (64) := 'killjobid';
"
"   -- command for running a report
"
"   REPSVR_RUN_REPORT            CONSTANT VARCHAR2 (64) := 'RUN_REPORT';
"
"
"
"   -- Date-Format used to convert the timing-info in FillReturnRecord
"
"   -- obsolete due to fix for bug 2873683
"
"   DATE_FORMAT                  CONSTANT VARCHAR2 (22) := 'MM/DD/YY HH:MI AM';
"
"
"
"   -- Constants for Status_Code (same as zrcct_jstype)
"
"   UNKNOWN                      CONSTANT NUMBER (2) := 0;       -- no such job
"
"   ENQUEUED                     CONSTANT NUMBER (2) := 1; -- job is waiting in queue
"
"   OPENING                      CONSTANT NUMBER (2) := 2;    -- opening report
"
"   RUNNING                      CONSTANT NUMBER (2) := 3;    -- running report
"
"   FINISHED                     CONSTANT NUMBER (2) := 4;  -- job has finished
"
"   TERMINATED_W_ERR             CONSTANT NUMBER (2) := 5; -- job has terminated with error
"
"   CRASHED                      CONSTANT NUMBER (2) := 6; -- engine has crashed when running
"
"   CANCELED                     CONSTANT NUMBER (2) := 7; -- job is canceled upon user request
"
"   SERVER_SHUTDOWN              CONSTANT NUMBER (2) := 8; -- job is canceled as server is
"
"   -- shut down
"
"   WILL_RETRY                   CONSTANT NUMBER (2) := 9; -- job has failed and is waiting
"
"   -- for retrying
"
"   SENDING_OUTPUT               CONSTANT NUMBER (2) := 10; -- job is sending its output
"
"   TRANSFERED                   CONSTANT NUMBER (2) := 11; -- the job has been transfered to
"
"   -- another server in the cluster
"
"   VOID_FINISHED                CONSTANT NUMBER (2) := 12; -- finished job but voided
"
"   ERROR_FINISHED               CONSTANT NUMBER (2) := 13; -- finished but some distribution
"
"   -- failed
"
"   DISTRIBUTE                   CONSTANT NUMBER (2) := 14; -- distributing reports output
"
"
"
"   -- Constants for Status-Code
"
"   -- general returncodes
"
"   API_SUCCESS                  CONSTANT NUMBER (4) := 0; -- operation successfull
"
"   JOB_SUCCESSFULLY_SUBMITTED   CONSTANT NUMBER (5) := 4; -- submission successfull
"
"
"
"   -- 12xx ..... parameter-list management - functioncodes
"
"   OVERWRITE_IF_EXISTS          CONSTANT NUMBER (4) := 121; -- overwrite parameter
"
"   CHECK_FOR_EXISTANCE          CONSTANT NUMBER (4) := 122; -- check if parameter exists
"
"
"
"   -- exceptions
"
"   -- specified functioncode is unknown
"
"   UNKNOWN_FUNCTIONCODE                  EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (UNKNOWN_FUNCTIONCODE, -20001);
"
"   -- no protocol specified with GatewayURL
"
"   SPECIFY_PROTOCOL                      EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (SPECIFY_PROTOCOL, -20002);
"
"   -- SERVER-parameter is missing
"
"   NO_SERVER_SPECIFIED                   EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (NO_SERVER_SPECIFIED, -20003);
"
"   -- DESTYPE= CACHE|PREVIEW|SCREEN not vaild for API
"
"   DESTYPE_NOT_VALID                     EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (DESTYPE_NOT_VALID, -20004);
"
"   -- Request failed; for error see Last_Status.StatusText
"
"   REPORTS_SERVER_ERROR                  EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (REPORTS_SERVER_ERROR, -20998);
"
"   -- Request failed; for error see Last_Status.StatusText
"
"   REQUEST_FAILED                        EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (REQUEST_FAILED, -20999);
"
"
"
"   -- 11xx ..... parameter-list management - returncodes
"
"   -- operation successfull
"
"   PARAMETER_ALREADY_EXISTS              EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (PARAMETER_ALREADY_EXISTS, -20111);
"
"
"
"   -- 21xx ..... HTTP-Request - returncodes
"
"   -- Initialization of util_http failed
"
"   HTTP_INIT_FAILED                      EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (HTTP_INIT_FAILED, -20211);
"
"   -- HTTP-Request failed
"
"   HTTP_REQUEST_FAILED                   EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (HTTP_REQUEST_FAILED, -20212);
"
"   -- Return-Stream of request is too long, do not overwrite it
"
"   HTTP_STREAM_TOO_LONG                  EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (HTTP_STREAM_TOO_LONG, -20213);
"
"
"
"   -- 31xx ..... XML-Processing - returncodes
"
"   -- Specified tag does not exist in stream
"
"   XML_TAG_DOES_NOT_EXIST                EXCEPTION;
"
"   PRAGMA EXCEPTION_INIT (XML_TAG_DOES_NOT_EXIST, -20311);
"
"
"
"   -- Variable declarations
"
"   -- ---------------------
"
"   XML_Source                            VARCHAR2 (32767); -- get_XML; -- SET DEFAULT VALUE TO DUMMY-XML FOR TESTING
"
"   XML_Document                          XMLDom.DOMdocument; -- represents the parsed return-value
"
"   -- of the http-request
"
"   User_Parameter                        SRW_Parameter; -- a singel user-parameter
"
"   EmptyParamList                        SRW_ParamList; -- as default for parameter lists
"
"   Debugging                             BOOLEAN; -- Toggles debugging-messages
"
"   Proxy_to_use                          VARCHAR2 (255); -- Proxy setting to use for http-request
"
"   Last_Status                           Status_Record; -- will hold full status information of run_report
"
"   ForcePortalSettings                   BOOLEAN := TRUE; -- always use Portal/WebDB-settings
"
"
"
"   -- is set by Check_Installation at init of
"
"   -- package. Can be changed by User.
"
"   -- Function and procedure declarations
"
"   -- -----------------------------------
"
"   FUNCTION installed
"
"      RETURN VARCHAR2;
"
"
"
"   PROCEDURE Start_Debugging;                    -- turn debugging-messages ON
"
"
"
"   PROCEDURE Stop_Debugging;                    -- turn debugging-messages OFF
"
"
"
"   PROCEDURE ADD_PARAMETER (
"
"      p_paramList   IN OUT SRW_ParamList,
"
"      p_name        IN     VARCHAR2,
"
"      p_value       IN     VARCHAR2,
"
"      p_mode        IN     NUMBER DEFAULT CHECK_FOR_EXISTANCE);
"
"
"
"   FUNCTION getParameterValue (p_paramList       IN SRW_ParamList,
"
"                               p_parameterName   IN VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   PROCEDURE remove_parameter (p_paramList   IN OUT SRW_ParamList,
"
"                               p_name        IN     VARCHAR2);
"
"
"
"   PROCEDURE clear_parameter_list (p_paramList IN OUT SRW_ParamList);
"
"
"
"   FUNCTION run_report (p_paramList IN SRW_ParamList)
"
"      RETURN Job_Ident;
"
"
"
"   FUNCTION build_url (p_paramlist   IN SRW_ParamList,
"
"                       p_command     IN VARCHAR2 DEFAULT REPSVR_RUN_REPORT)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION report_status (
"
"      p_job_details   IN Job_Ident,
"
"      p_paramList     IN SRW_ParamList DEFAULT EmptyParamList)
"
"      RETURN Status_Record;
"
"
"
"   FUNCTION SUBMIT_REQUEST (P_URL IN VARCHAR2)
"
"      RETURN NUMBER;
"
"   PROCEDURE cancel_report (
"
"      p_job_details   IN Job_Ident,
"
"      p_paramList     IN SRW_ParamList DEFAULT EmptyParamList);
"
"END SRW;"
/
