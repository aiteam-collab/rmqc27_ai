CREATE OR REPLACE
"package WSGOC is
"
"--
"
"-- Web PL/SQL Generator Object Cache
"
"--
"
"
"
"  -- make sure we don't keep this around after a call
"
"  pragma SERIALLY_REUSABLE;
"
"
"
"  MISSING_MANDATORY_ATTRIBUTE exception;
"
"  INVALID_OBJECT_HANDLE       exception;
"
"
"
"  -- Dump output stream
"
"  type OUTPUT_BUF is record (terminate boolean, buff varchar2(255));
"
"  type OUTPUT_STREAM is table of OUTPUT_BUF index by binary_integer;
"
"
"
"  -- New context heading stuff
"
"  -- REF types
"
"  type BRANCH_REF is record (id binary_integer);
"
"  type MODULE_REF is record (id binary_integer);
"
"  type COMPONENT_REF is record (id binary_integer);
"
"  type ITEM_REF is record (id binary_integer);
"
"
"
"  -- List Types
"
"  type BRANCH_REF_LIST is table of BRANCH_REF index by binary_integer;
"
"  type MODULE_REF_LIST is table of MODULE_REF index by binary_integer;
"
"  type COMPONENT_REF_LIST is table of COMPONENT_REF index by binary_integer;
"
"  type ITEM_REF_LIST is table of ITEM_REF index by binary_integer;
"
"
"
"  -- dump output stream
"
"  o OUTPUT_STREAM;
"
"
"
"  -- null refs
"
"  null_branch    BRANCH_REF;
"
"  null_module    MODULE_REF;
"
"  null_component COMPONENT_REF;
"
"  null_item      ITEM_REF;
"
"
"
"  -- types operators
"
"  function IS_NULL(pObj in BRANCH_REF) return boolean;
"
"  function IS_SAME(pLft in BRANCH_REF, pRht in BRANCH_REF) return boolean;
"
"  function IS_NULL(pObj in MODULE_REF) return boolean;
"
"  function IS_SAME(pLft in MODULE_REF, pRht in MODULE_REF) return boolean;
"
"  function IS_NULL(pObj in COMPONENT_REF) return boolean;
"
"  function IS_SAME(pLft in COMPONENT_REF, pRht in COMPONENT_REF) return boolean;
"
"  function IS_NULL(pObj in ITEM_REF) return boolean;
"
"  function IS_SAME(pLft in ITEM_REF, pRht in ITEM_REF) return boolean;
"
"
"
"  -- Constructors
"
"  function BRANCH
"
"  ( pName          in  varchar2 default 'MAIN'
"
"  ) return BRANCH_REF;
"
"
"
"  function MODULE
"
"  ( pShortName             in varchar2
"
"  , pBranch                in BRANCH_REF     default null
"
"  , pFirstTitle            in varchar2       default null
"
"  , pFormattedFirstTitle   in varchar2       default null
"
"  , pCustom                in varchar2       default null
"
"  ) return MODULE_REF;
"
"
"
"  function COMPONENT
"
"  ( pBranch                in BRANCH_REF     default null
"
"  , pModule                in MODULE_REF     default null
"
"  , pContext_For           in COMPONENT_REF  default null
"
"  , pName                  in varchar2       default null
"
"  , pTitle                 in varchar2       default null
"
"  , pFormattedTitle        in varchar2       default null
"
"  , pBeforeText            in varchar2       default null
"
"  , pAfterText             in varchar2       default null
"
"  , pSystemImagePath       in varchar2       default null
"
"  , pCustom                in varchar2       default null
"
"  ) return COMPONENT_REF;
"
"
"
"  function ITEM
"
"  ( pName                  in varchar2       default null
"
"  , pPrompt                in varchar2       default null
"
"  , pIsContext             in boolean        default false
"
"  , pCustom                in varchar2       default null
"
"  ) return ITEM_REF;
"
"
"
"  -- ""Get"" methods
"
"  -- BRANCH
"
"  function GET_Name ( pRef in BRANCH_REF ) return varchar2;
"
"  function GET_Top_Component ( pRef in BRANCH_REF ) return COMPONENT_REF;
"
"
"
"  -- MODULE
"
"  function GET_ShortName (pRef in MODULE_REF ) return varchar2;
"
"  function GET_Branch (pRef in MODULE_REF ) return BRANCH_REF;
"
"  function GET_FirstTitle (pRef in MODULE_REF ) return varchar2;
"
"  function GET_FormattedFirstTitle (pRef in MODULE_REF ) return varchar2;
"
"  function GET_Custom (pRef in MODULE_REF ) return varchar2;
"
"
"
"  -- COMPONENT
"
"  function GET_Branch (pRef in COMPONENT_REF ) return BRANCH_REF;
"
"  function GET_Module (pRef in COMPONENT_REF ) return MODULE_REF;
"
"  function GET_Context_For (pRef in COMPONENT_REF ) return COMPONENT_REF;
"
"  function GET_Depth (pRef in COMPONENT_REF ) return binary_integer;
"
"  function GET_Items (pRef in COMPONENT_REF ) return ITEM_REF_LIST;
"
"  function GET_Name (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_Title (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_FormattedTitle (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_BeforeText (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_AfterText (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_SystemImagePath (pRef in COMPONENT_REF ) return varchar2;
"
"  function GET_Custom (pRef in COMPONENT_REF ) return varchar2;
"
"
"
"  -- ITEM
"
"  function GET_Name (pRef in ITEM_REF ) return varchar2;
"
"  function GET_Prompt (pRef in ITEM_REF ) return varchar2;
"
"  function GET_Value (pRef in ITEM_REF ) return varchar2;
"
"  function GET_IsContext (pRef in ITEM_REF ) return boolean;
"
"  function GET_Custom (pRef in ITEM_REF ) return varchar2;
"
"
"
"  -- ""Set"" methods
"
"  --
"
"  -- COMPONENT
"
"  procedure SET_BeforeText (pRef in COMPONENT_REF, pVal in varchar2 );
"
"  procedure SET_AfterText (pRef in COMPONENT_REF, pVal in varchar2 );
"
"
"
"  -- ITEM
"
"  procedure SET_Value (pRef in ITEM_REF, pVal in varchar2 );
"
"
"
"  -- ""Add"" methods
"
"  -- COMPONENT
"
"  procedure ADD_ITEMS
"
"  ( pRef          in COMPONENT_REF
"
"  , pAddMeRef     in ITEM_REF
"
"  );
"
"
"
"  -- ""Query"" methods
"
"  -- BRANCH
"
"  function GET_BRANCHS
"
"    return BRANCH_REF_LIST;
"
"
"
"  -- MODULE
"
"  function GET_MODULES
"
"    return MODULE_REF_LIST;
"
"
"
"  -- COMPONENT
"
"  function GET_COMPONENTS
"
"    return COMPONENT_REF_LIST;
"
"
"
"  function GET_COMPONENTS
"
"  ( pBranch        in  BRANCH_REF
"
"  ) return COMPONENT_REF_LIST;
"
"
"
"  function GET_COMPONENTS
"
"  ( pModule        in  MODULE_REF
"
"  ) return COMPONENT_REF_LIST;
"
"
"
"  function GET_COMPONENTS
"
"  ( pDepth         in  binary_integer
"
"  ) return COMPONENT_REF_LIST;
"
"
"
"  -- ""dump"" methods
"
"  procedure DUMP_BRANCH
"
"  ( pRef          in  BRANCH_REF
"
"  );
"
"
"
"  procedure DUMP_MODULE
"
"  ( pRef          in  MODULE_REF
"
"  );
"
"
"
"  procedure DUMP_COMPONENT
"
"  ( pRef          in  COMPONENT_REF
"
"  );
"
"
"
"  procedure DUMP_ITEM
"
"  ( pRef          in  ITEM_REF
"
"  );
"
"
"
"end;"
/
